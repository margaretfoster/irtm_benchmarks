
## This is just IRT-M with a single specification for the 
## N (100) and K (10) and d = 2, 4, 6, 8
## It does 50 iterations of each pair, with 50 randomly generated
## datasets
## 

library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(IRTM)


# Source custom helper functions
source('code/helpers.R') ## mse, custom plots
source('code/irtm_sims_gen_data.R') ## script to generate data
source('code/irtm_bsem_results_to_df.R') ## script to format list of results as single df


## Data prep

# Load simulation parameters
NKd_vals <- readRDS('simulations/params.rds')

##list of smaller models
## with 100 observations and 10 features

lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 50% lambda zero does not, though does run for IRTM

small_sim <- NKd_vals[which(NKd_vals$Var1==100 & # n-items
                              NKd_vals$Var2==10),] #n-features

## var4 is a unique identifier that serves as a seed

small_sim$Var4 <- 1:nrow(small_sim)

set.seed(1029)

### save small_sim for analysis:
sname = paste0("simulations/irtm_small_sim_params", ".rds")
save(small_sim, file=sname)

## Simulations:

all_results = list()
model_times = list()

## marker to see which chain is running (if more than one)

chain = 1

#for(i in 1:nrow(s2)){ ## open for loop
for(i in 1:nrow(small_sim)){ ## open for loop
  print(paste0("Start pass ", i, ":"))
  pass_start <- Sys.time()
  params <- small_sim[i, ] 
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
  irtm_time <- difftime(irtm_end, irtm_start, units='secs')
  run_time <- c(run_time, irtm = as.numeric(irtm_time))
  
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
 
  all_results[[i]] <- theta_mse
  model_times[[i]] <- run_time
  
  ## 
  pass_end <- Sys.time()
  pass_time <- difftime(pass_end, pass_start, units = "secs")
  print(paste0("Pass took ", round(as.numeric(pass_time), 4), "seconds"))
  
  ## save every hundred passes:
  if(i%%100 == 0){
  rname = paste0("simulations/irtm_only_results_partial_", chain, ".rds")
  tname = paste0("simulations/irtm_only_time_partial_", chain, ".rds")
  save(all_results, file=rname)
  save(model_times, file=tname) ## original run had file as rname
  }
  
} # close for loop

## Save results
fname = paste0("simulations/irtm_only_N100K10.rds")
save(all_results, file=fname)

## save time info
tname = paste0("simulations/irtm_only_N100K10_time.rds")
save(model_times, file=tname)
