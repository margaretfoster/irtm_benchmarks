## This is a single pass through to get an approximate 
## time benchmark for IRTM vs other models
## Running sequentially, the pass takes about 180 hours
## modified here to run in parallel:

## General structure:
## 1) set up parallelization plan
## 2) develop analysis as function
## 3) Call function

#Outside of the parallel function
library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(IRTM)
library(blavaan)
library(dplyr)
library(future.apply)
library(uuid) #for uniqueids

# Load dependencies
source('helpers.R')
source('cfa_model_syntax.R')
source('format_cfa_lambda.R')
source("blavPredict_format_conversion.R")
source('irtm_sims_gen_data.R')
source('irtm_bsem_results_to_df.R')

#  (1) Set plan for parallelization
plan(multicore, workers = parallel::detectCores() - 1) 

## Make sure results directory exists:
if (!dir.exists("results")) dir.create("results")

## set up sim: 
# Load simulation parameters
NKd_vals <- readRDS('simulations/params.rds')

# Preprocess simulation parameter grid
## K of 250 hung up BSEM at starting values for over an hour and a half
## transforming those entries into K=5
## Trasforming the 500 into 20. 
## Otherwise keeping the same to have the parameter scaffold.

single_pass <- NKd_vals %>%
  filter(Var1 %in% c(50, 250, 1000), Var2 %in% c(10, 50, 250, 500)) %>%
  mutate(Var2 = case_when(
    Var2 == 250 ~ 5,
    Var2 == 500 ~ 20,
    TRUE ~ Var2
  )) %>% ## take ten passes of each param set:
  distinct(Var1, Var2, Var3) %>%
  slice(rep(1:n(), each = 10)) %>%
  mutate(Var4 = row_number())  # reindex via "Var4"

## Set a single very high sparsity
lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 50% lambda zero does not, though does run for IRTM

