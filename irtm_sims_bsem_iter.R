run_iter_b <- function(sim_data){
  
  ## set constants:
  nsamp <- 1000
  nburn <- 2000
  thin <- 1
  sigma_sqr <- 1
  seed <- 102924
  
  ## list to unpack:

  # Yall, d, M, nburn, nsamp, true_theta, feature_names
  # true_sigma
  d <- sim_data$d
  M <- sim_data$M
  Y <- sim_data$Y
  Yall <- sim_data$Yall
  true_theta_all <- sim_data$true_theta_all
  true_Sigma <- sim_data$true_Sigma
  true_lambda <- sim_data$true_lambda
  feature_names <- sim_data$feature_names
  
  ## Declare objects
  
  run_time <- list()
  theta_mse  <- list()
  lambda_mse  <- list()
  theta_cov <- list()
  lambda_cov  <- list()
  

  
  ##### IRT-M setup and run #####
  print("Running IRT-M")
  irtm_start <- Sys.time()
  irt_res <- M_constrained_irt(Yall, d, M=M, theta_fix = NULL, which_fix = NULL, 
                               nburn = nburn, nsamp=nsamp, thin=1, learn_Sigma=TRUE, 
                               display_progress = TRUE)
  irtm_end <- Sys.time()
  run_time <- c(run_time, irtm = as.numeric(irtm_end - irtm_start))
  
  # Calculate metrics for IRT-M
  ## theta average:
  theta_avg <- 0
  theta_avg <- theta_avg + irt_res$theta[,,]
  
  ## lambda average:
  lambda_avg <- 0
  lambda_avg <- lambda_avg + irt_res$lambda[,,]
  
  ## IRTM Metrics
  theta_mse <- c(theta_mse, irtM=mse_unstd(theta_avg, true_theta_all, TRUE))
  lambda_mse <- c(lambda_mse, irtM=mse_unstd(lambda_avg, true_lambda, TRUE))
  theta_cov <- c(theta_cov, irtM=coverage(theta_avg, true_theta_all))
  lambda_cov <- c(lambda_cov, irtM=coverage(lambda_avg, true_lambda))
  
  ##### CFA and SEM #####
  print("Running BCFA and BSEM")
  
  ## Format data for cfa input: 
  bcfa_mod <- cfa_format(M = M, vars = feature_names, dims = d)
  bcfa_cor <- corr_format(true_Sigma, corrthresh = .25)
  
  ## drop empty model loadings:
  bcfa_mod <- grep("X[0-9]+", bcfa_mod, value = TRUE)
  ##%%%%%%%%%%%% Fit SEM %%%%%%%%%%%%%%%%%%%%%%%%%%
  
fit_bsem <- tryCatch({
    bsem_start <- Sys.time()
    bsem(model = c(bcfa_mod, bcfa_cor), 
         data = Yall, 
         sample = nsamp,
         burnin = nburn,
         save.lvs=TRUE)
  }, error = function(e) {
    list(error = TRUE, message = conditionMessage(e))
    NA
  })
  bsem_end <- Sys.time()
  bsem_time <- as.numeric(bsem_end - bsem_start)
  run_time <- c(run_time, bsem = bsem_time)
  
  ## Catch multiple ways to identify a failed run:
  bsem_status = ifelse(is.na(fit_bsem) == TRUE, 
                      0, ## BSEM failed
                      ifelse(fit_bsem@Fit@converged == FALSE,
                             0, ## SEM failed to converge ##  
                             1)) ## SEM success 
  
  ## Record metrics
  if(bsem_status == 0){
    ## if SEM crashed, record no results for the run
    theta_mse <- c(theta_mse, bsem=NA)
    lambda_mse <- c(lambda_mse,bsem=NA)
  }else{ ## if SEM runs:
    print('computing BSEM fit metrics')
    ## blavPredict catches all samples (burnin and nsamp)
    ## Needs to be pruned to just the samples and compressed:
    factor_scores_bsem <- blavPredict(fit_bsem,
                                      type='lv', # posterior distribution of thetas
                                      )
    
    # Make sure the burn-in is pruned out:
    # format to extract mean:
    bsem_theta_avg <-blav_theta_samp_means(factor_scores_bsem)
    
    theta_mse <- c(theta_mse, bsem=mse_unstd(bsem_theta_avg, 
                                            true_theta_all, TRUE))
  }

  ##%%%%%%%%%%%%%%%% Fit CFA %%%%%%%%%%%%%%%%%%%
  print('computing fit CFA')
  bcfa_start <- Sys.time()
  fit_bcfa <-tryCatch({
    #supressWarnings(
    bcfa(
      model =  c(bcfa_mod, bcfa_cor), 
      data = Yall, 
      sample = nsamp,
      burnin = nburn, 
      save.lvs=TRUE)
    #)
  },error = function(e) {
    list(error = TRUE, message = conditionMessage(e))
    NA ## return value in case of error
  })
  
  bcfa_end <- Sys.time()
  bcfa_time <- as.numeric(bcfa_end - bcfa_start)
  run_time <- c(run_time, bcfa = bcfa_time)
  
  ## catch if CFA failed:
  ## make one item that codes for either an NA value
  ## or non-convergence:
  
  ## 0 if fit_cfa is null, 0 if fit CFA exists but did not converge
  ## else 1 to show a CFA model
  
  bcfa_status = ifelse(is.na(fit_bcfa) == TRUE, 
                      0, ## CFA failed
                      ifelse(fit_bcfa@Fit@converged == FALSE,
                             0, ## CFA failed to converge ##  
                             1)) ## CFA success 
  
  
  if(bcfa_status == 0 ){ ## CFA failed or did not converge
    ## if CFA crashed, record no results for the run
    theta_mse <- c(theta_mse, bcfa=NA)
    lambda_mse <- c(lambda_mse, bcfa=NA)
  }else{ ## if CFA runs:
    print('computing CFA metrics')
    factor_scores_bcfa <- blavPredict(fit_bcfa)
    
    bcfa_theta_avg <-blav_theta_samp_means(factor_scores_bcfa)
    
    theta_mse <- c(theta_mse, CFA=mse_unstd(factor_scores_bcfa, true_theta_all, TRUE))
    lambd_pred <- comp_lambda(fit_bcfa, feature_names= feature_names) ## format output 
    lambda_mse <- c(lambda_mse, bcfa = mse_unstd(ypred =  lambd_pred,
                                                ytrue = true_lambda))
  }
  
  return(list(theta_mse = theta_mse, lambda_mse = lambda_mse, run_time = run_time))
} ## close run_iter()
