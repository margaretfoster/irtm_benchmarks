library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
#library(pscl) 
library(IRTM) #for IRT-M
library(lavaan) # for SEM and CFA

# Source custom helper functions
source('helpers.R') ## mse, custom plots
source('cfa_model_syntax.R') ## script to format CFA model input
source('format_cfa_lambda.R') ## script to format CFA loadings
source('irtm_sims_gen_data.R') ## script to generate data
source('irtm_sims_run_iter.R') ## script to run models

# Load simulation parameters
NKd_vals <- readRDS('simulations/params.rds')
lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 50% lambda zero does not, though does run for IRTM

# List to store results
all_res <- list()

# Call run_iter() that
## - Takes a combination of parameters
## - Runs IRT-M, CFA, SEM 
## - Returns lists of MSE


# Main simulation loop over parameters

for (i in 1:dim(NKd_vals)[1]){
  print(i) #to know where we are in the cycle
  params <- NKd_vals[i, ]
  simdat <- gen_sim_dat(params, lambda_zero_pct)
  results <- run_iter(simdat)

  all_res[[i]] <- results  # Store results for each iteration
  
}


## ended first set after about 5 days (not-parallelized)
#fname = paste0("irtm_cfa_sem_comp_pt1", Sys.Date(), ".rds")
#save(all_res, file=fname)
