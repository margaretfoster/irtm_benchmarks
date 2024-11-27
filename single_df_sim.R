## Work through IRTM vs CFA vs E/BSEM for one single df
## then scale up

library(MASS)
library(mvtnorm)
library(coda)
library(nimble)
library(pscl)
library(IRTM)
library(lavaan) ## for SEM and CFA
library(blavaan) ## for bayesian CFA/SEM

### Custom code:
source('helpers.R') #defines mse, sbc, traceplots, etc

### Storage for metrics:
theta_mse <- c()
lambda_mse <- c()
theta_cov <- c()
lambda_cov <- c()
theta_gew <- c() ## Geweke Score for theta
theta_ess <- c()
theta_rhat <- c()


## Params for Data Sim


## Declare params
N    <- 5000
K    <- 10 
d    <- 3
sim  <- 00
seed  <- 1033

## number of zero loadings increased from 0.25 to 0.75 
## to see if I can get the SEM and CFA to run
## (lambda is loadings; so lower true lambda means more cross-loadings)
lambda_zero_pct = 0.75

## Generate parameters:
## correlation of sigma (factor covariances)
## true sigma
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

outlist = list('Yall' = Yall, 'MMatrix' = M)

##saveRDS(outlist,file = paste0("./results/data/sims_singledf.rds"))

### IRT-M setup and run
## (note that the model is different)
## and M needs to be adjusted for what I could run through
## CFA

nsamp <- 1000
nburn <- 2000
thin <- 1
#nchains <- 4
 
irt_res <- M_constrained_irt(Yall,
                             d,
                             M=M, theta_fix = NULL,
                             which_fix = NULL, 
                             nburn = nburn,
                             nsamp=nsamp, 
                           # nchains=nchains,
                             thin=1, 
                             learn_Sigma=TRUE, 
                             display_progress = TRUE)

## theta average:
theta_avg <- 0
theta_avg <- theta_avg + irt_res$theta[,,]

## lambda average:
lambda_avg <- 0
lambda_avg <- lambda_avg + irt_res$lambda[,,]

## Metrics
theta_mse <- c(theta_mse, irtM=mse(theta_avg, true_theta_all, TRUE))

lambda_mse <- c(lambda_mse, irtM=mse(lambda_avg, true_lambda, TRUE))
theta_cov <- c(theta_cov, irtM=coverage(theta_avg, true_theta_all))
lambda_cov <- c(lambda_cov, irtM=coverage(lambda_avg, true_lambda))
#theta_gew <- c(theta_gew, irtM=geweke_fcn(irt_res$theta)) #takes longest to run
#theta_ess <- c(theta_ess, irtM=ess_fcn(irt_res$theta))
#theta_rhat <- c(theta_rhat, irtM=rhat_fcn(irt_res$theta))

##--------------------------CFA and SEM-------------------------##

## Extract list of variables:
vars = paste0('X', 1:K)




## convert into the interactions format:



## it's a symmetric graph, only want one pairing:
#ts2[upper.tri(ts2)]

## Convert to dataframe to extract column names
tts2 = as.data.frame(ts2)
colnames(ts2) = paste0("t", c(1:d))

## keep upper triangle:

model_tmp =cfa_format()
cf = corr_format(true_Sigma)

## off-the-shelf SEM
fit_sem <- sem(model = c(model_tmp, cf), 
               data = Yall) 

## Off the shelf CFA
fit_cfa <- cfa(model =  c(model_tmp, cf), 
               data = Yall)

fit_sem
fit_cfa

## (quick time analysis: SEM and CFA much faster than IRTM
## bsem seems much slower than IRTM)
## NOTE This takes at least two hours for a simple model


#bsem_fit <- bsem(model = c(model_tmp, cf),
#                 data =Yall,
#                 save.lvs = TRUE)

## returns list that is the length of 
## type estimates for the latent variables 
#factor_scores_bsem <-  blavPredict(bsem_fit, newdata = NULL, 
#                                  type = "lv", level = 1L)

#tst <- lapply(factor_scores_bsem[1:2], head)

## convert from samples x obs x thetas list to 
## array
#bsemarray = array(unlist(factor_scores_bsem),
#                  dim = c(3000, 3, 10006))

#dim(bsemarray)

                  


### TODO:Bayesian CFA?

## This runs in IRTM, but not CFA or SEM
## because there are too many loadings for CFA/SEM
## Covariances: CFA and SEM require a user to specify factor covariances
## IRTM will learn the covariances 
## In designing the simulations, I ....

#firstModel<- ' 
#  t1 =~  X5 + X7 + X9
#  t2 =~ X3 + X9
#  t3 =~ X6  + X8
#'

## both CFA and SEM
## run for a model with t1 and t2 or t1 and t3, but not
## t2 and t3 or t1, t2, t3
## but does not work for t2, t3.
## if factors are truly correlated
## and you assume no correlation,
## the true shared variance between factors needs to go somewhere,
## so it ends up getting suppressed back down to the factor loadings 

#fmCovars <-'
# t1~~ t2
# t1 ~~ t3
# t2 ~~ t3
#'



## Unit level predictions of each factor:
factor_scores_cfa <- lavPredict(fit_cfa)
factor_scores_sem <- lavPredict(fit_sem, se=TRUE)

factor_scores_bsem <-

## MSE(single metric for entire data)
theta_mse <- c(theta_mse, CFA=mse(factor_scores_cfa, true_theta_all, TRUE))
theta_mse <- c(theta_mse, SEM=mse(factor_scores_sem, true_theta_all, TRUE))

## -- plot--



## ------------------------- save data -------------------------  ##
