library(dplyr)
library(tidyr)
library(ggplot2)

source('irtm_bsem_results_to_df.R') ## script to format list of results as single df
source('na_indicies.R') # helper to find NA values in model comparisons

## Load data:
## params:
load("irtm_bcfa_bsem_params_single_pass.rds")
## all_results:
load("irtm_bcfa_bsem_results_single_pass.rds")
## model_times:
load("irtm_bcfa_bsem_time_single_pass.rds")

