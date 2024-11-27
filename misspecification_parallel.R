set.seed(42069)
lib_dir <- "./libraries"
.libPaths(c(lib_dir, .libPaths()))

library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(pscl)
library(IRTM)

library(foreach)
library(doSNOW)
library(abind)


deps = c('MASS', 'mvtnorm', 'coda', 'nimble', 'pscl', 'IRTM')

##### ---------------------- Simulation Parameters ------------------------ #####
N_vals = c(1000, 250, 50)     # Which values of N do we simulate for?
K_vals = c(250, 50, 10)                 # Which values of K do we simulate for?
d_vals = c(2, 5, 8)                            # Which values of d do we simulate for?
miss_vals = seq(0, 1, 0.25)

NKd_vals = expand.grid(N_vals, K_vals, d_vals)

ITER <- 10                                       # How many simulations per N, K, d?
nsamp <- 1000
nburn <- 2000
thin <- 1

sigma_sqr <- 2
lambda_zero_pct = 0.25


combine_iters = function(a, b){
  list(THETA=abind(a$THETA, b$THETA, along=4),
       LAMBDA=abind(a$LAMBDA, b$LAMBDA, along=4),
       SIGMA=abind(a$SIGMA, b$SIGMA, along=4))
  
}

run_iter = function(){  
  ##### ------------------------ Generate Y ----------------------------- #####
  true_Z = matrix(NA, N, K)
  Y = matrix(NA, N, K)
  for (i in 1:N) {
    for (k in 1:K) {
      mu_ik = t(true_lambda[k, ]) %*% true_theta[i, ] - true_b[k]
      true_Z[i, k] = rnorm(1, mean = mu_ik, sd = 1)
      Y[i, k] = ifelse(true_Z[i,k] > 0, 1, 0)
    }
  }
  
  nmiss = length(miss_vals)
  LAMBDA = array(NA, c(K, d, nmiss))
  THETA = array(NA, c(N, d, nmiss))
  SIGMA = array(NA, c(d, d, nmiss))
  
  for( r in 1:nmiss){
    
    miss = miss_vals[r]
    message(paste0('Missingness = ', miss*100, '%'))
    
    # Misspecify miss % of M entries
    smat = sign(true_lambda)
    if (miss > 0.0){
      N_miss = floor(K * d * miss)
      which_miss = sample(length(smat), N_miss)
      smat[which_miss] = sapply(which_miss, function(x) 
        sample(c(0,1,-1)[!c(0,1,-1) %in% smat[x]], 1))
    }
    
    # M matrix
    M = array(NA, c(d,d,K))
    for (k in 1:K) {
      M[,,k] = diag(smat[k, ]) 
    }
    
    # directions
    direction <- sign(true_lambda)
    
    # Create Fake Points for Y and theta
    Flags  <- c(1, -1)
    points <- c()
    for (i in 1:d) {
      for (flag in Flags) {
        points <- c(points, ifelse( direction[ , i] == flag, 1, 0 ))
      }
    }
    fake_points <- data.frame(
      matrix(points, nrow = 2*d, ncol = K, byrow = TRUE), 
      row.names = paste0("fake_", 1:(2*d))
    )
    Y_full <- rbind(as.matrix(fake_points), Y)
    
    # Create corresponding constraints on thetas
    A <- 10
    x <- list()
    j = 1
    for(k in 1:d){
      a = list()
      v1 = rep(0, d)
      v1[k] = A
      a[[as.character(j)]] = v1
      j = j + 1
      a[[as.character(j)]] = -v1
      j = j + 1
      x = c(x, a)
    }
    
    ind <- 1:(2*d)

    ##### ------------------------ irt ------------------------------ #####
    message('Running M-constrained IRT...')
    
    irt_res <- M_constrained_irt(Y_full, d, M=M, theta_fix = x,
                                 which_fix = ind, nburn = nburn, nsamp=nsamp,
                                 thin=thin, learn_Sigma=TRUE, display_progress=FALSE)
    
    LAMBDA[,,r] <- apply(irt_res$lambda, c(1,2), mean)
    THETA[,,r] <- apply(irt_res$theta, c(1,2), mean)[-ind, ]
    SIGMA[,,r] <- apply(irt_res$Sigma, c(1,2), mean)
  }
  return(list(LAMBDA=LAMBDA, THETA=THETA, SIGMA=SIGMA))
}

#### --------- REDUCE THE VALUE OF cores TO USE LESS PROCESSING POWER ------ ####
#### --------- Have cores = ITER for optimal performance ------ ####
cores=detectCores()
#cores = 10
####------------------------------------------------------------------------ ####
cl <- makeCluster(cores)
registerDoSNOW(cl)

for(r in 1:nrow(NKd_vals)){
  N    <- NKd_vals[r, 1]
  K    <- NKd_vals[r, 2]
  d    <- NKd_vals[r, 3]
  
  message(paste("Simulation", r, "of", nrow(NKd_vals), 
                "|| N =", N, "K =", K, "d =", d))
  
  sigmacorr <- matrix(runif(d*d, -1, 1), d, d)
  sigmacorr[lower.tri(sigmacorr)] = t(sigmacorr)[lower.tri(sigmacorr)]
  diag(sigmacorr) = sigma_sqr
  mu = rep(0, d)
  true_Sigma = cov2cor(sigmacorr%*%sigmacorr)
  
  true_theta  <- rmvnorm(n = N, mean = mu, sigma = true_Sigma)
  true_lambda <- rmvnorm(n = K, mean = mu, sigma = diag(d))
  true_b      <- rnorm(  n = K, mean = 0,  sd    = 1)
  
  # random set some (5) lambdas to be zero
  num_zero_lambda <- floor(lambda_zero_pct * K * d)
  lambda_ind <- sample(1:(d*K), num_zero_lambda, replace = F)
  true_lambda[lambda_ind] <- 0
  
    
  # ------------------------- simulation compare -------------------------  ##
  print('Running Iterations...')
  pb <- txtProgressBar(max = ITER, style = 3)
  progress <- function(n) setTxtProgressBar(pb, n)
  opts <- list(progress = progress)
  all_res = foreach(icount(ITER), .combine=combine_iters, .packages = deps,
                    .options.snow = opts) %dopar%  run_iter()
  close(pb)
  all_res$PARAMS = list(Sigma=true_Sigma, theta=true_theta, lambda=true_lambda, b=true_b)
  
  ## ------------------------- save data -------------------------  ##
  saveRDS(all_res, file = paste0("simulations/results/misspecification/miss_results_N=", 
                                 N, "_K=", K, "_d=", d, ".rds"))

}

stopCluster(cl)
