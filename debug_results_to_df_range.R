
## load a results dataframe
## load the param scaffold
## This version has variation in
## N, K, and d

bsem_results_to_df <- function(results_list, params_df, mode= 1){
  
  ## Add a catch that mode needs to be one of modelNA or modelResults:
  if(!(mode %in% c(1, 2, 3))){
    print("The mode parameter should be 1 (to format results), 2 (to format time),
          or 3 (data from all runs)!")
  }
  
  
  results_bsem <- data.frame()
  
  ## seq_along() creates an integer sequence of the length of the input:
  for (i in seq_along(results_list)){ ## all results is df of theta mse
    print(i)
    
    if(is.null(results_list[[i]])){
      next
    }
    
    round_res <- results_list[[i]]
    round_params <- params_df[which(params_df$Var4==i),]
    
    # Create a data frame for the current list element
    round_df <- data.frame(
      iteration = round_params$Var4, ## this spec loses a lot, so using the original index
      irtm = round_res$irtm,
      bsem = round_res$bsem,
      bcfa = round_res$bcfa,
      pass_N = round_params$Var1,
      pass_K = round_params$Var2,
      pass_d = round_params$Var3
    )
    
    # Bind the current data frame to the result data frame
    results_bsem <- rbind(results_bsem, round_df)
  }
  
  if(mode==3){
    return(results_bsem) ## if I want all run results
  }
  
  ## Mode: NA analysis:
  if(mode == 2){
    
    ## denominator is now many runs of each spec
    ## count number of successful runs:
    pass_count<- sim_results %>%
      group_by(pass_N, pass_K, pass_d) %>%  # Group by the last three columns
      summarize(count = n(), .groups = "drop")   # Count the number of occurrences
    
    ###
    na_count_by_group <- results_bsem %>%
      # Count NAs for each combination of group_column and another column
      group_by(pass_N, pass_K, pass_d) %>%
      summarise(
        irtm = sum(is.na(irtm)),  # Count NAs in value_column1
        bcfa = sum(is.na(bcfa)),   # Count NAs in value_column2
        bsem = sum(is.na(bsem))   # Count NAs in value_column2
      ) %>%
      pivot_longer(!c(pass_N, pass_K, pass_d),
                   names_to = "model",
                   values_to = "num_missing")
    
    ## Merge in count of the number of runs:
    na_count_by_group <- left_join(
      na_count_by_group,
      pass_count,
      by = c("pass_N", "pass_K", "pass_d"),
      copy = FALSE
    ) 
    na_count_by_group$pct_missing <-  na_count_by_group$num_missing/ na_count_by_group$count
    
    return(na_count_by_group)
  } ## close mode == 2
  ## Mode: plot values:
  if(mode == 1){
    ## Process the results into the format that
    ## we want for plotting
    
    ## Group by dimensions (data is 50 iterations for each dimension)
    ## take min, max, mean for each model for each of the varying params:
    agg_results_to_plot <- results_bsem %>%
      group_by(pass_N, pass_K, pass_d) %>% ## in this group, dimension is the only thing that varies
      summarise(
        ## irtm
        avg_irtm  = mean(irtm, na.rm = TRUE),
        min_irtm  = min(irtm, na.rm = TRUE),
        max_irtm  = max(irtm, na.rm = TRUE),
        ## Bcfa
        avg_bcfa  = mean(bcfa, na.rm = TRUE),
        min_bcfa  = min(bcfa, na.rm = TRUE),
        max_bcfa  = max(bcfa, na.rm = TRUE),
        ## Bsem
        avg_bsem  = mean(bsem, na.rm = TRUE),
        min_bsem  = min(bsem, na.rm = TRUE),
        max_bsem  = max(bsem, na.rm = TRUE),
      )
    
    ## Pivot longer to make plotting easier:
    ## 
    ggdat <- agg_results_to_plot %>%
      pivot_longer(
        cols = starts_with("avg_") | starts_with("min_") | starts_with("max_"),  # Select the columns that start with avg, min, max
        names_to = c("statistic", "model"),  # Create columns for model and statistic
        names_pattern = "(.*)_(.*)",  # Split column names into model and statistic
        values_to = "value"  # Name of the new column for the MSE values
      ) %>%
      pivot_wider(
        names_from = statistic,  # new column names
        values_from = value,  # new column values
      )
    
    return(ggdat)
  } #close mode == 1 
}

## save template:
#fname = paste0("irtm_bcfa_bsem_comp", Sys.Date(), ".rds")
#save(results_bsem, file=fname) 
