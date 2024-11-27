## Script to benchmark IRTM against Bayesian CFA/SEM
## Note that the Bayesian SEM implementation is very slow
## So the simulation will be more minimal

library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(IRTM)
library(blavaan)

# Source custom helper functions
source('helpers.R') ## mse, custom plots
source('cfa_model_syntax.R') ## script to format CFA model input
source('format_cfa_lambda.R') ## script to format CFA loadings
source("blavPredict_format_conversion.R") #script to format blavaan samples
source('irtm_sims_gen_data.R') ## script to generate data
source('irtm_sims_bsem_iter.R') ## script to run models


# Load simulation parameters
NKd_vals <- readRDS('simulations/params.rds')

##list of smaller models
## with 100 observations and 10 features

small_sim <- NKd_vals[which(NKd_vals$Var1==100 &
                 NKd_vals$Var2==10),]


lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 50% lambda zero does not, though does run for IRTM


# List to store results
all_res_b <- list()

# Call run_iter() that
## - Takes a combination of parameters
## - Runs IRT-M, CFA, SEM 
## - Returns lists of MSE

# sample 10 of the small models:
set.seed(1029)
s <- sample(1:nrow(small_sim)) ## random permutation
s2 <- small_sim[s[1:10],] ## sample of 10 to see if it works

#for (i in 1:dim(NKd_vals)[1]){
for (i in 1:nrow(s2)){
  print(paste0("Start pass ", i, ":"))
  pass_start <- Sys.time()
  
  params <- s2[i, ]
  
  simdat <- gen_sim_dat(params, lambda_zero_pct)
  
  results_b <- run_iter_b(simdat)
  
  all_res_b[[i]] <- results_b  # Store results for each iteration
  
  pass_end <- Sys.time()
  pass_time <- c(run_time, irtm = as.numeric(pass_end - pass_start))
  print(paste0("Pass took ", round(pass_time, 4), "minutes"))
}
