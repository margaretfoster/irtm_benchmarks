library(dplyr)
library(purrr)
library(tibble)

# Load all result files
result_files <- list.files("results", pattern = "^intermediate_pass_\\d+\\.rds$", full.names = TRUE)

# Load and flatten
results <- result_files %>%
  map(readRDS) %>%
  map_df(function(res) {
    tibble(
      index = res$index,
      status = res$status,
      N = res$params$Var1,
      K = res$params$Var2,
      rep = res$params$Var3,
      run_id = res$params$Var4,
      theta_mse_irtm = res$theta_mse$irtM %||% NA_real_,
      theta_mse_bsem = res$theta_mse$bsem %||% NA_real_,
      theta_mse_bcfa = res$theta_mse$bcfa %||% NA_real_,
      runtime_irtm = res$runtimes$irtm %||% NA_real_,
      runtime_bsem = res$runtimes$bsem %||% NA_real_,
      runtime_bcfa = res$runtimes$bcfa %||% NA_real_,
      pass_time = as.numeric(difftime(res$timestamps$pass_end, res$timestamps$pass_start, units = "secs"))
    )
  })

# Preview or save
print(head(results))

# Save for future analysis
write.csv(results, file = "summary_sim_results.csv", row.names = FALSE)
