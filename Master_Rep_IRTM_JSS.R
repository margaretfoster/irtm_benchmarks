#' ---
#' title: "Replication Script for IRT-M: Fast Item Response Theory With Interpretable Latent Dimensions"
#' output: html_document
#' ---

##' This script to produce a central runtime file. 
##' These simulations present IRT-M speed and error across
##' a range of configurations. 
##' This iteration no longer benchmarks against blavaan.
#' Last updated: `r Sys.time()`
#'
#' 
#' # Simulations:
##' Run baseline simulations
##' 50 reps each of:
##' N = 100, K = 10, lambda sparsity = 0.75
##' d = c(2, 4, 6, 8)

## Just irtm:
source("irtm_N100_K10.R", echo = TRUE) ##
##' produces: 
##' irtm_only_N100K10.rds ## model results
##' small_sim_params.rds ## df of parameters
##' irtm_only_N100K10_time.rds ## runtime

##' Results figures:
##' updated 7/31:
source("irtm1_results_plots.R", echo = TRUE)

##' Simulation for effect of Lambda Sparsity
##' 120 entries
##' 
source("irtm_lambda_sparsity_sim.R", echo = TRUE)
##' produces:
##' irtm_only_lambda_sparsity_time.rds
##' irtm_only_lambda_sparsity.rds
##' irtm_small_sim_params_sparsity.rds ## parameters
## 
## Produce results figures:
source("irtm_onlylamba_sparsity_plots.R", echo = TRUE)

##%%%%%%%%%%%%%%%%%%% 
## Benchmark time for a wider range of results:
##%%%%%%%%%%%%%%%%%%%%%%

##' simulation
##' runs a wider N, K range for 10 passes each.
##' Adjusted to standardize to seconds 6/25
##' 480 entries, less cases where d > k
##' took almost 20 days on macbook pro
##' (commented out because of time)
##' entire set, saves intermediate every 5:
#source("irtm_bsem_bcfa_sim_single_pass_for_time.R")

## Updated version with only IRT-M
source("irtm_only_single_pass_for_time.R", echo = TRUE)

## #' plots
## updated 7/31:
source("irtm_only_range_plots.R", echo = TRUE)

## #' Section: Application and Illustration

##' The scripts walk through IRT-M on a synthetic public opinion survey.
##' The results are based on our package vignette
##' For details about how we generated the data, see https://github.com/margaretfoster/IRTM-Synth
## Mjf: 8/1/25: check where the data pulls from for things that run in 
## knitr-- the location of the master file working directory or 
## the relative directory of the source() script 
source("application.R", echo = TRUE)

#' Plots saved in application.R:
#' ```{r show_plot1, echo=FALSE, out.width='70%'}
knitr::include_graphics("simulations/results/figures/ebirtm-synth.png")
knitr::include_graphics("simulations/results/figures/theta-media-synth.png")
#' ```
#' 
## System summary:
sessionInfo()