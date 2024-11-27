## This is a single pass through to get an approximate 
## time benchmark for IRTM vs other models

library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(IRTM)
library(blavaan)
library(dplyr)

# Source custom helper functions
source('helpers.R') ## mse, custom plots
source('cfa_model_syntax.R') ## script to format CFA model input
source('format_cfa_lambda.R') ## script to format CFA loadings
source("blavPredict_format_conversion.R") #script to format blavaan samples
source('irtm_sims_gen_data.R') ## script to generate data
source('irtm_bsem_results_to_df.R') ## script to format list of results as single df

## Make names to save partial `results:
##  

tpartname = "irtm_bcfa_bsem_time_partial_.rds"
ppartname = "irtm_bcfa_bsem_params_partial_.rds"
rpartname = "irtm_bcfa_bsem_res_partial_.rds"


## Data prep

# Load simulation parameters
NKd_vals <- readRDS('simulations/params.rds')

##list of smaller models
## with 100 observations and 10 features

lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 50% lambda zero does not, though does run for IRTM

## Pass through 11/14: expand the NxK ranges:
## N and features: 
## N: 50, 250, 1000
## K: 10, 50 


single_pass <- NKd_vals[which(NKd_vals$Var1 %in% c(50, 250, 1000) & # N items
                               NKd_vals$Var2 %in% c(10, 50, 250, 500)),] #K features

## K of 250 hung up BSEM at starting values for over an hour and a half
## transforming those entries into K=5
## Trasforming the 500 into 20. 
## Otherwise keeping the same to have the parameter scaffold.

single_pass[which(single_pass$Var2==250), "Var2"] <- 5
single_pass[which(single_pass$Var2==500), "Var2"] <- 20

## Ten of each:
## N = 480 obs
single_pass_no_dupes <- single_pass %>%
  dplyr::distinct(Var1, Var2, Var3) %>%
  slice(rep(1:n(), each = 10)) ## ten reps of each

## re-index the run id:
single_pass_no_dupes$Var4 <- 1:nrow(single_pass_no_dupes)

## cleanup:
rm(NKd_vals)
rm(single_pass)

set.seed(1029)

## Simulations:

all_results = list()
model_times = list()
params_tracker = list()

## marker to see which  is running (if more than one)

for(i in 1:nrow(single_pass_no_dupes)){ ## open for loop
  print(paste0("Start pass ", i, ":"))
  pass_start <- Sys.time()
  params <- single_pass_no_dupes[i, ] 
  print("round")
  ####
  ## Generate ground truth data
  sim_data <- gen_sim_dat(params, lambda_zero_pct)
  
  
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
  len_Yall <- dim(Yall)[1]
  
  ## convert to cfa/sem format
  ## assess if the model will fit the cfa/sem format
  ## if we should skip
  
  ## Format data for cfa input:
  
  bcfa_mod_base <- cfa_format(M = M, vars = feature_names, dims = d)
  bcfa_cor <- corr_format(true_Sigma, corrthresh = .25)
  ## drop empty model loadings:
  bcfa_mod <- grep("X[0-9]+", bcfa_mod_base, value = TRUE)
  ## if need to extract the dropped loadings:
  kept_t <- as.numeric(gsub(".*t(\\d+).*", "\\1", bcfa_mod))  
  missing_d <- setdiff(1:d, kept_t)
  
  #print(missing_d)
  
  ##  Model format checkpoint
  ## pass & record if model can't be estimated in CFA/SEM
  ## pass if there are missing thetas:
  ## AKA if the vector of missing thetas is not 0
  if(identical(missing_d, integer(0))== FALSE){
    ## write model params
    print("Skipping this model; wrote dtails")
    sink(file="bsem_cfa_skipped_logs.txt", append=TRUE)
    print("Failed bSEM/BCFA run:")
    print(Sys.time())
    print(params)
    print(bcfa_mod)
    print("---")
    sink()
    ## pass
    next 
  }
  
  ## Declare objects
  
  run_time <- list()
  theta_mse  <- list()
  lambda_mse  <- list()
  theta_cov <- list()
  lambda_cov  <- list()
  
  ## Declare sampler params
  
  nsamp <- 1000
  nburn <- 2000
  thin <- 1
  sigma_sqr <- 1
  seed <- 102924
  
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
  
  
  ## simulation params to unpack:
  nsamp <- 1000
  nburn <- 2000
  thin <- 1
  sigma_sqr <- 1
  seed <- 102924
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
    ## if SEM crashed:
    ## sink the model specifications
    sink(file="bsem_fail_logs.txt", append=TRUE)
    print("Failed bSEM run:")
    print(Sys.time())
    print(params)
    print(bcfa_mod)
    sink()
    ##record no results for the run
    theta_mse <- c(theta_mse, bsem=NA)
    # lambda_mse <- c(lambda_mse,bsem=NA)
  }else{ ## if SEM runs:
    print('computing BSEM fit metrics')
    ## blavPredict catches all samples (burnin and nsamp)
    ## Needs to be pruned to just the samples and compressed:
    factor_scores_bsem <- blavPredict(fit_bsem,
                                      type='lv', # posterior distribution of thetas
    )
    
    # Make sure the burn-in is pruned out:
    # format to extract mean:
    
    bsem_theta_avg <-blav_theta_samp_means(factor_scores_bsem,
                                           nsamp, 
                                           len_n =  len_Yall,
                                           d=d)
    
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
    ## if CFA crashed,
    ## sink the model specifications
    sink(file="bsem_fail_logs.txt", append=TRUE)
    print("Failed CFA run:")
    print(Sys.time())
    print(params)
    print(bcfa_mod)
    sink()
    ##record no results for the run
    theta_mse <- c(theta_mse, bcfa=NA)
    #lambda_mse <- c(lambda_mse, bcfa=NA)
  }else{ ## if CFA runs:
    print('computing CFA metrics')
    
    factor_scores_bcfa <- blavPredict(fit_bcfa)
    
    bcfa_theta_avg <- blav_theta_samp_means(factor_scores_bcfa,
                                            nsamp, 
                                            len_n =  len_Yall, 
                                            d=d)
    
    theta_mse <- c(theta_mse, CFA=mse_unstd(bcfa_theta_avg, 
                                            true_theta_all, TRUE))
    
    #lambd_pred <- comp_lambda(fit_bcfa, feature_names= feature_names) ## format output 
    # lambda_mse <- c(lambda_mse, bcfa = mse_unstd(ypred =  lambd_pred,
    #                                             ytrue = true_lambda))
  } # close CFA else
  
  all_results[[i]] <- theta_mse
  model_times[[i]] <- run_time
  params_tracker[[i]] <- params # not obligory b/c have df
  ## but make it easier
  
  ## Note: the runtime data didn't save for more than the last pass
  ## 
  pass_end <- Sys.time()
  pass_time <- as.numeric(pass_end - pass_start)
  print(paste0("Pass took ", round(pass_time, 4), "minutes"))
  
  ## save time every 5 iterations:
  if(i%%5== 0){
    save(all_results, file=rpartname)
    save(model_times, file=tpartname)
    save(params_tracker, file=ppartname)
  }
  
} # close for loop

## Save
rname = paste0("irtm_bcfa_bsem_results_single_pass.rds")
tname = paste0("irtm_bcfa_bsem_time_single_pass.rds")
pname = paste0("irtm_bcfa_bsem_params_single_pass.rds")

save(all_results, file=rname)
save(model_times, file=rname)
save(params_tracker, file=pname)

