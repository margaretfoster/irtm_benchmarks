## Gen_sim_dat:
## takes an input list of parameters for N, K, D, num sims, 
## lambda zero percent
# Input list is a single row from the param-gen script
## returns a list of simulated data for 
## irtm and other work to benchmark

gen_sim_dat <- function(vals, lambda_zero_pct){ 
  
  library(mvtnorm) 
  if (ncol(vals) != 4) stop("Input missing expected format-- check")
  
  ## params: 
  sigma_sqr <- 1
  seed <- 647

  ## from vals:
  N    <- vals[, 1]
  K    <- vals[, 2]
  d    <- vals[, 3]
  sim  <- vals[, 4]
  
  seed <- sim ## separate seed for each run
  
  sigmacorr <- matrix(runif(d*d, -1, 1), d, d)
  sigmacorr[lower.tri(sigmacorr)] = t(sigmacorr)[lower.tri(sigmacorr)]
  true_Sigma =  cov2cor(sigmacorr%*%sigmacorr)
  mu = rep(0, d) 
  
  ## rmvnorm() returns an N x d matrix
  ## with each row a draw from the normal distribution
  ## and each column as the draw for that d
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
  
  ## "feature names" is indexed to the number of rows in true_lambda
  ## b/c true_lambda records the true feature-underlying dimension loading
  ## and thus has the list of features and dimensions in the data
  feature_names <- paste0("X", 1:dim(true_lambda)[1])  # for use with CFA metrics
  
  return(list(
    d = d,
    M = M,
    Y = Y,
    Yall = Yall,
    true_theta_all = true_theta_all,
    true_lambda = true_lambda,
    true_Sigma = true_Sigma,
    feature_names = feature_names,
    lambda_zero_pct = lambda_zero_pct
    ) # close list 
    ) #close return
  
}#close gen_sim_dat
#