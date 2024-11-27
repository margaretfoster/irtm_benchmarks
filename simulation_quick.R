library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(pscl)
library(IRTM)

source('monitornew.R')
source('helpers.R') #defines mse, sbc, traceplots, etc


### Simulation set up"
## loads 7000x 4 df with parameters for sims
NKd_vals <- readRDS('simulations/params.rds')

nsamp <- 1000
nburn <- 2000
thin <- 1
#nchains <- 4



sigma_sqr <- 1
lambda_zero_pct = 0.25
 
## list to store results
all_res <- list()

## function runs different IRT methods:
## irtFP = IRT with synthetic anchors
## irtMFp = IRT-M with synthetic anchors
run_iter = function(progress=TRUE, 
  methods=c('pca', 'benchmark', 'unconstrained', 
            'irtM', 'irtMNoVar', 'irtFp', 'irtMFp' )){

  theta_mse <- c()
  lambda_mse <- c()
  theta_cov <- c()
  lambda_cov <- c()
  theta_gew <- c() ## Geweke Score for theta
  theta_ess <- c()
  theta_rhat <- c()

  ##### ------------------------ PCA ----------------------------- #####
  if('pca' %in% methods){
    print('Running PCA...')
    p <- prcomp(Y)
    theta_mse <- c(theta_mse, pca=mse(as.matrix(p$x[,1:d]), true_theta))
    lambda_mse <- c(lambda_mse, pca=mse(as.matrix(p$rotation[, 1:d]), true_lambda))
  }else{
    theta_mse <- c(theta_mse, pca=NA)
    lambda_mse <- c(lambda_mse, pca=NA)
  }
  
  ##### ------------------------ Benchmark  ------------------------------ #####
  if ('benchmark' %in% methods){
  print('Running benchmark...')
    irt_res <- M_constrained_irt(Y, d, M=NULL, theta_fix = z,
                                which_fix = ind, nburn = nburn, nsamp=nsamp, nchains=nchains,
                                thin=1, learn_Sigma=FALSE, learn_Omega=FALSE,
                                display_progress = progress)
    
    theta_avg <- 0
    for (ch in 1:nchains){
      theta_avg <- theta_avg + irt_res$theta[,,,ch]/nchains
    }
    lambda_avg <- 0
    for (ch in 1:nchains){
      lambda_avg <- lambda_avg + irt_res$lambda[,,,ch]/nchains
    }
    theta_mse <- c(theta_mse, benchmark=mse(theta_avg, true_theta, TRUE))
    lambda_mse <- c(lambda_mse, benchmark=mse(lambda_avg, true_lambda, TRUE))
    theta_cov <- c(theta_cov, benchmark=coverage(theta_avg, true_theta))
    lambda_cov <- c(lambda_cov, benchmark=coverage(lambda_avg, true_lambda))
    theta_gew <- c(theta_gew, benchmark=geweke_fcn(irt_res$theta))
    theta_ess <- c(theta_ess, benchmark=ess_fcn(irt_res$theta))
    theta_rhat <- c(theta_rhat, benchmark=rhat_fcn(irt_res$theta))

    rm(irt_res)
  }else{
    theta_mse <- c(theta_mse, benchmark=NA)
    lambda_mse <- c(lambda_mse, benchmark=NA)
    theta_cov <- c(theta_cov, benchmark=NA)
    lambda_cov <- c(lambda_cov, benchmark=NA)
    theta_gew <- c(theta_gew, benchmark=NA)
    theta_ess <- c(theta_ess, benchmark=NA)
    theta_rhat <- c(theta_rhat, benchmark=NA)
  }

  ##### ------------------------ Unconstrained  ------------------------------ #####
  if('unconstrained' %in% methods){
    print('Running unconstrained...')
    irt_res <- M_constrained_irt(Y, d, M=NULL, theta_fix = NULL,
                                which_fix = NULL, nburn = nburn, nsamp=nsamp, nchains=nchains,
                                thin=1, learn_Sigma=FALSE, learn_Omega=FALSE,
                                display_progress = progress)
    
    theta_avg <- 0
    for (ch in 1:nchains){
      theta_avg <- theta_avg + irt_res$theta[,,,ch]/nchains
    }
    lambda_avg <- 0
    for (ch in 1:nchains){
      lambda_avg <- lambda_avg + irt_res$lambda[,,,ch]/nchains
    }
    theta_mse <- c(theta_mse, unconstrained=mse(theta_avg, true_theta, TRUE))
    lambda_mse <- c(lambda_mse, unconstrained=mse(lambda_avg, true_lambda, TRUE))
    theta_cov <- c(theta_cov, unconstrained=coverage(theta_avg, true_theta))
    lambda_cov <- c(lambda_cov, unconstrained=coverage(lambda_avg, true_lambda))
    theta_gew <- c(theta_gew, unconstrained=geweke_fcn(irt_res$theta))
    theta_ess <- c(theta_ess, unconstrained=ess_fcn(irt_res$theta))
    theta_rhat <- c(theta_rhat, unconstrained=rhat_fcn(irt_res$theta))
    rm(irt_res, theta_avg, lambda_avg)
  }else{
    theta_mse <- c(theta_mse, unconstrained=NA)
    lambda_mse <- c(lambda_mse, unconstrained=NA)
    theta_cov <- c(theta_cov, unconstrained=NA)
    lambda_cov <- c(lambda_cov, unconstrained=NA)
    theta_gew <- c(theta_gew, unconstrained=NA)
    theta_ess <- c(theta_ess, unconstrained=NA)
    theta_rhat <- c(theta_rhat, unconstrained=NA)
  }

  ##### ------------------------ M-constrained ------------------------------ #####

  if('irtM' %in% methods){
    print('Running M-constrained IRT...')
    irt_res <- M_constrained_irt(Yall, d, M=M, theta_fix = NULL,
                                which_fix = NULL, nburn = nburn, nsamp=nsamp, nchains=nchains,
                                thin=1, learn_Sigma=TRUE, display_progress = progress)
    theta_avg <- 0
    for (ch in 1:nchains){
      theta_avg <- theta_avg + irt_res$theta[,,,ch]/nchains
    }
    lambda_avg <- 0
    for (ch in 1:nchains){
      lambda_avg <- lambda_avg + irt_res$lambda[,,,ch]/nchains
    }
    theta_mse <- c(theta_mse, irtM=mse(theta_avg, true_theta_all, TRUE))
    lambda_mse <- c(lambda_mse, irtM=mse(lambda_avg, true_lambda, TRUE))
    theta_cov <- c(theta_cov, irtM=coverage(theta_avg, true_theta_all))
    lambda_cov <- c(lambda_cov, irtM=coverage(lambda_avg, true_lambda))
    theta_gew <- c(theta_gew, irtM=geweke_fcn(irt_res$theta))
    theta_ess <- c(theta_ess, irtM=ess_fcn(irt_res$theta))
    theta_rhat <- c(theta_rhat, irtM=rhat_fcn(irt_res$theta))
    rm(irt_res, theta_avg, lambda_avg)
  }else{
    theta_mse <- c(theta_mse, irtM=NA)
    lambda_mse <- c(lambda_mse, irtM=NA)
    theta_cov <- c(theta_cov, irtM=NA)
    lambda_cov <- c(lambda_cov, irtM=NA)
    theta_gew <- c(theta_gew, irtM=NA)
    theta_ess <- c(theta_ess, irtM=NA)
    theta_rhat <- c(theta_rhat, irtM=NA)
  }

  ##### ------------------------ irt No prior ------------------------------ #####


  if('irtMNoVar' %in% methods){
    print('Running M-constrained IRT without variance prior...')
    irt_res <- M_constrained_irt(Yall, d, M=M, theta_fix = x,
                                which_fix = NULL, nburn = nburn, nsamp=nsamp, nchains=nchains,
                                thin=1, learn_Sigma=FALSE, learn_Omega=FALSE,
                                display_progress = progress)
    
    theta_avg <- 0
    for (ch in 1:nchains){
      theta_avg <- theta_avg + irt_res$theta[,,,ch]/nchains
    }
    lambda_avg <- 0
    for (ch in 1:nchains){
      lambda_avg <- lambda_avg + irt_res$lambda[,,,ch]/nchains
    }
    theta_mse <- c(theta_mse, irtMnoVar=mse(theta_avg, true_theta_all, TRUE))
    lambda_mse <- c(lambda_mse, irtMnoVar=mse(lambda_avg, true_lambda, TRUE))
    theta_cov <- c(theta_cov, irtMnoVar=coverage(theta_avg, true_theta_all))
    lambda_cov <- c(lambda_cov, irtMnoVar=coverage(lambda_avg, true_lambda))
    theta_gew <- c(theta_gew, irtMnoVar=geweke_fcn(irt_res$theta))
    theta_ess <- c(theta_ess, irtMnoVar=ess_fcn(irt_res$theta))
    theta_rhat <- c(theta_rhat, irtMnoVar=rhat_fcn(irt_res$theta))
    rm(irt_res, theta_avg, lambda_avg)
  }else{
    theta_mse <- c(theta_mse, irtMnoVar=NA)
    lambda_mse <- c(lambda_mse, irtMnoVar=NA)
    theta_cov <- c(theta_cov, irtMnoVar=NA)
    lambda_cov <- c(lambda_cov, irtMnoVar=NA)
    theta_gew <- c(theta_gew, irtMnoVar=NA)
    theta_ess <- c(theta_ess, irtMnoVar=NA)
    theta_rhat <- c(theta_rhat, irtMnoVar=NA)
  }

  ##### ------------------------ irt Fake Points ------------------------------ #####

  if('irtFp' %in% methods){
    print('Running IRT with FP...')
    irt_res <- M_constrained_irt(Yall, d, M=NULL, theta_fix = x,
                                which_fix = ind, nburn = nburn, nsamp=nsamp, nchains=nchains,
                                thin=1, learn_Sigma=TRUE, display_progress = progress)
    
    
    theta_avg <- 0
    for (ch in 1:nchains){
      theta_avg <- theta_avg + irt_res$theta[,,,ch]/nchains
    }
    lambda_avg <- 0
    for (ch in 1:nchains){
      lambda_avg <- lambda_avg + irt_res$lambda[,,,ch]/nchains
    }
    theta_mse <- c(theta_mse, irtFp=mse(theta_avg, true_theta_all, TRUE))
    lambda_mse <- c(lambda_mse, irtFp=mse(lambda_avg, true_lambda, TRUE))
    theta_cov <- c(theta_cov, irtFp=coverage(theta_avg, true_theta_all))
    lambda_cov <- c(lambda_cov, irtFp=coverage(lambda_avg, true_lambda))
    theta_gew <- c(theta_gew, irtFp=geweke_fcn(irt_res$theta))
    theta_ess <- c(theta_ess, irtFp=ess_fcn(irt_res$theta))
    theta_rhat <- c(theta_rhat, irtFp=rhat_fcn(irt_res$theta))
    rm(irt_res, theta_avg, lambda_avg)
  }else{
    theta_mse <- c(theta_mse, irtFp=NA)
    lambda_mse <- c(lambda_mse, irtFp=NA)
    theta_cov <- c(theta_cov, irtFp=NA)
    lambda_cov <- c(lambda_cov, irtFp=NA)
    theta_gew <- c(theta_gew, irtFp=NA)
    theta_ess <- c(theta_ess, irtFp=NA)
    theta_rhat <- c(theta_rhat, irtFp=NA)
  }

  ##### ------------------------ irt Fake Points and M ------------------------------ #####
  if('irtMFp' %in% methods){
    print('Running IRT with M and FP...')
    
    irt_res <- M_constrained_irt(Yall, d, M=M, theta_fix = x,
                                which_fix = ind, nburn = nburn, nsamp=nsamp, nchains=nchains,
                                thin=1, learn_Sigma=TRUE, display_progress = progress)
    
    theta_avg <- 0
    for (ch in 1:nchains){
      theta_avg <- theta_avg + irt_res$theta[,,,ch]/nchains
    }
    lambda_avg <- 0
    for (ch in 1:nchains){
      lambda_avg <- lambda_avg + irt_res$lambda[,,,ch]/nchains
    }
    theta_mse <- c(theta_mse, irtMFp=mse(theta_avg, true_theta_all, TRUE))
    lambda_mse <- c(lambda_mse, irtMFp=mse(lambda_avg, true_lambda, TRUE))
    theta_cov <- c(theta_cov, irtMFp=coverage(theta_avg, true_theta_all))
    lambda_cov <- c(lambda_cov, irtMFp=coverage(lambda_avg, true_lambda))
    theta_gew <- c(theta_gew, irtMFp=geweke_fcn(irt_res$theta))
    theta_ess <- c(theta_ess, irtMFp=ess_fcn(irt_res$theta))
    theta_rhat <- c(theta_rhat, irtMFp=rhat_fcn(irt_res$theta))
    rm(irt_res, theta_avg, lambda_avg)
  }else{
    theta_mse <- c(theta_mse, irtMFp=NA)
    lambda_mse <- c(lambda_mse, irtMFp=NA)
    theta_cov <- c(theta_cov, irtMFp=NA)
    lambda_cov <- c(lambda_cov, irtMFp=NA)
    theta_gew <- c(theta_gew, irtMFp=NA)
    theta_ess <- c(theta_ess, irtMFp=NA)
    theta_rhat <- c(theta_rhat, irtMFp=NA)
  }

  return(list(theta_mse=theta_mse, lambda_mse=lambda_mse, 
                theta_cov=theta_cov, lambda_cov=lambda_cov, 
                theta_gew=theta_gew, theta_ess=theta_ess, 
                theta_rhat=theta_rhat))
}
 