##%%%%%%%%%
## Set up parallel run structure:
run_sim_pass <- function(params, index, lambda_zero_pct = lambda_zero_pct) {
  
  ## load functions and libraries:
  library(MASS)
  library(mvtnorm)
  library(coda)
  library(nimble)
  library(IRTM)
  library(blavaan)
  library(dplyr)
  library(future.apply)
  library(uuid) #for uniqueids
  
  # Load dependencies
  source('helpers.R')
  source('cfa_model_syntax.R')
  source('format_cfa_lambda.R')
  source("blavPredict_format_conversion.R")
  source('irtm_sims_gen_data.R')
  source('irtm_bsem_results_to_df.R')
  
  set.seed(60525 + index)  # Ensures each worker has a unique seed
  
  pass_start <- Sys.time()
  result <- tryCatch({
    
    sim_data <- gen_sim_dat(params, lambda_zero_pct)
    d <- sim_data$d
    M <- sim_data$M
    Yall <- sim_data$Yall
    true_theta_all <- sim_data$true_theta_all
    true_lambda <- sim_data$true_lambda
    feature_names <- sim_data$feature_names
    
    bcfa_mod_base <- cfa_format(M = M, vars = feature_names, dims = d)
    bcfa_cor <- corr_format(sim_data$true_Sigma, corrthresh = .25)
    bcfa_mod <- grep("X[0-9]+", bcfa_mod_base, value = TRUE)
    kept_t <- as.numeric(gsub(".*t(\\d+).*", "\\1", bcfa_mod))
    missing_d <- setdiff(1:d, kept_t)
    
    if (length(missing_d) > 0) {
      return(list(
        status = "skipped",
        index = index,
        params = params,
        reason = "incomplete factor structure",
        timestamps = list(pass_start = pass_start, pass_end = Sys.time())
      ))
    }
    
    nsamp <- 1000
    nburn <- 2000
    
    # IRT-M
    irtm_start <- Sys.time()
    irt_res <- M_constrained_irt(Yall, d, M, nburn = nburn, nsamp = nsamp, thin = 1, learn_Sigma = TRUE)
    irtm_end <- Sys.time()
    
    theta_mse <- list(irtM = mse_unstd(irt_res$theta[,,], true_theta_all, TRUE))
    lambda_mse <- list(irtM = mse_unstd(irt_res$lambda[,,], true_lambda, TRUE))
    theta_cov <- list(irtM = coverage(irt_res$theta[,,], true_theta_all))
    lambda_cov <- list(irtM = coverage(irt_res$lambda[,,], true_lambda))
    
    # BSEM
    bsem_start <- Sys.time()
    fit_bsem <- tryCatch({
      bsem(model = c(bcfa_mod, bcfa_cor), 
           data = Yall, 
           sample = nsamp,
           burnin = nburn, 
           save.lvs = TRUE)
    },error = function(e) {
      cat("BSEM error on index", index, ":", e$message, "\n")
      return(NA)
    }) #end try-catch
    
    bsem_end <- Sys.time()
    
    if (!is.na(fit_bsem) && fit_bsem@Fit@converged) {
      fs_bsem <- blavPredict(fit_bsem, type = "lv")
      theta_mse$bsem <- mse_unstd(blav_theta_samp_means(fs_bsem, 
                                                        nsamp,
                                                        nrow(Yall), 
                                                        d), 
                                  true_theta_all, TRUE)
    } else {
      theta_mse$bsem <- NA
    }
    
    # BCFA
    bcfa_start <- Sys.time()
    fit_bcfa <- tryCatch({
      bcfa(model = c(bcfa_mod, bcfa_cor), 
           data = Yall, 
           sample = nsamp, 
           burnin = nburn, 
           save.lvs = TRUE)
    }, error = function(e) {
      cat("BCFA error on index", index, ":", e$message, "\n")
      return(NA)
    })
    bcfa_end <- Sys.time()
    
    if (!is.na(fit_bcfa) && fit_bcfa@Fit@converged) {
      fs_bcfa <- blavPredict(fit_bcfa)
      theta_mse$bcfa <- mse_unstd(blav_theta_samp_means(fs_bcfa, 
                                                        nsamp, 
                                                        nrow(Yall),
                                                        d),
                                  true_theta_all, TRUE)
    } else {
      theta_mse$bcfa <- NA
    }
    
    pass_end <- Sys.time()
    
    list(
      status = "success",
      index = index,
      params = params,
      theta_mse = theta_mse,
      lambda_mse = lambda_mse,
      theta_cov = theta_cov,
      lambda_cov = lambda_cov,
      runtimes = list(
        irtm = as.numeric(difftime(irtm_end, irtm_start, units = "secs")),
        bsem = as.numeric(difftime(bsem_end, bsem_start, units = "secs")),
        bcfa = as.numeric(difftime(bcfa_end, bcfa_start, units = "secs"))
      ),
      timestamps = list(
        pass_start = pass_start,
        irtm_start = irtm_start, irtm_end = irtm_end,
        bsem_start = bsem_start, bsem_end = bsem_end,
        bcfa_start = bcfa_start, bcfa_end = bcfa_end,
        pass_end = pass_end
      )
    )
  }, error = function(e) {
    list(
      status = "error",
      index = index,
      params = params,
      message = e$message,
      timestamps = list(pass_start = pass_start, pass_end = Sys.time())
    )
  })
  
  
  # Save result to file
  result_file <- paste0("results/intermediate_pass_", 
                        sprintf("%03d", index), ".rds")
  saveRDS(result, result_file)
  
  # Return only metadata for master list if desired
  return(list(
    file = result_file,
    index = index,
    status = result$status
  ))
}

## Valitation:
## Change to "single_pass" params object if succeeded:

trial_run <- single_pass[1:20, ]  
# Now, run the parallel simulations

result_list <- future_lapply(1:nrow(single_pass), function(i) {
  cat("Starting simulation for index:", i, "\n")
  params <-single_pass[i, ]
  result <- run_sim_pass(params, i)
  cat("Finished simulation for index:", i, "\n")
  return(result)
},  future.seed = TRUE)

## post


# Gather results into a data frame:
final_results <- do.call(rbind,
                         lapply(result_list, function(x) readRDS(x$file)))

# Save the combined results to an output file (final results)
saveRDS(final_results, "results/final_results.rds")

cat("Parallel simulations complete. \nResults saved to 'results/final_results.rds'.\n")


