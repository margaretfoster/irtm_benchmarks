## Results:
## takes dataframe of results
## produces graphs

library(dplyr)
library(tidyr)
library(ggplot2)

source('irtm_only_results_to_df_lambds.R') ## script to format list of results as single df
source('na_indicies.R') # helper to find NA values in model comparisons

## Load data:

## params:
load("irtm_small_sim_params_sparsity.rds")
## all_results:
load("irtm_only_lambda_sparsity.rds")
## model_times:
load("irtm_only_lambda_sparsity_time.rds")

## %%%%%%%%%%%%% Data Prep
## Standardize list names for the time list:

all_results <- lapply(all_results, function(x) {
  if ("irtM" %in% names(x)) {
    names(x)[names(x) == "irtM"] <- "irtm"
  }
  return(x)
})


all_results <- lapply(all_results, function(x) {
  if ("CFA" %in% names(x)) {
    names(x)[names(x) == "CFA"] <- "bcfa"
  }
  return(x)
})



## get index of NA values in the sim results
## NA out the time runs for those models
## (to not distort estimated time)

na_ind <-na_indicies(all_results)

## update time to NA out times for failed models:
updated_time <- na_times(model_times, na_ind)

##############
## Helper format processing 

## standardize the mse from the all_results object
## so that we can keep resusing the modular code for results
standardize_mse_results <- function(results_list, metric_name = "irtm_theta_mse") {
  lapply(results_list, function(res) {
    if (is.null(res) || is.null(res[[metric_name]])) {
      return(NULL)
    }
    list(irtm = res[[metric_name]])
  })
}
##%%%%%%%%%%%%%%%%%%%%%

## Process the results from a list to a df:

## Need to modify this code to wrap by 
## lambda zeroed out percents!

## Data for Fig 1: MSE by model:
standardized_mse_results <- standardize_mse_results(all_results, 
                                                    metric_name = "irtm_theta_mse")

sim_results <- irtm_results_to_df2(standardized_mse_results,
                                  small_sim, 
                                  mode = 1) # model stats

sim_results$statistic <- "MSE" # for tracking



## Data for Fig 2: Runtime by model
time_results <- irtm_results_to_df2(updated_time,
                                   small_sim,
                                   mode = 1) # model stats

time_results$statistic <- "runtime"

## Data for Fig 3:  count NA by models:

na_count_by_group <- irtm_results_to_df2(standardized_mse_results,
                                        small_sim, 
                                        mode = 2) # NA count


##%%%%%%%%%%%%%%%%%%%%
## Plots:

p_results <- ggplot(sim_results, aes(x= pass_d, 
                                     y=avg,
                                     ymin=min, 
                                     ymax=max,
                                     pch=as.factor(model), 
                                     linetype=as.factor(model))) + 
  geom_point(size=2.5) +
  geom_line() + 
  geom_ribbon(alpha=0.2, linewidth =0) + 
  labs(linetype='Model', pch='Model') + 
  xlab('Dimensions') + 
  ylab('MSE') + 
  theme_bw() +
  theme(legend.position="bottom", 
        legend.background = element_rect(color='black'), 
        text=element_text(size=20, family="Times")) +
  facet_wrap(~Sparsity, labeller= label_both)


p_results


ggsave(filename='simulations/results/figures/irt-bsem-bcfa_sparsity.png', 
       plot=p_results,
       dpi = 300,  width = 12, height=6)


## Time comparison

## the long bcfa and bsem times overwhelm variation in IRTM times:

## Might wnat to make this into a table:
## numbers are weird though, I thought I forced it into seconds
## but 1-2 seconds seems unlikely
print(time_results[which(time_results$model=="IRT-M"),])

p_time <- ggplot(time_results, aes(x= pass_d, 
                                   y=avg,
                                   ymin=min, 
                                   ymax=max,
                                   pch=as.factor(model), 
                                   linetype=as.factor(model))) + 
  geom_point(size=2.5) +
  geom_line() + 
  geom_ribbon(alpha=0.2, linewidth =0) + 
  labs(linetype='Model', pch='Model') + 
  xlab('Dimensions') + 
  ylab('Runtime (Seconds)') + 
  theme_bw() +
  theme(legend.position="bottom", 
        legend.background = element_rect(color='black'), 
        text=element_text(size=20, family="Times"))+
  facet_wrap(~Sparsity, labeller= label_both)

p_time


ggsave(filename='simulations/results/figures/runtime_irt-bsem-bcfa_lambda_sparse.png', 
       plot=p_time,
       dpi = 300,  width = 12, height=6)

## Percent failed models:
## first count NA results by model and d specification

## Summarize the number of failed models
## per dimension-model pairing:



## Plot model failures

ggmiss <- ggplot(na_count_by_group, 
                 aes(x= pass_d,
                     y= pct_missing,
                     pch = as.factor(model), 
                     linetype=as.factor(model))) + 
  geom_line() +
  geom_point(size=2.5) +
  xlab('Dimensions') + 
  ylab('Percent Failed Models') + 
  labs(linetype='Model', pch='Model') + 
  theme_bw()+  
  theme(legend.position="bottom", 
        legend.background = element_rect(color='black'), 
        text=element_text(size=20, family="Times"))+
  facet_wrap(~Sparsity, labeller= label_both)

ggmiss

ggsave(filename='simulations/results/figures/failed_models_lambda.png',
       plot=ggmiss,
       dpi = 300, 
       width = 12, 
       height=6)
