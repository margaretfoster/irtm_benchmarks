
## load a results dataframe
## load an NKd_vals scaffold

result_df <- data.frame()

## seq_along() creates an integer sequence of the length of the input:
for (i in seq_along(all_res)){
  curr_res <- all_res[[i]]
  
  # Create a data frame for the current list element
  curr_df <- data.frame(
    iteration = i, ## track which iteration
    theta_mse_irtM = curr_res$theta_mse$irtM,
    theta_mse_sem = curr_res$theta_mse$sem,
    theta_mse_cfa = curr_res$theta_mse$cfa,
    lambda_mse_irtM = curr_res$lambda_mse$irtM,
    lambda_mse_sem = curr_res$lambda_mse$sem,
    lambda_mse_cfa = curr_res$lambda_mse$cfa,
    run_time_irtm = curr_res$run_time$irtm,
    run_time_sem = curr_res$run_time$sem,
    run_time_cfa = curr_res$run_time$cfa
  )
  
  # Bind the current data frame to the result data frame
  result_df <- rbind(result_df, curr_df)
}