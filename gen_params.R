### ---------------------- Simulation Parameters ------------------------ #####

## N unit items
## K values: test items 
## d = dimensions
N_vals = c(10, 50, 100, 250, 500, 1000, 2500)                        
K_vals = c(10, 50, 100, 250, 500)                 
d_vals = c(2, 3, 5, 8)                           

nsim <- 50
## Expand.grid = creates a dataframe of all combinations of 
## factor variables
NKd_vals = expand.grid(N_vals, K_vals, d_vals, 1:nsim)

## Randomly shuffles the rows
NKd_vals <- NKd_vals[sample(nrow(NKd_vals), 
                            nrow(NKd_vals), replace=FALSE), ]

## Removes rows where the number of items is 10 and the number of dimensions is 8
NKd_vals <- NKd_vals[!(NKd_vals[,1] == 10 & NKd_vals[, 3] == 8), ]

saveRDS(NKd_vals, 'simulations/params.rds')
