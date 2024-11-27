
run_iter <- function(sim_data){
  
  ## set constants:
  nsamp <- 1000
  nburn <- 2000
  thin <- 1
  sigma_sqr <- 1
  seed <- 647
  
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
  print("Running CFA and SEM")
  
  ## Format data for cfa input: 
  cfa_mod <- cfa_format(M = M, vars = feature_names, dims = d)
  cfa_cor <- corr_format(true_Sigma, corrthresh = .25)
  
  ##%%%%%%%%%%%% Fit SEM %%%%%%%%%%%%%%%%%%%%%%%%%%
  
  fit_sem <- tryCatch({
    sem_start <- Sys.time()
    sem(model = c(cfa_mod, cfa_cor), data = Yall)
  }, error = function(e) {
    list(error = TRUE, message = conditionMessage(e))
    NA
  })
  sem_end <- Sys.time()
  sem_time <- as.numeric(sem_end - sem_start)
  run_time <- c(run_time, sem = sem_time)
  
  ## Catch multple ways to identify a failed run:
  sem_status = ifelse(is.na(fit_sem) == TRUE, 
                      0, ## SEM failed
                      ifelse(fit_sem@Fit@converged == FALSE,
                             0, ## SEM failed to converge ##  
                             1)) ## SEM success 
  
  ## Record metrics
  if(sem_status == 0){
    ## if SEM crashed, record no results for the run
    theta_mse <- c(theta_mse, sem=NA)
    lambda_mse <- c(lambda_mse, sem=NA)
  }else{ ## if SEM runs:
    print('computing SEM fit metrics')
    factor_scores_sem <- lavPredict(fit_sem)
    theta_mse <- c(theta_mse, SEM=mse_unstd(factor_scores_sem, 
                                            true_theta_all, TRUE))
  }

  ##%%%%%%%%%%%%%%%% Fit CFA %%%%%%%%%%%%%%%%%%%
  print('computing fit CFA')
  cfa_start <- Sys.time()
  fit_cfa <-tryCatch({
    #supressWarnings(
    cfa(
      model =  c(cfa_mod, cfa_cor), 
      data = Yall)
    #)
  },error = function(e) {
    list(error = TRUE, message = conditionMessage(e))
    NA ## return value in case of error
  })
  
  cfa_end <- Sys.time()
  cfa_time <- as.numeric(cfa_end - cfa_start)
  run_time <- c(run_time, cfa = cfa_time)
  
  ## catch if CFA failed:
  ## make one item that codes for either an NA value
  ## or non-convergence:
  
  ## 0 if fit_cfa is null, 0 if fit CFA exists but did not converge
  ## else 1 to show a CFA model
  
  cfa_status = ifelse(is.na(fit_cfa) == TRUE, 
                      0, ## CFA failed
                      ifelse(fit_cfa@Fit@converged == FALSE,
                             0, ## CFA failed to converge ##  
                             1)) ## CFA success 
  
  
  if(cfa_status == 0 ){ ## CFA failed or did not converge
    ## if CFA crashed, record no results for the run
    theta_mse <- c(theta_mse, cfa=NA)
    lambda_mse <- c(lambda_mse, cfa=NA)
  }else{ ## if CFA runs:
    print('computing CFA metrics')
    factor_scores_cfa <- lavPredict(fit_cfa)
    theta_mse <- c(theta_mse, CFA=mse_unstd(factor_scores_cfa, true_theta_all, TRUE))
    lambd_pred <- comp_lambda(fit_cfa, feature_names= feature_names) ## format output 
    lambda_mse <- c(lambda_mse, cfa = mse_unstd(ypred =  lambd_pred,
                                                ytrue = true_lambda))
  }
  
  
  return(list(theta_mse = theta_mse, lambda_mse = lambda_mse, run_time = run_time))
} ## close run_iter()
