lib_dir <- "./libraries"
.libPaths(c(lib_dir, .libPaths()))

library(kableExtra) 
library(reshape2)

## Load data:
results_data_path <- 'simulations/results/data'
all_files <- paste(results_data_path, list.files(results_data_path), sep='/')

## Make framework for the simulation parameters:
## Check that these values are right!
N_vals = c(2500, 1000, 500, 250, 100, 50, 10)     # Which values of N do we simulate for?
K_vals = c(500, 250, 100, 50, 10)                 # Which values of K do we simulate for?
d_vals = c(2, 3, 5, 8)                            # Which values of d do we simulate for?
NKd_vals <- expand.grid(N_vals, K_vals, d_vals)
nsim <- 50

## Create dataframe for MSE for each combination of params
theta_mse <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 7))
theta_mse_ss <- matrix(0, nrow(NKd_vals), 7)
lambda_mse <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 7))
lambda_mse_ss <- matrix(0, nrow(NKd_vals), 7)
theta_cov <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))
theta_cov_ss <- matrix(0, nrow(NKd_vals), 6)
lambda_cov <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))
lambda_cov_ss <- matrix(0, nrow(NKd_vals), 6)
theta_gew <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))
theta_gew_ss <- matrix(0, nrow(NKd_vals), 6)
theta_ess <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))
theta_ess_ss <- matrix(0, nrow(NKd_vals), 6)
theta_rhat <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))
theta_rhat_ss <- matrix(0, nrow(NKd_vals), 6)
theta_rhat <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))
theta_rhat_ss <- matrix(0, nrow(NKd_vals), 6)
theta_sbc <- data.frame(NKd_vals, matrix(0, nrow(NKd_vals), 6))

## Assumes design that saves individual results as files:
## aggregates into a big dataframe
for(fn in all_files){
    print(fn)
    res <- readRDS(fn)
    for (sim in res){
        r <- which(NKd_vals[, 1] == sim$N & 
                    NKd_vals[, 2] == sim$K & 
                    NKd_vals[, 3] == sim$d)
        theta_mse_ss[r, ] <- theta_mse_ss[r, ] + !is.na(sim$theta_mse)
        theta_mse[r, 4:ncol(theta_mse)] <- ifelse(is.na(sim$theta_mse), 0, sim$theta_mse) + 
                            theta_mse[r, 4:ncol(theta_mse)]
        lambda_mse_ss[r, ] <- lambda_mse_ss[r, ] + !is.na(sim$lambda_mse)
        lambda_mse[r, 4:ncol(lambda_mse)] <- ifelse(is.na(sim$lambda_mse), 0, sim$lambda_mse) + 
                            lambda_mse[r, 4:ncol(lambda_mse)]
        theta_cov_ss[r, ] <- theta_cov_ss[r, ] + !is.na(sim$theta_cov)
        theta_cov[r, 4:ncol(theta_cov)] <- ifelse(is.na(sim$theta_cov), 0, sim$theta_cov) + 
                            theta_cov[r, 4:ncol(theta_cov)]
        lambda_cov_ss[r, ] <- lambda_cov_ss[r, ] + !is.na(sim$lambda_cov)
        lambda_cov[r, 4:ncol(lambda_cov)] <- ifelse(is.na(sim$lambda_cov), 0, sim$lambda_cov) + 
                            lambda_cov[r, 4:ncol(lambda_cov)]
        theta_ess_ss[r, ] <- theta_ess_ss[r, ] + !is.na(sim$theta_ess)
        theta_ess[r, 4:ncol(theta_ess)] <- ifelse(is.na(sim$theta_ess), 0, sim$theta_ess) + 
                            theta_ess[r, 4:ncol(theta_ess)]
        theta_gew_ss[r, ] <- theta_gew_ss[r, ] + !is.na(sim$theta_gew)
        theta_gew[r, 4:ncol(theta_gew)] <- ifelse(is.na(sim$theta_gew), 0, sim$theta_gew) + 
                            theta_gew[r, 4:ncol(theta_gew)]
        theta_rhat_ss[r, ] <- theta_rhat_ss[r, ] + !is.na(sim$theta_rhat)
        theta_rhat[r, 4:ncol(theta_rhat)] <- ifelse(is.na(sim$theta_rhat), 0, sim$theta_rhat) + 
                            theta_rhat[r, 4:ncol(theta_rhat)]
    }
}