## Simulation loop
for(r in 1:nrow(NKd_vals)){
  N    <- NKd_vals[r, 1]
  K    <- NKd_vals[r, 2]
  d    <- NKd_vals[r, 3]
  sim  <- NKd_vals[r, 4]
  
  message(paste("Simulation", r,
                "of", nrow(NKd_vals),
                "|| N =", N, "K =", K, "d =", d))
  
  sigmacorr <- matrix(runif(d*d, -1, 1), d, d)
  sigmacorr[lower.tri(sigmacorr)] = t(sigmacorr)[lower.tri(sigmacorr)]
  true_Sigma =  cov2cor(sigmacorr%*%sigmacorr)
  mu = rep(0, d)

  true_theta  <- rmvnorm(n = N, mean = mu, sigma = true_Sigma)
  true_lambda <- rmvnorm(n = K, mean = mu, sigma = diag(d))
  true_b      <- rnorm(  n = K, mean = 0,  sd    = 1)
  
  # random set some lambdas to be zero
  num_zero_lambda <- floor(lambda_zero_pct * K * d)
  lambda_ind <- sample(1:(d*K), num_zero_lambda, replace = F)
  true_lambda[lambda_ind] <- 0
  
  # M matrix
  M = array(NA, c(d,d,K))
  for (k in 1:K) {
    M[,,k] = diag(d) * sign(true_lambda[k,])
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

  # Create benchmark constraints
  z <- list()
  j = 1
  for(k in 1:d){
    a = list()
    a[[as.character(j)]] = true_theta[j, ]
    j = j + 1
    a[[as.character(j)]] = true_theta[j, ]
    j = j + 1
    z = c(z, a)
  }

  true_theta_all <- rbind(matrix(unlist(x), 
                                 length(x), 
                                 d, 
                                 byrow=TRUE), 
                          true_theta)
  
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
  Yall <- rbind( as.matrix(fake_points), Y)
  
  iter_res <- c(list(N=N, K=K, d=d, sim=sim), 
                run_iter(methods=c('pca', 
                                   'unconstrained', 
                                   'irtMNoVar', 
                                   'irtMFp')))
  all_res[[r]] <- iter_res
}
print(all_res)
## ------------------------- save data -------------------------  ##
saveRDS(all_res, file = paste0("simulations/results/data/simsv1", ".rds"))

