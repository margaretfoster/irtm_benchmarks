## This script to produce a central runtime file for the 
## simulations that analyize IRT-M vs Bayesian CFA and SEM
## (as implemented in blavaaan)

## simulate data:
## Run baseline simulations
## 50 reps each of:
## N = 100, K = 10, lambda sparsity = 0.75
## d = c(2, 4, 6, 8)

## Runs in about 10 hours on macbook pro
 source("bsem_N100_K10.R") ## ~ 200 entries

## produces: 
## irtm_bcfa_bsem_N100K10.rds ## model results
## small_sim_params.rds ## df of parameters
## irtm_bcfa_bsem_N100K10_time.rds ## runtime

## Produce results figures:
source("bsem_results_plots.R")

## Simulation for effect of Lambda Sparsity

## ~120 entries, runs in about 8 hours on macbook pro
source("bsem_lambda_sparsity_sim.R")
## produces:
## irtm_bcfa_bsem_lambda_sparsity_time.rds
## irtm_bcfa_bsem_lambda_sparsity.rds
## small_sim_params_sparsity.rds ## parameters

## Produce results figures:
source("lamba_sparsity_plots.R")

##%%%%%%%%%%%%%%%%%%% 
## Benchmark time for a wider range of results:
##%%%%%%%%%%%%%%%%%%%%%%

## simulation
## runs a wider N, K range for 10 passes each.
## ~480 entries, expected runtime ~ 180 hours
source("irtm_bsem_bcfa_sim_single_pass_for_time.R")
## plots
## 11/27/24: 
## Code below is still empty
source("irtm_bsem_range_plots.R")