format_tables <- function(tab, fmin=TRUE, dgts=3){
  mids <- 4:ncol(tab)
  methods <- names(tab)[mids]
  ftab <- dcast(tab, N + K ~ d)[, 1:2]
  for (m in methods){
    mtab <- dcast(tab, N + K ~ d, value.var=m)
    names(mtab)[3:ncol(mtab)] <- paste0(m, " d=", names(mtab)[3:ncol(mtab)])
    ftab <- cbind(ftab, mtab[, 3:ncol(mtab)])
  }
  ftab <- ftab[, c(1,2,grep("2", names(ftab)), grep(3, names(ftab)), 
                   grep(5, names(ftab)), grep(8, names(ftab)))]
  ftab <- round(ftab, dgts)
  for(r in 1:nrow(ftab)){
    for (d in c(2, 3, 5, 8)){
      if (fmin)
        min_id <- which.min(ftab[r, grep(d, names(ftab))])
      else
        min_id <- which.max(ftab[r, grep(d, names(ftab))])

      min_n <- grep(d, names(ftab))[min_id]
      ftab[r, min_n] <- paste0("\\textbf{", ftab[r, min_n], "}")
    }
  }
  ftab
}


theta_mse[, 4:ncol(theta_mse)] <- theta_mse[, 4:ncol(theta_mse)]/theta_mse_ss
theta_mse_tab <- theta_mse[, c(1:3, 4, 6, 8, 10)]
names(theta_mse_tab) <- c('N', 'K', 'd', c('PCA', 'IRT', 
                          'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(theta_mse_tab), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/theta_mse.tex')

theta_ess[, 4:ncol(theta_ess)] <- theta_ess[, 4:ncol(theta_ess)]/theta_ess_ss
theta_ess_tab <- theta_ess[, c(1:3, 5, 7, 9)]
names(theta_ess_tab) <- c('N', 'K', 'd', c('IRT', 'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(theta_ess_tab, FALSE), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/theta_ess.tex')

theta_gew[, 4:ncol(theta_gew)] <- theta_gew[, 4:ncol(theta_gew)]/theta_gew_ss
theta_gew_tab <- theta_gew[, c(1:3, 5, 7, 9)]
names(theta_gew_tab) <- c('N', 'K', 'd', c('IRT', 'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(theta_gew_tab), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/theta_gew.tex')

theta_rhat[, 4:ncol(theta_rhat)] <- theta_rhat[, 4:ncol(theta_rhat)]/theta_rhat_ss
theta_rhat_tab <- theta_rhat[, c(1:3, 5, 7, 9)]
names(theta_rhat_tab) <- c('N', 'K', 'd', c('IRT', 'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(theta_rhat_tab), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/theta_rhat.tex')

theta_cov[, 4:ncol(theta_cov)] <- theta_cov[, 4:ncol(theta_cov)]/theta_cov_ss
theta_cov_tab <- theta_cov[, c(1:3, 5, 7, 9)]
names(theta_cov_tab) <- c('N', 'K', 'd', c('IRT', 'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(theta_cov_tab, FALSE), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/theta_cov.tex')

lambda_mse[, 4:ncol(lambda_mse)] <- lambda_mse[, 4:ncol(lambda_mse)]/lambda_mse_ss
lambda_mse_tab <- lambda_mse[, c(1:3, 4, 6, 8, 10)]
names(lambda_mse_tab) <- c('N', 'K', 'd', c('PCA', 'IRT', 
                          'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(lambda_mse_tab), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/lambda_mse.tex')

lambda_cov[, 4:ncol(lambda_cov)] <- lambda_cov[, 4:ncol(lambda_cov)]/lambda_cov_ss
lambda_cov_tab <- lambda_cov[, c(1:3, 5, 7, 9)]
names(lambda_cov_tab) <- c('N', 'K', 'd', c('IRT', 'IRT-M No Cov', 'IRT-M'))

tab <- knitr::kable(format_tables(lambda_cov_tab, FALSE), format = 'latex',escape = FALSE, 
                    row.names=FALSE, booktabs=TRUE)
        
capture.output(kable_styling(tab, latex_options = "striped"), 
                file= 'simulations/results/tables/lambda_cov.tex')


