---
title: "Replication Script for IRT-M: Fast Item Response Theory With Interpretable Latent Dimensions"
output: html_document
---
This script to produce a central runtime file. 
These simulations present IRT-M speed and error across
a range of configurations. 
This iteration no longer benchmarks against blavaan.
Last updated: 2025-08-03 16:15:17.741981


# Simulations:
Run baseline simulations
50 reps each of:
N = 100, K = 10, lambda sparsity = 0.75
d = c(2, 4, 6, 8)


``` r
## Just irtm:
source("irtm_N100_K10.R", echo = TRUE) ##
```

```
## 
## > ## This is just IRT-M with a single specification for the 
## > ## N (100) and K (10) and d = 2, 4, 6, 8
## > ## It does 50 iterations of each pair, with  .... [TRUNCATED] 
## 
## > library(mvtnorm)
## 
## > library(coda)
## 
## > library(nimble)
```

```
## nimble version 1.2.1 is loaded.
## For more information on NIMBLE and a User Manual,
## please visit https://R-nimble.org.
## 
## Note for advanced users who have written their own MCMC samplers:
##   As of version 0.13.0, NIMBLE's protocol for handling posterior
##   predictive nodes has changed in a way that could affect user-defined
##   samplers in some situations. Please see Section 15.5.1 of the User Manual.
```

```
## 
## Attaching package: 'nimble'
```

```
## The following object is masked from 'package:mvtnorm':
## 
##     logdet
```

```
## The following object is masked from 'package:stats':
## 
##     simulate
```

```
## The following object is masked from 'package:base':
## 
##     declare
```

```
## 
## > library(IRTM)
```

```
## Loading required package: truncnorm
```

```
## Loading required package: tmvtnorm
```

```
## Loading required package: Matrix
```

```
## Loading required package: stats4
```

```
## Loading required package: gmm
```

```
## Loading required package: sandwich
```

```
## Loading required package: RcppProgress
```

```
## Loading required package: RcppDist
```

```
## Loading required package: ggplot2
```

```
## 
## > # Source custom helper functions
## > source('helpers.R') ## mse, custom plots
## 
## > #source('cfa_model_syntax.R') ## script to format CFA model input
## > #source('format_cfa_lambda.R') ## script to format CFA loadings
## > #source("blavP ..." ... [TRUNCATED] 
## 
## > source('irtm_bsem_results_to_df.R') ## script to format list of results as single df
## 
## > ## Data prep
## > 
## > # Load simulation parameters
## > NKd_vals <- readRDS('simulations/params.rds')
## 
## > ##list of smaller models
## > ## with 100 observations and 10 features
## > 
## > lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 
## > ## 50% lambda zero does not, though does run for IRTM
## > 
## > small_sim <- NKd_vals[which(NKd_vals$Var1==100 & # n-items
## +                              .... [TRUNCATED] 
## 
## > ## var4 is a unique identifier that serves as a seed
## > 
## > small_sim$Var4 <- 1:nrow(small_sim)
## 
## > set.seed(1029)
## 
## > ### save small_sim for analysis:
## > sname = paste0("irtm_small_sim_params", ".rds")
## 
## > save(small_sim, file=sname)
## 
## > ## Simulations:
## > 
## > all_results = list()
## 
## > model_times = list()
## 
## > ## marker to see which chain is running (if more than one)
## > 
## > chain = 1
## 
## > #for(i in 1:nrow(s2)){ ## open for loop
## > for(i in 1:nrow(small_sim)){ ## open for loop
## +   print(paste0("Start pass ", i, ":"))
## +   pass_start <- S .... [TRUNCATED] 
## [1] "Start pass 1:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.1107seconds"
## [1] "Start pass 2:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3168seconds"
## [1] "Start pass 3:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9568seconds"
## [1] "Start pass 4:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7853seconds"
## [1] "Start pass 5:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.0098seconds"
## [1] "Start pass 6:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.6651seconds"
## [1] "Start pass 7:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 3.2868seconds"
## [1] "Start pass 8:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.6049seconds"
## [1] "Start pass 9:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4068seconds"
## [1] "Start pass 10:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2499seconds"
## [1] "Start pass 11:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.619seconds"
## [1] "Start pass 12:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1584seconds"
## [1] "Start pass 13:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9043seconds"
## [1] "Start pass 14:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3425seconds"
## [1] "Start pass 15:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7773seconds"
## [1] "Start pass 16:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9084seconds"
## [1] "Start pass 17:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3685seconds"
## [1] "Start pass 18:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.1015seconds"
## [1] "Start pass 19:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4857seconds"
## [1] "Start pass 20:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7482seconds"
## [1] "Start pass 21:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.2924seconds"
## [1] "Start pass 22:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7414seconds"
## [1] "Start pass 23:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9063seconds"
## [1] "Start pass 24:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4967seconds"
## [1] "Start pass 25:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2214seconds"
## [1] "Start pass 26:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9002seconds"
## [1] "Start pass 27:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8835seconds"
## [1] "Start pass 28:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9683seconds"
## [1] "Start pass 29:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4747seconds"
## [1] "Start pass 30:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3316seconds"
## [1] "Start pass 31:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7453seconds"
## [1] "Start pass 32:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3252seconds"
## [1] "Start pass 33:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8954seconds"
## [1] "Start pass 34:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4118seconds"
## [1] "Start pass 35:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8704seconds"
## [1] "Start pass 36:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1559seconds"
## [1] "Start pass 37:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.0737seconds"
## [1] "Start pass 38:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7412seconds"
## [1] "Start pass 39:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.777seconds"
## [1] "Start pass 40:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7609seconds"
## [1] "Start pass 41:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3359seconds"
## [1] "Start pass 42:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7289seconds"
## [1] "Start pass 43:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1529seconds"
## [1] "Start pass 44:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1667seconds"
## [1] "Start pass 45:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8666seconds"
## [1] "Start pass 46:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.724seconds"
## [1] "Start pass 47:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3947seconds"
## [1] "Start pass 48:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3571seconds"
## [1] "Start pass 49:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1459seconds"
## [1] "Start pass 50:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1894seconds"
## [1] "Start pass 51:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7271seconds"
## [1] "Start pass 52:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.0773seconds"
## [1] "Start pass 53:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3357seconds"
## [1] "Start pass 54:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7461seconds"
## [1] "Start pass 55:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7002seconds"
## [1] "Start pass 56:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3127seconds"
## [1] "Start pass 57:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8911seconds"
## [1] "Start pass 58:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.718seconds"
## [1] "Start pass 59:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7998seconds"
## [1] "Start pass 60:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3953seconds"
## [1] "Start pass 61:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7702seconds"
## [1] "Start pass 62:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8305seconds"
## [1] "Start pass 63:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3132seconds"
## [1] "Start pass 64:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3273seconds"
## [1] "Start pass 65:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8405seconds"
## [1] "Start pass 66:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.0674seconds"
## [1] "Start pass 67:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6885seconds"
## [1] "Start pass 68:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1026seconds"
## [1] "Start pass 69:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3377seconds"
## [1] "Start pass 70:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3633seconds"
## [1] "Start pass 71:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3287seconds"
## [1] "Start pass 72:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7649seconds"
## [1] "Start pass 73:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3158seconds"
## [1] "Start pass 74:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1342seconds"
## [1] "Start pass 75:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8403seconds"
## [1] "Start pass 76:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8495seconds"
## [1] "Start pass 77:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7172seconds"
## [1] "Start pass 78:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7048seconds"
## [1] "Start pass 79:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8556seconds"
## [1] "Start pass 80:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8427seconds"
## [1] "Start pass 81:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1168seconds"
## [1] "Start pass 82:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.2815seconds"
## [1] "Start pass 83:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7105seconds"
## [1] "Start pass 84:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.197seconds"
## [1] "Start pass 85:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7046seconds"
## [1] "Start pass 86:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1716seconds"
## [1] "Start pass 87:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4349seconds"
## [1] "Start pass 88:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8412seconds"
## [1] "Start pass 89:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6901seconds"
## [1] "Start pass 90:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3145seconds"
## [1] "Start pass 91:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7175seconds"
## [1] "Start pass 92:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6966seconds"
## [1] "Start pass 93:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8321seconds"
## [1] "Start pass 94:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1077seconds"
## [1] "Start pass 95:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7158seconds"
## [1] "Start pass 96:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7151seconds"
## [1] "Start pass 97:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8457seconds"
## [1] "Start pass 98:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8854seconds"
## [1] "Start pass 99:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.0796seconds"
## [1] "Start pass 100:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.2933seconds"
## [1] "Start pass 101:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.726seconds"
## [1] "Start pass 102:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.76seconds"
## [1] "Start pass 103:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7225seconds"
## [1] "Start pass 104:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8351seconds"
## [1] "Start pass 105:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.339seconds"
## [1] "Start pass 106:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4198seconds"
## [1] "Start pass 107:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.9112seconds"
## [1] "Start pass 108:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8556seconds"
## [1] "Start pass 109:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8525seconds"
## [1] "Start pass 110:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.2901seconds"
## [1] "Start pass 111:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.171seconds"
## [1] "Start pass 112:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3102seconds"
## [1] "Start pass 113:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1355seconds"
## [1] "Start pass 114:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.224seconds"
## [1] "Start pass 115:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7011seconds"
## [1] "Start pass 116:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6811seconds"
## [1] "Start pass 117:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3306seconds"
## [1] "Start pass 118:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8772seconds"
## [1] "Start pass 119:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8279seconds"
## [1] "Start pass 120:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7161seconds"
## [1] "Start pass 121:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8187seconds"
## [1] "Start pass 122:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1271seconds"
## [1] "Start pass 123:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4532seconds"
## [1] "Start pass 124:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.4159seconds"
## [1] "Start pass 125:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3168seconds"
## [1] "Start pass 126:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1034seconds"
## [1] "Start pass 127:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3066seconds"
## [1] "Start pass 128:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8742seconds"
## [1] "Start pass 129:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8394seconds"
## [1] "Start pass 130:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3177seconds"
## [1] "Start pass 131:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7259seconds"
## [1] "Start pass 132:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7013seconds"
## [1] "Start pass 133:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8868seconds"
## [1] "Start pass 134:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3241seconds"
## [1] "Start pass 135:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3087seconds"
## [1] "Start pass 136:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.3267seconds"
## [1] "Start pass 137:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8783seconds"
## [1] "Start pass 138:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8213seconds"
## [1] "Start pass 139:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8507seconds"
## [1] "Start pass 140:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7241seconds"
## [1] "Start pass 141:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6954seconds"
## [1] "Start pass 142:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8547seconds"
## [1] "Start pass 143:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3185seconds"
## [1] "Start pass 144:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8325seconds"
## [1] "Start pass 145:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8517seconds"
## [1] "Start pass 146:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.0641seconds"
## [1] "Start pass 147:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3168seconds"
## [1] "Start pass 148:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.836seconds"
## [1] "Start pass 149:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3434seconds"
## [1] "Start pass 150:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.0776seconds"
## [1] "Start pass 151:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8436seconds"
## [1] "Start pass 152:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6764seconds"
## [1] "Start pass 153:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3567seconds"
## [1] "Start pass 154:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7841seconds"
## [1] "Start pass 155:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3397seconds"
## [1] "Start pass 156:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.114seconds"
## [1] "Start pass 157:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2656seconds"
## [1] "Start pass 158:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1392seconds"
## [1] "Start pass 159:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3704seconds"
## [1] "Start pass 160:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8275seconds"
## [1] "Start pass 161:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2943seconds"
## [1] "Start pass 162:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3927seconds"
## [1] "Start pass 163:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3125seconds"
## [1] "Start pass 164:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1134seconds"
## [1] "Start pass 165:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8427seconds"
## [1] "Start pass 166:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1201seconds"
## [1] "Start pass 167:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1308seconds"
## [1] "Start pass 168:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3404seconds"
## [1] "Start pass 169:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2523seconds"
## [1] "Start pass 170:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2619seconds"
## [1] "Start pass 171:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8495seconds"
## [1] "Start pass 172:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8683seconds"
## [1] "Start pass 173:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1661seconds"
## [1] "Start pass 174:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.0576seconds"
## [1] "Start pass 175:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1685seconds"
## [1] "Start pass 176:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7212seconds"
## [1] "Start pass 177:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1356seconds"
## [1] "Start pass 178:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.385seconds"
## [1] "Start pass 179:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7073seconds"
## [1] "Start pass 180:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8474seconds"
## [1] "Start pass 181:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7335seconds"
## [1] "Start pass 182:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1347seconds"
## [1] "Start pass 183:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7018seconds"
## [1] "Start pass 184:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1291seconds"
## [1] "Start pass 185:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3036seconds"
## [1] "Start pass 186:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.6923seconds"
## [1] "Start pass 187:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.2486seconds"
## [1] "Start pass 188:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1224seconds"
## [1] "Start pass 189:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.31seconds"
## [1] "Start pass 190:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7338seconds"
## [1] "Start pass 191:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3187seconds"
## [1] "Start pass 192:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1434seconds"
## [1] "Start pass 193:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8234seconds"
## [1] "Start pass 194:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 2.1102seconds"
## [1] "Start pass 195:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7999seconds"
## [1] "Start pass 196:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.8205seconds"
## [1] "Start pass 197:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.7082seconds"
## [1] "Start pass 198:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3061seconds"
## [1] "Start pass 199:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 0.862seconds"
## [1] "Start pass 200:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Running BCFA and BSEM"
## [1] "Pass took 1.3832seconds"
## 
## > ## Save results
## > fname = paste0("irtm_only_N100K10.rds")
## 
## > save(all_results, file=fname)
## 
## > ## save time info
## > tname = paste0("irtm_only_N100K10_time.rds")
## 
## > save(model_times, file=tname)
```

produces: 
irtm_only_N100K10.rds ## model results
small_sim_params.rds ## df of parameters
irtm_only_N100K10_time.rds ## runtime
Results figures:
updated 7/31:


``` r
source("irtm1_results_plots.R", echo = TRUE)
```

```
## 
## > ## Results:
## > ## takes dataframe of results
## > ## produces graphs
## > 
## > library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following object is masked from 'package:MASS':
## 
##     select
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```
## 
## > library(tidyr)
```

```
## 
## Attaching package: 'tidyr'
```

```
## The following objects are masked from 'package:Matrix':
## 
##     expand, pack, unpack
```

```
## 
## > library(ggplot2)
## 
## > source('irtm_only_results_to_df.R') ## script to format list of results as single df
## 
## > source('na_indicies.R') # helper to find NA values in model comparisons
## 
## > ## Load data:
## > ## params:
## > load("irtm_small_sim_params.rds")
## 
## > ## all_results:
## > load("irtm_only_N100K10.rds")
## 
## > ## model_times:
## > load("irtm_only_N100K10_time.rds")
## 
## > ## %%%%%%%%%%%%% Data Prep
## > ## Standardize list names for the time list:
## > 
## > all_results <- lapply(all_results, function(x) {
## +   if ("irtM" %in%  .... [TRUNCATED] 
## 
## > all_results <- lapply(all_results, function(x) {
## +   if ("CFA" %in% names(x)) {
## +     names(x)[names(x) == "CFA"] <- "bcfa"
## +   }
## +   return(x)
## + })
## 
## > ## get index of NA values in the sim results
## > ## NA out the time runs for those models
## > ## (to not distort estimated time)
## > 
## > na_ind <-na_indici .... [TRUNCATED] 
## 
## > ## update time to NA out times for failed models:
## > updated_time <- na_times(model_times, na_ind)
## [1] "NA index dataframe is empty, returning original list"
## 
## > ##%%%%%%%%%%%%%%%%%
## > ## Process the results from a list to a df:
## > 
## > ## Data for Fig 1: MSE by model:
## > sim_results <- irtm_results_to_df(all_resu .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## 
## > sim_results$statistic <- "mse" # for tracking
## 
## > ## Data for Fig 2: Runtime by model
## > time_results <- irtm_results_to_df(updated_time,
## +                                    small_sim,
## +             .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## 
## > time_results$statistic <- "runtime"
## 
## > ## Data for Fig 3:  count NA by models:
## > na_count_by_group <- irtm_results_to_df(all_results,
## +                                          small_sim, .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## 
## > ##%%%%%%%%%%%%%%%%%%%%
## > ## Plots:
## > 
## > p_results <- ggplot(sim_results, aes(x= pass_d, 
## +                        y=avg,
## +                       ymi .... [TRUNCATED] 
## 
## > p_results
```

```
## 
## > ggsave(filename='simulations/results/figures/irt-only.png', 
## +        plot=p_results,
## +        dpi = 300,  width = 12, height=6)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

```
## 
## > ## Time comparison
## > 
## > p_time <- ggplot(time_results, aes(x= pass_d, 
## +                                      y=avg,
## +                               .... [TRUNCATED] 
## 
## > p_time
```

```
## 
## > ggsave(filename='simulations/results/figures/runtime_irtm_only.png', 
## +        plot=p_time,
## +        dpi = 300,  width = 12, height=6)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-2.png)

```
## 
## > ## Percent failed models:
## > ## first count NA results by model and d specification
## > 
## > ## Summarize the number of failed models
## > ## per dimension- .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## 
## > runtime_all$statistic <- "runtime" ## to keep track
## 
## > runtime_all <- runtime_all[, c('irtm','pass_d')] %>% 
## +   pivot_longer(
## +   cols = c('irtm'),  # Select the columns that start with avg, min, max
## +  .... [TRUNCATED] 
## 
## > ## Individual plots for runtime box plots; b/c the 
## > ## scales
## > grtbox <- ggplot(runtime_all, 
## +        aes(x=as.factor(pass_d),
## +            y=va .... [TRUNCATED] 
## 
## > grtbox
```

```
## 
## > ggsave(filename='simulations/results/figures/irtm_only_runtime_boxplot.png',
## +        plot=grtbox,
## +        dpi = 300, 
## +        width = 12, 
## +      .... [TRUNCATED]
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-3.png)

Simulation for effect of Lambda Sparsity
120 entries



``` r
source("irtm_lambda_sparsity_sim.R", echo = TRUE)
```

```
## 
## > ## This script analyzes effects of model sparsity on IRTM 
## > ## N (100) and K (10) and d = 4, 6, 8
## > ## It does 50 iterations of each pair, with 50  .... [TRUNCATED] 
## 
## > library(mvtnorm)
## 
## > library(coda)
## 
## > library(nimble)
## 
## > library(IRTM)
## 
## > #library(blavaan)
## > 
## > # Source custom helper functions
## > source('helpers.R') ## mse, custom plots
## 
## > source('cfa_model_syntax.R') ## script to format CFA model input
## 
## > source('format_cfa_lambda.R') ## script to format CFA loadings
## 
## > source("blavPredict_format_conversion.R") #script to format blavaan samples
## 
## > source('irtm_sims_gen_data.R') ## script to generate data
## 
## > source('irtm_bsem_results_to_df.R') ## script to format list of results as single df
## 
## > ## Data prep
## > 
## > ### Declare params for sparsity analysis
## > ## Lambda zero percent:
## > 
## > ## testing at: 25%, 50%, 75% sparsity
## > ## (need some spar .... [TRUNCATED] 
## 
## > K_vals = 10 # features
## 
## > d_vals = c(2, 3, 5, 8)# dimensions                            
## 
## > z_vals = c(.25, .5, .75) # zero values
## 
## > nsim <- 10 #number each
## 
## > sparsity_vals = expand.grid(N_vals,
## +                        K_vals,
## +                        d_vals, 
## +                        z_vals,
## +            .... [TRUNCATED] 
## 
## > sparsity_vals$Var5 <- 1:nrow(sparsity_vals) ## unique ID to serve as sim seed
## 
## > ## Randomly shuffle
## > 
## > sparsity_vals <- sparsity_vals[sample(nrow(sparsity_vals), 
## +                             nrow(sparsity_vals), replace=FALS .... [TRUNCATED] 
## 
## > ## 
## > set.seed(1029)
## 
## > ## Simulations:
## > 
## > all_results = list()
## 
## > model_times = list()
## 
## > ## marker to see which chain is running (if more than one)
## > 
## > chain = 1
## 
## > ## set up test subset:
## > ##120 rows:
## > small_sim <- sparsity_vals
## 
## > for(i in 1:nrow(small_sim)){ ## open for loop
## +   print(paste0("Start pass ", i, ":"))
## +   pass_start <- Sys.time()
## +   params <- small_sim[i, c("Va ..." ... [TRUNCATED] 
## [1] "Start pass 1:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 2:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 3:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 4:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 5:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 6:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 7:"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 8:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 9:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 10:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 11:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 12:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 13:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 14:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 15:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 16:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 17:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 18:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 19:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 20:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 21:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 22:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 23:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 24:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 25:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 26:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 27:"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 28:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 29:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 30:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 31:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 32:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 33:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 34:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 35:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 36:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 37:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 38:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 39:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 40:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 41:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 42:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 43:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 44:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 45:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 46:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 47:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 48:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 49:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 50:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 51:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 52:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 53:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 54:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 55:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 56:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 57:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 58:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 59:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 60:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 61:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 62:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 63:"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 64:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 65:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 66:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 67:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 68:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 69:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 70:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 71:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 72:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 73:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 74:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 75:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 76:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 77:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 78:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 79:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 80:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 81:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 82:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 83:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 84:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 85:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 86:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 87:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 88:"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 89:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 90:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 91:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 92:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 93:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 94:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 95:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 96:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 97:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 98:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 99:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 100:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 101:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 102:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 103:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 104:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 105:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 106:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 107:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 108:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 109:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 110:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 111:"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 112:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 113:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 114:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 115:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 116:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 117:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 118:"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 119:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## [1] "Start pass 120:"
## [1] "round"
## [1] "Running IRT-M"
```

```
## Sampling...
```

```
## 
## > ## Save results
## > fname = paste0("irtm_only_lambda_sparsity.rds")
## 
## > save(all_results, file=fname)
## 
## > ## save time info
## > tname = paste0("irtm_only_lambda_sparsity_time.rds")
## 
## > save(model_times, file=tname)
## 
## > ### save param data for analysis:
## > sname = paste0("irtm_small_sim_params_sparsity.rds")
## 
## > save(small_sim, file=sname)
```

produces:
irtm_only_lambda_sparsity_time.rds
irtm_only_lambda_sparsity.rds
irtm_small_sim_params_sparsity.rds ## parameters


``` r
## 
## Produce results figures:
source("irtm_onlylamba_sparsity_plots.R", echo = TRUE)
```

```
## Warning in file(filename, "r", encoding = encoding): cannot open file
## 'irtm_onlylamba_sparsity_plots.R': No such file or directory
```

```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```

``` r
##%%%%%%%%%%%%%%%%%%% 
## Benchmark time for a wider range of results:
##%%%%%%%%%%%%%%%%%%%%%%
```

simulation
runs a wider N, K range for 10 passes each.
Adjusted to standardize to seconds 6/25
480 entries, less cases where d > k
took almost 20 days on macbook pro
(commented out because of time)
entire set, saves intermediate every 5:


``` r
#source("irtm_bsem_bcfa_sim_single_pass_for_time.R")

## Updated version with only IRT-M
source("irtm_only_single_pass_for_time.R", echo = TRUE)
```

```
## 
## > ## This is a single pass through to get an approximate 
## > ## time benchmark for IRTM vs other models
## > 
## > library(MASS)
## 
## > library(mvtnorm)
## 
## > library(coda)
## 
## > library(nimble)
## 
## > library(IRTM)
## 
## > library(dplyr)
## 
## > # Source custom helper functions
## > source('helpers.R') ## mse, custom plots
## 
## > source('cfa_model_syntax.R') ## script to format CFA model input
## 
## > source('format_cfa_lambda.R') ## script to format CFA loadings
## 
## > source("blavPredict_format_conversion.R") #script to format blavaan samples
## 
## > source('irtm_sims_gen_data.R') ## script to generate data
## 
## > source('irtm_bsem_results_to_df.R') ## script to format list of results as single df
## 
## > ## Make names to save partial `results:
## > ##  
## > 
## > tpartname = "irtm_bcfa_bsem_time_partial_.rds"
## 
## > ppartname = "irtm_bcfa_bsem_params_partial_.rds"
## 
## > rpartname = "irtm_bcfa_bsem_res_partial_.rds"
## 
## > ## Data prep
## > 
## > # Load simulation parameters
## > NKd_vals <- readRDS('simulations/params.rds')
## 
## > ##list of smaller models
## > ## with 100 observations and 10 features
## > 
## > lambda_zero_pct <- 0.75 ## 75% 0 runs CFA and SEM! 
## 
## > ## 50% lambda zero does not, though does run for IRTM
## > 
## > ## Pass through 11/14: expand the NxK ranges:
## > ## N and features: 
## > ## N: 50, 250, 1000 .... [TRUNCATED] 
## 
## > ## K of 250 hung up BSEM at starting values for over an hour and a half
## > ## transforming those entries into K=5
## > ## Trasforming the 500 into 20. 
##  .... [TRUNCATED] 
## 
## > single_pass[which(single_pass$Var2==500), "Var2"] <- 20
## 
## > ## Ten of each:
## > ## N = 480 obs
## > single_pass_no_dupes <- single_pass %>%
## +   dplyr::distinct(Var1, Var2, Var3) %>%
## +   slice(rep(1:n(), each = 10) .... [TRUNCATED] 
## 
## > ## re-index the run id:
## > single_pass_no_dupes$Var4 <- 1:nrow(single_pass_no_dupes)
## 
## > ## If you want to run in parallel:
## > ## 1/6 is 80
## > 
## > dims <- dim(single_pass_no_dupes)[1]/6
## 
## > range_set1 <- single_pass_no_dupes[1:dims,]
## 
## > ## cleanup:
## > rm(NKd_vals)
## 
## > rm(single_pass)
## 
## > set.seed(1029)
## 
## > ## Simulations:
## > 
## > all_results = list()
## 
## > model_times = list()
## 
## > params_tracker = list()
## 
## > ## marker to see which  is running (if more than one)
## > 
## > for(i in 1:nrow(single_pass_no_dupes)){ ## open for loop
## +   print(paste0("Start pass ",  .... [TRUNCATED] 
## [1] "Start pass 1:"
## [1] "Start time: 2025-08-03 16:22:09.739112"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 2:"
## [1] "Start time: 2025-08-03 16:22:09.847744"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 3:"
## [1] "Start time: 2025-08-03 16:22:09.887478"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 4:"
## [1] "Start time: 2025-08-03 16:22:09.904336"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 5:"
## [1] "Start time: 2025-08-03 16:22:09.924116"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 6:"
## [1] "Start time: 2025-08-03 16:22:09.941777"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 7:"
## [1] "Start time: 2025-08-03 16:22:09.956261"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 8:"
## [1] "Start time: 2025-08-03 16:22:09.970614"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 9:"
## [1] "Start time: 2025-08-03 16:22:09.988351"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 10:"
## [1] "Start time: 2025-08-03 16:22:10.004035"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 11:"
## [1] "Start time: 2025-08-03 16:22:10.019428"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 12:"
## [1] "Start time: 2025-08-03 16:22:10.025481"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:10.030134"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:10.326044"
## [1] "run_time: 0.295910120010376"
## [1] "End time: 2025-08-03 16:22:10.392817"
## [1] "Pass took 0.3673"
## [1] "Start pass 13:"
## [1] "Start time: 2025-08-03 16:22:10.39314"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:10.402971"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:10.688205"
## [1] "run_time: 0.285233974456787"
## [1] "End time: 2025-08-03 16:22:10.729543"
## [1] "Pass took 0.3364"
## [1] "Start pass 14:"
## [1] "Start time: 2025-08-03 16:22:10.729897"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 15:"
## [1] "Start time: 2025-08-03 16:22:10.735056"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 16:"
## [1] "Start time: 2025-08-03 16:22:10.747091"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:10.752269"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:11.079994"
## [1] "run_time: 0.327724933624268"
## [1] "End time: 2025-08-03 16:22:11.122171"
## [1] "Pass took 0.3751"
## [1] "Start pass 17:"
## [1] "Start time: 2025-08-03 16:22:11.122496"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 18:"
## [1] "Start time: 2025-08-03 16:22:11.127518"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 19:"
## [1] "Start time: 2025-08-03 16:22:11.132774"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 20:"
## [1] "Start time: 2025-08-03 16:22:11.137749"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:11.141637"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:11.452713"
## [1] "run_time: 0.311075925827026"
## [1] "End time: 2025-08-03 16:22:11.495305"
## [1] "Pass took 0.3576"
## [1] "Start pass 21:"
## [1] "Start time: 2025-08-03 16:22:11.498361"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 22:"
## [1] "Start time: 2025-08-03 16:22:11.504054"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 23:"
## [1] "Start time: 2025-08-03 16:22:11.509945"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 24:"
## [1] "Start time: 2025-08-03 16:22:11.515279"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 25:"
## [1] "Start time: 2025-08-03 16:22:11.520978"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:11.5256"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:12.470024"
## [1] "run_time: 0.944424152374268"
## [1] "End time: 2025-08-03 16:22:12.600105"
## [1] "Pass took 1.0791"
## [1] "Start pass 26:"
## [1] "Start time: 2025-08-03 16:22:12.601393"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 27:"
## [1] "Start time: 2025-08-03 16:22:12.607926"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 28:"
## [1] "Start time: 2025-08-03 16:22:12.613149"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 29:"
## [1] "Start time: 2025-08-03 16:22:12.61874"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:12.623688"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:13.564559"
## [1] "run_time: 0.940871000289917"
## [1] "End time: 2025-08-03 16:22:13.703152"
## [1] "Pass took 1.0844"
## [1] "Start pass 30:"
## [1] "Start time: 2025-08-03 16:22:13.703501"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 31:"
## [1] "Start time: 2025-08-03 16:22:13.709308"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:13.755223"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:16.69084"
## [1] "run_time: 2.93561697006226"
## [1] "End time: 2025-08-03 16:22:16.885247"
## [1] "Pass took 3.1759"
## [1] "Start pass 32:"
## [1] "Start time: 2025-08-03 16:22:16.885597"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:16.935825"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:19.850971"
## [1] "run_time: 2.91514587402344"
## [1] "End time: 2025-08-03 16:22:20.040538"
## [1] "Pass took 3.1549"
## [1] "Start pass 33:"
## [1] "Start time: 2025-08-03 16:22:20.040879"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:20.087618"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:23.012824"
## [1] "run_time: 2.92520594596863"
## [1] "End time: 2025-08-03 16:22:23.234297"
## [1] "Pass took 3.1934"
## [1] "Start pass 34:"
## [1] "Start time: 2025-08-03 16:22:23.234654"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:23.281587"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:26.256644"
## [1] "run_time: 2.97505712509155"
## [1] "End time: 2025-08-03 16:22:26.466724"
## [1] "Pass took 3.2321"
## [1] "Start pass 35:"
## [1] "Start time: 2025-08-03 16:22:26.467118"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:26.514543"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:29.610546"
## [1] "run_time: 3.09600305557251"
## [1] "End time: 2025-08-03 16:22:29.791257"
## [1] "Pass took 3.3241"
## [1] "Start pass 36:"
## [1] "Start time: 2025-08-03 16:22:29.792934"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:29.838003"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:32.739265"
## [1] "run_time: 2.90126204490662"
## [1] "End time: 2025-08-03 16:22:32.961994"
## [1] "Pass took 3.1691"
## [1] "Start pass 37:"
## [1] "Start time: 2025-08-03 16:22:32.962482"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:33.014057"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:35.94347"
## [1] "run_time: 2.92941308021545"
## [1] "End time: 2025-08-03 16:22:36.158892"
## [1] "Pass took 3.1964"
## [1] "Start pass 38:"
## [1] "Start time: 2025-08-03 16:22:36.159373"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:36.211334"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:39.12895"
## [1] "run_time: 2.91761612892151"
## [1] "End time: 2025-08-03 16:22:39.34542"
## [1] "Pass took 3.186"
## [1] "Start pass 39:"
## [1] "Start time: 2025-08-03 16:22:39.345798"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:39.395385"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:42.355476"
## [1] "run_time: 2.96009087562561"
## [1] "End time: 2025-08-03 16:22:42.541887"
## [1] "Pass took 3.1961"
## [1] "Start pass 40:"
## [1] "Start time: 2025-08-03 16:22:42.542284"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:42.588359"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:45.48654"
## [1] "run_time: 2.89818096160889"
## [1] "End time: 2025-08-03 16:22:45.680925"
## [1] "Pass took 3.1386"
## [1] "Start pass 41:"
## [1] "Start time: 2025-08-03 16:22:45.682639"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:46.057254"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:22:55.846629"
## [1] "run_time: 9.78937482833862"
## [1] "End time: 2025-08-03 16:22:56.31214"
## [1] "Pass took 10.6295"
## [1] "Start pass 42:"
## [1] "Start time: 2025-08-03 16:22:56.312544"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:22:56.514774"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:23:06.683595"
## [1] "run_time: 10.1688208580017"
## [1] "End time: 2025-08-03 16:23:07.198997"
## [1] "Pass took 10.8865"
## [1] "Start pass 43:"
## [1] "Start time: 2025-08-03 16:23:07.199392"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:23:07.394867"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:23:17.415915"
## [1] "run_time: 10.0210480690002"
## [1] "End time: 2025-08-03 16:23:18.118753"
## [1] "Pass took 10.9194"
## [1] "Start pass 44:"
## [1] "Start time: 2025-08-03 16:23:18.119154"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:23:18.326494"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:23:28.448198"
## [1] "run_time: 10.1217041015625"
## [1] "End time: 2025-08-03 16:23:28.947543"
## [1] "Pass took 10.8284"
## [1] "Start pass 45:"
## [1] "Start time: 2025-08-03 16:23:28.947922"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:23:29.145009"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:23:39.398518"
## [1] "run_time: 10.2535090446472"
## [1] "End time: 2025-08-03 16:23:39.878292"
## [1] "Pass took 10.9304"
## [1] "Start pass 46:"
## [1] "Start time: 2025-08-03 16:23:39.882415"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:23:40.08064"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:23:50.220842"
## [1] "run_time: 10.1402018070221"
## [1] "End time: 2025-08-03 16:23:50.915758"
## [1] "Pass took 11.0333"
## [1] "Start pass 47:"
## [1] "Start time: 2025-08-03 16:23:50.916086"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:23:51.119709"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:24:01.417943"
## [1] "run_time: 10.2982339859009"
## [1] "End time: 2025-08-03 16:24:02.078918"
## [1] "Pass took 11.1628"
## [1] "Start pass 48:"
## [1] "Start time: 2025-08-03 16:24:02.079316"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:24:02.28415"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:24:12.357159"
## [1] "run_time: 10.0730090141296"
## [1] "End time: 2025-08-03 16:24:12.833293"
## [1] "Pass took 10.754"
## [1] "Start pass 49:"
## [1] "Start time: 2025-08-03 16:24:12.83368"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:24:13.019074"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:24:22.988695"
## [1] "run_time: 9.96962094306946"
## [1] "End time: 2025-08-03 16:24:23.4666"
## [1] "Pass took 10.6329"
## [1] "Start pass 50:"
## [1] "Start time: 2025-08-03 16:24:23.466908"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:24:23.664311"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:24:33.948784"
## [1] "run_time: 10.2844731807709"
## [1] "End time: 2025-08-03 16:24:34.599727"
## [1] "Pass took 11.1328"
## [1] "Start pass 51:"
## [1] "Start time: 2025-08-03 16:24:34.603809"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:24:34.725653"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:24:46.677827"
## [1] "run_time: 11.952173948288"
## [1] "End time: 2025-08-03 16:24:47.473817"
## [1] "Pass took 12.87"
## [1] "Start pass 52:"
## [1] "Start time: 2025-08-03 16:24:47.474198"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:24:47.604642"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:24:59.806153"
## [1] "run_time: 12.2015111446381"
## [1] "End time: 2025-08-03 16:25:00.409951"
## [1] "Pass took 12.9358"
## [1] "Start pass 53:"
## [1] "Start time: 2025-08-03 16:25:00.410358"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:25:00.532803"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:25:12.738783"
## [1] "run_time: 12.2059798240662"
## [1] "End time: 2025-08-03 16:25:13.3056"
## [1] "Pass took 12.8952"
## [1] "Start pass 54:"
## [1] "Start time: 2025-08-03 16:25:13.305938"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:25:13.429704"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:25:25.233008"
## [1] "run_time: 11.8033039569855"
## [1] "End time: 2025-08-03 16:25:25.998761"
## [1] "Pass took 12.6928"
## [1] "Start pass 55:"
## [1] "Start time: 2025-08-03 16:25:25.999144"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:25:26.129176"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:25:38.004446"
## [1] "run_time: 11.8752701282501"
## [1] "End time: 2025-08-03 16:25:38.566123"
## [1] "Pass took 12.567"
## [1] "Start pass 56:"
## [1] "Start time: 2025-08-03 16:25:38.57065"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:25:38.686465"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:25:52.775213"
## [1] "run_time: 14.0887479782104"
## [1] "End time: 2025-08-03 16:25:55.101331"
## [1] "Pass took 16.5307"
## [1] "Start pass 57:"
## [1] "Start time: 2025-08-03 16:25:55.102043"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:25:55.334312"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:26:07.880105"
## [1] "run_time: 12.545793056488"
## [1] "End time: 2025-08-03 16:26:08.774792"
## [1] "Pass took 13.6727"
## [1] "Start pass 58:"
## [1] "Start time: 2025-08-03 16:26:08.775218"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:26:08.900232"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:26:20.77771"
## [1] "run_time: 11.8774778842926"
## [1] "End time: 2025-08-03 16:26:21.348985"
## [1] "Pass took 12.5738"
## [1] "Start pass 59:"
## [1] "Start time: 2025-08-03 16:26:21.349366"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:26:21.471952"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:26:33.59317"
## [1] "run_time: 12.1212179660797"
## [1] "End time: 2025-08-03 16:26:34.448254"
## [1] "Pass took 13.0989"
## [1] "Start pass 60:"
## [1] "Start time: 2025-08-03 16:26:34.448731"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:26:34.56644"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:26:46.474825"
## [1] "run_time: 11.9083847999573"
## [1] "End time: 2025-08-03 16:26:47.067517"
## [1] "Pass took 12.6188"
## [1] "Start pass 61:"
## [1] "Start time: 2025-08-03 16:26:47.071303"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:26:47.261025"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:26:58.159047"
## [1] "run_time: 10.8980219364166"
## [1] "End time: 2025-08-03 16:26:59.123481"
## [1] "Pass took 12.0522"
## [1] "Start pass 62:"
## [1] "Start time: 2025-08-03 16:26:59.123873"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:26:59.323237"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:27:10.113985"
## [1] "run_time: 10.7907481193542"
## [1] "End time: 2025-08-03 16:27:10.975278"
## [1] "Pass took 11.8514"
## [1] "Start pass 63:"
## [1] "Start time: 2025-08-03 16:27:10.975721"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:27:11.183133"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:27:22.056685"
## [1] "run_time: 10.8735520839691"
## [1] "End time: 2025-08-03 16:27:22.983317"
## [1] "Pass took 12.0076"
## [1] "Start pass 64:"
## [1] "Start time: 2025-08-03 16:27:22.983709"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:27:23.182016"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:27:33.808905"
## [1] "run_time: 10.6268889904022"
## [1] "End time: 2025-08-03 16:27:34.712735"
## [1] "Pass took 11.729"
## [1] "Start pass 65:"
## [1] "Start time: 2025-08-03 16:27:34.713147"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:27:34.917589"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:27:45.922378"
## [1] "run_time: 11.0047891139984"
## [1] "End time: 2025-08-03 16:27:46.822476"
## [1] "Pass took 12.1093"
## [1] "Start pass 66:"
## [1] "Start time: 2025-08-03 16:27:46.827519"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:27:47.01692"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:27:58.081759"
## [1] "run_time: 11.064838886261"
## [1] "End time: 2025-08-03 16:27:59.039012"
## [1] "Pass took 12.2115"
## [1] "Start pass 67:"
## [1] "Start time: 2025-08-03 16:27:59.039399"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:27:59.234451"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:28:10.396127"
## [1] "run_time: 11.1616759300232"
## [1] "End time: 2025-08-03 16:28:11.281105"
## [1] "Pass took 12.2417"
## [1] "Start pass 68:"
## [1] "Start time: 2025-08-03 16:28:11.281486"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:28:11.472532"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:28:22.282852"
## [1] "run_time: 10.8103199005127"
## [1] "End time: 2025-08-03 16:28:23.212664"
## [1] "Pass took 11.9312"
## [1] "Start pass 69:"
## [1] "Start time: 2025-08-03 16:28:23.213054"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:28:23.417177"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:28:34.105981"
## [1] "run_time: 10.6888041496277"
## [1] "End time: 2025-08-03 16:28:35.048311"
## [1] "Pass took 11.8353"
## [1] "Start pass 70:"
## [1] "Start time: 2025-08-03 16:28:35.0487"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:28:35.254466"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:28:46.154657"
## [1] "run_time: 10.9001908302307"
## [1] "End time: 2025-08-03 16:28:47.061385"
## [1] "Pass took 12.0127"
## [1] "Start pass 71:"
## [1] "Start time: 2025-08-03 16:28:47.066524"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:28:47.185979"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:28:55.929389"
## [1] "run_time: 8.74341011047363"
## [1] "End time: 2025-08-03 16:28:56.319985"
## [1] "Pass took 9.2535"
## [1] "Start pass 72:"
## [1] "Start time: 2025-08-03 16:28:56.320319"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:28:56.437674"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:29:05.351083"
## [1] "run_time: 8.91340899467468"
## [1] "End time: 2025-08-03 16:29:05.905293"
## [1] "Pass took 9.585"
## [1] "Start pass 73:"
## [1] "Start time: 2025-08-03 16:29:05.905676"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:29:06.02682"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:29:14.78392"
## [1] "run_time: 8.75710010528564"
## [1] "End time: 2025-08-03 16:29:15.161403"
## [1] "Pass took 9.2557"
## [1] "Start pass 74:"
## [1] "Start time: 2025-08-03 16:29:15.161882"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:29:15.279312"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:29:24.020418"
## [1] "run_time: 8.7411060333252"
## [1] "End time: 2025-08-03 16:29:24.404673"
## [1] "Pass took 9.2428"
## [1] "Start pass 75:"
## [1] "Start time: 2025-08-03 16:29:24.405024"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:29:24.51776"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:29:33.203444"
## [1] "run_time: 8.68568396568298"
## [1] "End time: 2025-08-03 16:29:33.568545"
## [1] "Pass took 9.1635"
## [1] "Start pass 76:"
## [1] "Start time: 2025-08-03 16:29:33.573373"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:29:33.706985"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:29:42.457556"
## [1] "run_time: 8.75057101249695"
## [1] "End time: 2025-08-03 16:29:42.810541"
## [1] "Pass took 9.2372"
## [1] "Start pass 77:"
## [1] "Start time: 2025-08-03 16:29:42.811061"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:29:42.92947"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:29:51.591915"
## [1] "run_time: 8.6624448299408"
## [1] "End time: 2025-08-03 16:29:51.939258"
## [1] "Pass took 9.1282"
## [1] "Start pass 78:"
## [1] "Start time: 2025-08-03 16:29:51.939611"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:29:52.053036"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:00.843926"
## [1] "run_time: 8.79088997840881"
## [1] "End time: 2025-08-03 16:30:01.218871"
## [1] "Pass took 9.2793"
## [1] "Start pass 79:"
## [1] "Start time: 2025-08-03 16:30:01.21929"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:01.335981"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:09.989256"
## [1] "run_time: 8.65327501296997"
## [1] "End time: 2025-08-03 16:30:10.339834"
## [1] "Pass took 9.1205"
## [1] "Start pass 80:"
## [1] "Start time: 2025-08-03 16:30:10.3402"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:10.456615"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:19.118975"
## [1] "run_time: 8.66235995292664"
## [1] "End time: 2025-08-03 16:30:19.67423"
## [1] "Pass took 9.334"
## [1] "Start pass 81:"
## [1] "Start time: 2025-08-03 16:30:19.678474"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:19.704341"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:20.08892"
## [1] "run_time: 0.384579181671143"
## [1] "End time: 2025-08-03 16:30:20.118225"
## [1] "Pass took 0.4398"
## [1] "Start pass 82:"
## [1] "Start time: 2025-08-03 16:30:20.118464"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:20.125553"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:20.545541"
## [1] "run_time: 0.41998815536499"
## [1] "End time: 2025-08-03 16:30:20.573415"
## [1] "Pass took 0.455"
## [1] "Start pass 83:"
## [1] "Start time: 2025-08-03 16:30:20.57374"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:20.585405"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:20.982036"
## [1] "run_time: 0.396631002426147"
## [1] "End time: 2025-08-03 16:30:21.011108"
## [1] "Pass took 0.4374"
## [1] "Start pass 84:"
## [1] "Start time: 2025-08-03 16:30:21.011448"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:21.018125"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:21.415416"
## [1] "run_time: 0.397290945053101"
## [1] "End time: 2025-08-03 16:30:21.443393"
## [1] "Pass took 0.4319"
## [1] "Start pass 85:"
## [1] "Start time: 2025-08-03 16:30:21.443747"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:21.450146"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:21.835447"
## [1] "run_time: 0.385301113128662"
## [1] "End time: 2025-08-03 16:30:21.864439"
## [1] "Pass took 0.4207"
## [1] "Start pass 86:"
## [1] "Start time: 2025-08-03 16:30:21.867618"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:21.874314"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:22.27001"
## [1] "run_time: 0.395695924758911"
## [1] "End time: 2025-08-03 16:30:22.309304"
## [1] "Pass took 0.4417"
## [1] "Start pass 87:"
## [1] "Start time: 2025-08-03 16:30:22.309817"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:22.317786"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:22.691822"
## [1] "run_time: 0.374036073684692"
## [1] "End time: 2025-08-03 16:30:22.720643"
## [1] "Pass took 0.4108"
## [1] "Start pass 88:"
## [1] "Start time: 2025-08-03 16:30:22.720963"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:22.738343"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:23.121245"
## [1] "run_time: 0.382901906967163"
## [1] "End time: 2025-08-03 16:30:23.150984"
## [1] "Pass took 0.43"
## [1] "Start pass 89:"
## [1] "Start time: 2025-08-03 16:30:23.151334"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:23.157699"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:23.553416"
## [1] "run_time: 0.395716905593872"
## [1] "End time: 2025-08-03 16:30:23.581613"
## [1] "Pass took 0.4303"
## [1] "Start pass 90:"
## [1] "Start time: 2025-08-03 16:30:23.582008"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:23.588337"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:23.985641"
## [1] "run_time: 0.397304058074951"
## [1] "End time: 2025-08-03 16:30:24.015284"
## [1] "Pass took 0.4333"
## [1] "Start pass 91:"
## [1] "Start time: 2025-08-03 16:30:24.018622"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 92:"
## [1] "Start time: 2025-08-03 16:30:24.034761"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:24.048598"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:25.054112"
## [1] "run_time: 1.00551390647888"
## [1] "End time: 2025-08-03 16:30:25.239453"
## [1] "Pass took 1.2047"
## [1] "Start pass 93:"
## [1] "Start time: 2025-08-03 16:30:25.23982"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 94:"
## [1] "Start time: 2025-08-03 16:30:25.254501"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 95:"
## [1] "Start time: 2025-08-03 16:30:25.269051"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 96:"
## [1] "Start time: 2025-08-03 16:30:25.283856"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:25.297995"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:26.307866"
## [1] "run_time: 1.00987100601196"
## [1] "End time: 2025-08-03 16:30:26.488634"
## [1] "Pass took 1.2048"
## [1] "Start pass 97:"
## [1] "Start time: 2025-08-03 16:30:26.488955"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:26.502365"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:27.496552"
## [1] "run_time: 0.994186878204346"
## [1] "End time: 2025-08-03 16:30:27.68858"
## [1] "Pass took 1.1996"
## [1] "Start pass 98:"
## [1] "Start time: 2025-08-03 16:30:27.688917"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 99:"
## [1] "Start time: 2025-08-03 16:30:27.704007"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:27.718499"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:28.7327"
## [1] "run_time: 1.01420116424561"
## [1] "End time: 2025-08-03 16:30:28.911642"
## [1] "Pass took 1.2076"
## [1] "Start pass 100:"
## [1] "Start time: 2025-08-03 16:30:28.911982"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:28.925434"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:29.939383"
## [1] "run_time: 1.01394891738892"
## [1] "End time: 2025-08-03 16:30:30.119977"
## [1] "Pass took 1.208"
## [1] "Start pass 101:"
## [1] "Start time: 2025-08-03 16:30:30.123446"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 102:"
## [1] "Start time: 2025-08-03 16:30:30.130759"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 103:"
## [1] "Start time: 2025-08-03 16:30:30.137562"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:30.143733"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:31.025405"
## [1] "run_time: 0.881671905517578"
## [1] "End time: 2025-08-03 16:30:31.101231"
## [1] "Pass took 0.9637"
## [1] "Start pass 104:"
## [1] "Start time: 2025-08-03 16:30:31.101562"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:31.108049"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:32.021405"
## [1] "run_time: 0.913356065750122"
## [1] "End time: 2025-08-03 16:30:32.203856"
## [1] "Pass took 1.1023"
## [1] "Start pass 105:"
## [1] "Start time: 2025-08-03 16:30:32.206017"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:32.223625"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:33.130475"
## [1] "run_time: 0.906850099563599"
## [1] "End time: 2025-08-03 16:30:33.215646"
## [1] "Pass took 1.0096"
## [1] "Start pass 106:"
## [1] "Start time: 2025-08-03 16:30:33.219828"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:33.22631"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:34.092343"
## [1] "run_time: 0.86603307723999"
## [1] "End time: 2025-08-03 16:30:34.186619"
## [1] "Pass took 0.9668"
## [1] "Start pass 107:"
## [1] "Start time: 2025-08-03 16:30:34.18694"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:34.193435"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:35.104256"
## [1] "run_time: 0.910820960998535"
## [1] "End time: 2025-08-03 16:30:35.190951"
## [1] "Pass took 1.004"
## [1] "Start pass 108:"
## [1] "Start time: 2025-08-03 16:30:35.1913"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:35.198612"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:36.044143"
## [1] "run_time: 0.845530986785889"
## [1] "End time: 2025-08-03 16:30:36.130006"
## [1] "Pass took 0.9387"
## [1] "Start pass 109:"
## [1] "Start time: 2025-08-03 16:30:36.130416"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:36.138616"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:30:36.963558"
## [1] "run_time: 0.824941873550415"
## [1] "End time: 2025-08-03 16:30:37.041609"
## [1] "Pass took 0.9112"
## [1] "Start pass 110:"
## [1] "Start time: 2025-08-03 16:30:37.041954"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 111:"
## [1] "Start time: 2025-08-03 16:30:37.050053"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:30:37.555561"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:31:08.088329"
## [1] "run_time: 30.5327680110931"
## [1] "End time: 2025-08-03 16:31:09.635421"
## [1] "Pass took 32.5854"
## [1] "Start pass 112:"
## [1] "Start time: 2025-08-03 16:31:09.635799"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:31:10.114457"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:31:39.079748"
## [1] "run_time: 28.9652910232544"
## [1] "End time: 2025-08-03 16:31:40.512097"
## [1] "Pass took 30.8763"
## [1] "Start pass 113:"
## [1] "Start time: 2025-08-03 16:31:40.512476"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:31:41.011013"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:32:10.474808"
## [1] "run_time: 29.4637949466705"
## [1] "End time: 2025-08-03 16:32:11.908432"
## [1] "Pass took 31.396"
## [1] "Start pass 114:"
## [1] "Start time: 2025-08-03 16:32:11.908831"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:32:12.389143"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:32:41.525699"
## [1] "run_time: 29.1365559101105"
## [1] "End time: 2025-08-03 16:32:42.950713"
## [1] "Pass took 31.0419"
## [1] "Start pass 115:"
## [1] "Start time: 2025-08-03 16:32:42.95114"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:32:43.421761"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:33:12.611622"
## [1] "run_time: 29.1898610591888"
## [1] "End time: 2025-08-03 16:33:14.020311"
## [1] "Pass took 31.0692"
## [1] "Start pass 116:"
## [1] "Start time: 2025-08-03 16:33:14.026493"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:33:14.559785"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:33:43.894828"
## [1] "run_time: 29.3350431919098"
## [1] "End time: 2025-08-03 16:33:45.333348"
## [1] "Pass took 31.3069"
## [1] "Start pass 117:"
## [1] "Start time: 2025-08-03 16:33:45.333745"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:33:45.822244"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:34:15.357861"
## [1] "run_time: 29.5356171131134"
## [1] "End time: 2025-08-03 16:34:16.809544"
## [1] "Pass took 31.4758"
## [1] "Start pass 118:"
## [1] "Start time: 2025-08-03 16:34:16.809903"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:34:17.302609"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:34:46.328386"
## [1] "run_time: 29.0257771015167"
## [1] "End time: 2025-08-03 16:34:47.758102"
## [1] "Pass took 30.9482"
## [1] "Start pass 119:"
## [1] "Start time: 2025-08-03 16:34:47.75851"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:34:48.246257"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:35:17.904516"
## [1] "run_time: 29.6582589149475"
## [1] "End time: 2025-08-03 16:35:19.417112"
## [1] "Pass took 31.6586"
## [1] "Start pass 120:"
## [1] "Start time: 2025-08-03 16:35:19.417552"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:35:19.926349"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:35:48.759102"
## [1] "run_time: 28.8327531814575"
## [1] "End time: 2025-08-03 16:35:50.184422"
## [1] "Pass took 30.7669"
## [1] "Start pass 121:"
## [1] "Start time: 2025-08-03 16:35:50.191072"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:35:50.217844"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:35:56.476156"
## [1] "run_time: 6.25831198692322"
## [1] "End time: 2025-08-03 16:35:56.678688"
## [1] "Pass took 6.4876"
## [1] "Start pass 122:"
## [1] "Start time: 2025-08-03 16:35:56.679057"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:35:56.705936"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:02.970415"
## [1] "run_time: 6.26447916030884"
## [1] "End time: 2025-08-03 16:36:03.172381"
## [1] "Pass took 6.4933"
## [1] "Start pass 123:"
## [1] "Start time: 2025-08-03 16:36:03.172794"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:03.199016"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:09.473181"
## [1] "run_time: 6.27416491508484"
## [1] "End time: 2025-08-03 16:36:09.681106"
## [1] "Pass took 6.5083"
## [1] "Start pass 124:"
## [1] "Start time: 2025-08-03 16:36:09.681488"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:09.709569"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:15.959891"
## [1] "run_time: 6.25032210350037"
## [1] "End time: 2025-08-03 16:36:16.164971"
## [1] "Pass took 6.4835"
## [1] "Start pass 125:"
## [1] "Start time: 2025-08-03 16:36:16.165356"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:16.193068"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:22.458535"
## [1] "run_time: 6.26546692848206"
## [1] "End time: 2025-08-03 16:36:22.663504"
## [1] "Pass took 6.4981"
## [1] "Start pass 126:"
## [1] "Start time: 2025-08-03 16:36:22.668192"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:22.695647"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:28.89701"
## [1] "run_time: 6.20136308670044"
## [1] "End time: 2025-08-03 16:36:29.122804"
## [1] "Pass took 6.4546"
## [1] "Start pass 127:"
## [1] "Start time: 2025-08-03 16:36:29.123153"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:29.149503"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:35.416382"
## [1] "run_time: 6.26687908172607"
## [1] "End time: 2025-08-03 16:36:35.61789"
## [1] "Pass took 6.4947"
## [1] "Start pass 128:"
## [1] "Start time: 2025-08-03 16:36:35.61828"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:35.651925"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:41.922744"
## [1] "run_time: 6.27081894874573"
## [1] "End time: 2025-08-03 16:36:42.132924"
## [1] "Pass took 6.5146"
## [1] "Start pass 129:"
## [1] "Start time: 2025-08-03 16:36:42.13334"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:42.160751"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:48.623221"
## [1] "run_time: 6.46246981620789"
## [1] "End time: 2025-08-03 16:36:48.834619"
## [1] "Pass took 6.7013"
## [1] "Start pass 130:"
## [1] "Start time: 2025-08-03 16:36:48.834997"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:48.8639"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:36:55.113778"
## [1] "run_time: 6.24987816810608"
## [1] "End time: 2025-08-03 16:36:55.315876"
## [1] "Pass took 6.4809"
## [1] "Start pass 131:"
## [1] "Start time: 2025-08-03 16:36:55.320984"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:36:55.372267"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:00.952635"
## [1] "run_time: 5.58036804199219"
## [1] "End time: 2025-08-03 16:37:01.509985"
## [1] "Pass took 6.189"
## [1] "Start pass 132:"
## [1] "Start time: 2025-08-03 16:37:01.510469"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:01.561727"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:07.023789"
## [1] "run_time: 5.46206188201904"
## [1] "End time: 2025-08-03 16:37:07.589644"
## [1] "Pass took 6.0792"
## [1] "Start pass 133:"
## [1] "Start time: 2025-08-03 16:37:07.590027"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:07.640858"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:13.052288"
## [1] "run_time: 5.41143012046814"
## [1] "End time: 2025-08-03 16:37:13.604743"
## [1] "Pass took 6.0147"
## [1] "Start pass 134:"
## [1] "Start time: 2025-08-03 16:37:13.60515"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:13.658756"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:19.101806"
## [1] "run_time: 5.44304990768433"
## [1] "End time: 2025-08-03 16:37:19.652544"
## [1] "Pass took 6.0474"
## [1] "Start pass 135:"
## [1] "Start time: 2025-08-03 16:37:19.652918"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:19.707934"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:25.201659"
## [1] "run_time: 5.49372506141663"
## [1] "End time: 2025-08-03 16:37:25.904946"
## [1] "Pass took 6.252"
## [1] "Start pass 136:"
## [1] "Start time: 2025-08-03 16:37:25.909731"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:25.961833"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:31.417617"
## [1] "run_time: 5.45578408241272"
## [1] "End time: 2025-08-03 16:37:31.955753"
## [1] "Pass took 6.046"
## [1] "Start pass 137:"
## [1] "Start time: 2025-08-03 16:37:31.956125"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:32.007204"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:37.469356"
## [1] "run_time: 5.46215200424194"
## [1] "End time: 2025-08-03 16:37:38.016518"
## [1] "Pass took 6.0604"
## [1] "Start pass 138:"
## [1] "Start time: 2025-08-03 16:37:38.016887"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:38.066735"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:43.507775"
## [1] "run_time: 5.4410400390625"
## [1] "End time: 2025-08-03 16:37:44.252976"
## [1] "Pass took 6.2361"
## [1] "Start pass 139:"
## [1] "Start time: 2025-08-03 16:37:44.253362"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:44.305618"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:49.760759"
## [1] "run_time: 5.45514106750488"
## [1] "End time: 2025-08-03 16:37:50.290463"
## [1] "Pass took 6.0371"
## [1] "Start pass 140:"
## [1] "Start time: 2025-08-03 16:37:50.290878"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:50.345174"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:37:55.819028"
## [1] "run_time: 5.47385382652283"
## [1] "End time: 2025-08-03 16:37:56.367065"
## [1] "Pass took 6.0762"
## [1] "Start pass 141:"
## [1] "Start time: 2025-08-03 16:37:56.372299"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:37:56.575727"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:38:09.60088"
## [1] "run_time: 13.0251529216766"
## [1] "End time: 2025-08-03 16:38:11.037966"
## [1] "Pass took 14.6657"
## [1] "Start pass 142:"
## [1] "Start time: 2025-08-03 16:38:11.038348"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:38:11.244486"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:38:24.458092"
## [1] "run_time: 13.2136058807373"
## [1] "End time: 2025-08-03 16:38:25.843035"
## [1] "Pass took 14.8047"
## [1] "Start pass 143:"
## [1] "Start time: 2025-08-03 16:38:25.843419"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:38:26.044522"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:38:39.20085"
## [1] "run_time: 13.1563279628754"
## [1] "End time: 2025-08-03 16:38:40.554463"
## [1] "Pass took 14.711"
## [1] "Start pass 144:"
## [1] "Start time: 2025-08-03 16:38:40.554829"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:38:40.758626"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:38:54.097508"
## [1] "run_time: 13.3388819694519"
## [1] "End time: 2025-08-03 16:38:55.45703"
## [1] "Pass took 14.9022"
## [1] "Start pass 145:"
## [1] "Start time: 2025-08-03 16:38:55.45742"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:38:55.658055"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:39:08.961604"
## [1] "run_time: 13.3035490512848"
## [1] "End time: 2025-08-03 16:39:10.35977"
## [1] "Pass took 14.9023"
## [1] "Start pass 146:"
## [1] "Start time: 2025-08-03 16:39:10.367023"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:39:10.573213"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:39:23.817665"
## [1] "run_time: 13.2444519996643"
## [1] "End time: 2025-08-03 16:39:25.216354"
## [1] "Pass took 14.8493"
## [1] "Start pass 147:"
## [1] "Start time: 2025-08-03 16:39:25.216749"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:39:25.424771"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:39:38.569421"
## [1] "run_time: 13.1446499824524"
## [1] "End time: 2025-08-03 16:39:39.97579"
## [1] "Pass took 14.759"
## [1] "Start pass 148:"
## [1] "Start time: 2025-08-03 16:39:39.976178"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:39:40.176761"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:39:53.45901"
## [1] "run_time: 13.2822489738464"
## [1] "End time: 2025-08-03 16:39:54.815145"
## [1] "Pass took 14.839"
## [1] "Start pass 149:"
## [1] "Start time: 2025-08-03 16:39:54.815542"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:39:55.017359"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:08.265918"
## [1] "run_time: 13.2485589981079"
## [1] "End time: 2025-08-03 16:40:09.65371"
## [1] "Pass took 14.8382"
## [1] "Start pass 150:"
## [1] "Start time: 2025-08-03 16:40:09.654038"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:09.860345"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:23.147249"
## [1] "run_time: 13.2869040966034"
## [1] "End time: 2025-08-03 16:40:24.542217"
## [1] "Pass took 14.8882"
## [1] "Start pass 151:"
## [1] "Start time: 2025-08-03 16:40:24.549482"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 152:"
## [1] "Start time: 2025-08-03 16:40:24.576641"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:24.602914"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:26.849267"
## [1] "run_time: 2.24635291099548"
## [1] "End time: 2025-08-03 16:40:27.161253"
## [1] "Pass took 2.5846"
## [1] "Start pass 153:"
## [1] "Start time: 2025-08-03 16:40:27.161653"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:27.20163"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:29.373957"
## [1] "run_time: 2.1723268032074"
## [1] "End time: 2025-08-03 16:40:29.693541"
## [1] "Pass took 2.5319"
## [1] "Start pass 154:"
## [1] "Start time: 2025-08-03 16:40:29.693909"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:29.720747"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:31.947179"
## [1] "run_time: 2.22643208503723"
## [1] "End time: 2025-08-03 16:40:32.454508"
## [1] "Pass took 2.7606"
## [1] "Start pass 155:"
## [1] "Start time: 2025-08-03 16:40:32.454865"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 156:"
## [1] "Start time: 2025-08-03 16:40:32.484076"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:32.511842"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:34.695681"
## [1] "run_time: 2.1838390827179"
## [1] "End time: 2025-08-03 16:40:35.009185"
## [1] "Pass took 2.5251"
## [1] "Start pass 157:"
## [1] "Start time: 2025-08-03 16:40:35.009753"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:35.036223"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:37.22725"
## [1] "run_time: 2.19102716445923"
## [1] "End time: 2025-08-03 16:40:37.55211"
## [1] "Pass took 2.5424"
## [1] "Start pass 158:"
## [1] "Start time: 2025-08-03 16:40:37.552479"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:37.57677"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:39.823172"
## [1] "run_time: 2.24640202522278"
## [1] "End time: 2025-08-03 16:40:40.14492"
## [1] "Pass took 2.5924"
## [1] "Start pass 159:"
## [1] "Start time: 2025-08-03 16:40:40.145299"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:40.172605"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:42.402221"
## [1] "run_time: 2.22961592674255"
## [1] "End time: 2025-08-03 16:40:42.723175"
## [1] "Pass took 2.5779"
## [1] "Start pass 160:"
## [1] "Start time: 2025-08-03 16:40:42.72354"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:42.750907"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:44.986226"
## [1] "run_time: 2.23531913757324"
## [1] "End time: 2025-08-03 16:40:45.325092"
## [1] "Pass took 2.6016"
## [1] "Start pass 161:"
## [1] "Start time: 2025-08-03 16:40:45.331209"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:45.357788"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:46.827127"
## [1] "run_time: 1.46933889389038"
## [1] "End time: 2025-08-03 16:40:46.950702"
## [1] "Pass took 1.6195"
## [1] "Start pass 162:"
## [1] "Start time: 2025-08-03 16:40:46.951017"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:46.97639"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:48.438911"
## [1] "run_time: 1.46252107620239"
## [1] "End time: 2025-08-03 16:40:48.577922"
## [1] "Pass took 1.6269"
## [1] "Start pass 163:"
## [1] "Start time: 2025-08-03 16:40:48.578272"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:48.602569"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:50.068762"
## [1] "run_time: 1.46619296073914"
## [1] "End time: 2025-08-03 16:40:50.193974"
## [1] "Pass took 1.6157"
## [1] "Start pass 164:"
## [1] "Start time: 2025-08-03 16:40:50.194308"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:50.218994"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:51.696253"
## [1] "run_time: 1.47725915908813"
## [1] "End time: 2025-08-03 16:40:51.824626"
## [1] "Pass took 1.6303"
## [1] "Start pass 165:"
## [1] "Start time: 2025-08-03 16:40:51.825025"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:51.852368"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:53.313797"
## [1] "run_time: 1.46142888069153"
## [1] "End time: 2025-08-03 16:40:53.438574"
## [1] "Pass took 1.6135"
## [1] "Start pass 166:"
## [1] "Start time: 2025-08-03 16:40:53.444704"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:53.470605"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:54.869041"
## [1] "run_time: 1.39843606948853"
## [1] "End time: 2025-08-03 16:40:54.993032"
## [1] "Pass took 1.5483"
## [1] "Start pass 167:"
## [1] "Start time: 2025-08-03 16:40:54.99336"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:55.018403"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:56.460775"
## [1] "run_time: 1.44237184524536"
## [1] "End time: 2025-08-03 16:40:56.589075"
## [1] "Pass took 1.5957"
## [1] "Start pass 168:"
## [1] "Start time: 2025-08-03 16:40:56.589399"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:56.614024"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:58.06147"
## [1] "run_time: 1.44744610786438"
## [1] "End time: 2025-08-03 16:40:58.239163"
## [1] "Pass took 1.6498"
## [1] "Start pass 169:"
## [1] "Start time: 2025-08-03 16:40:58.239872"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:58.284968"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:40:59.728952"
## [1] "run_time: 1.44398403167725"
## [1] "End time: 2025-08-03 16:40:59.858431"
## [1] "Pass took 1.6186"
## [1] "Start pass 170:"
## [1] "Start time: 2025-08-03 16:40:59.858838"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:40:59.886297"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:41:01.319016"
## [1] "run_time: 1.43271899223328"
## [1] "End time: 2025-08-03 16:41:01.438309"
## [1] "Pass took 1.5795"
## [1] "Start pass 171:"
## [1] "Start time: 2025-08-03 16:41:01.444558"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 172:"
## [1] "Start time: 2025-08-03 16:41:01.449776"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 173:"
## [1] "Start time: 2025-08-03 16:41:01.454646"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:41:01.458631"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:41:01.947544"
## [1] "run_time: 0.488913059234619"
## [1] "End time: 2025-08-03 16:41:02.024154"
## [1] "Pass took 0.5695"
## [1] "Start pass 174:"
## [1] "Start time: 2025-08-03 16:41:02.024528"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:41:02.029707"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:41:02.525324"
## [1] "run_time: 0.495617151260376"
## [1] "End time: 2025-08-03 16:41:02.60837"
## [1] "Pass took 0.5838"
## [1] "Start pass 175:"
## [1] "Start time: 2025-08-03 16:41:02.608704"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 176:"
## [1] "Start time: 2025-08-03 16:41:02.613904"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 177:"
## [1] "Start time: 2025-08-03 16:41:02.618906"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 178:"
## [1] "Start time: 2025-08-03 16:41:02.623626"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:41:02.627666"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:41:03.133312"
## [1] "run_time: 0.505645990371704"
## [1] "End time: 2025-08-03 16:41:03.210348"
## [1] "Pass took 0.5867"
## [1] "Start pass 179:"
## [1] "Start time: 2025-08-03 16:41:03.210669"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 180:"
## [1] "Start time: 2025-08-03 16:41:03.217176"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 181:"
## [1] "Start time: 2025-08-03 16:41:03.223044"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:41:03.745782"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:41:29.151907"
## [1] "run_time: 25.4061250686646"
## [1] "End time: 2025-08-03 16:41:29.886363"
## [1] "Pass took 26.6633"
## [1] "Start pass 182:"
## [1] "Start time: 2025-08-03 16:41:29.886727"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:41:30.387917"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:41:56.111641"
## [1] "run_time: 25.7237238883972"
## [1] "End time: 2025-08-03 16:41:56.863214"
## [1] "Pass took 26.9765"
## [1] "Start pass 183:"
## [1] "Start time: 2025-08-03 16:41:56.863601"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:41:57.351737"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:42:22.988104"
## [1] "run_time: 25.6363670825958"
## [1] "End time: 2025-08-03 16:42:23.742821"
## [1] "Pass took 26.8792"
## [1] "Start pass 184:"
## [1] "Start time: 2025-08-03 16:42:23.743152"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:42:24.400669"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:42:50.069688"
## [1] "run_time: 25.6690189838409"
## [1] "End time: 2025-08-03 16:42:50.806092"
## [1] "Pass took 27.0629"
## [1] "Start pass 185:"
## [1] "Start time: 2025-08-03 16:42:50.806518"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:42:51.288736"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:43:16.920064"
## [1] "run_time: 25.6313278675079"
## [1] "End time: 2025-08-03 16:43:17.6565"
## [1] "Pass took 26.85"
## [1] "Start pass 186:"
## [1] "Start time: 2025-08-03 16:43:17.66468"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:43:18.181193"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:43:43.629304"
## [1] "run_time: 25.4481108188629"
## [1] "End time: 2025-08-03 16:43:44.551111"
## [1] "Pass took 26.8864"
## [1] "Start pass 187:"
## [1] "Start time: 2025-08-03 16:43:44.551508"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:43:45.044168"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:44:10.567064"
## [1] "run_time: 25.5228960514069"
## [1] "End time: 2025-08-03 16:44:11.307978"
## [1] "Pass took 26.7565"
## [1] "Start pass 188:"
## [1] "Start time: 2025-08-03 16:44:11.308342"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:44:11.808522"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:44:37.533845"
## [1] "run_time: 25.7253229618073"
## [1] "End time: 2025-08-03 16:44:38.285267"
## [1] "Pass took 26.9769"
## [1] "Start pass 189:"
## [1] "Start time: 2025-08-03 16:44:38.285666"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:44:38.778921"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:45:04.59709"
## [1] "run_time: 25.8181691169739"
## [1] "End time: 2025-08-03 16:45:05.539538"
## [1] "Pass took 27.2539"
## [1] "Start pass 190:"
## [1] "Start time: 2025-08-03 16:45:05.539919"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:45:06.034042"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:45:31.289806"
## [1] "run_time: 25.2557640075684"
## [1] "End time: 2025-08-03 16:45:32.037474"
## [1] "Pass took 26.4976"
## [1] "Start pass 191:"
## [1] "Start time: 2025-08-03 16:45:32.046286"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:45:32.147942"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:45:37.632307"
## [1] "run_time: 5.48436498641968"
## [1] "End time: 2025-08-03 16:45:38.119341"
## [1] "Pass took 6.0731"
## [1] "Start pass 192:"
## [1] "Start time: 2025-08-03 16:45:38.119726"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:45:38.218137"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:45:43.652093"
## [1] "run_time: 5.43395590782166"
## [1] "End time: 2025-08-03 16:45:44.141266"
## [1] "Pass took 6.0215"
## [1] "Start pass 193:"
## [1] "Start time: 2025-08-03 16:45:44.141637"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:45:44.238023"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:45:49.788003"
## [1] "run_time: 5.54997992515564"
## [1] "End time: 2025-08-03 16:45:50.28217"
## [1] "Pass took 6.1405"
## [1] "Start pass 194:"
## [1] "Start time: 2025-08-03 16:45:50.282562"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:45:50.386404"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:45:55.874512"
## [1] "run_time: 5.48810791969299"
## [1] "End time: 2025-08-03 16:45:56.530621"
## [1] "Pass took 6.2481"
## [1] "Start pass 195:"
## [1] "Start time: 2025-08-03 16:45:56.531004"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:45:56.630624"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:02.221563"
## [1] "run_time: 5.59093904495239"
## [1] "End time: 2025-08-03 16:46:02.689129"
## [1] "Pass took 6.1581"
## [1] "Start pass 196:"
## [1] "Start time: 2025-08-03 16:46:02.695909"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:02.791604"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:08.272812"
## [1] "run_time: 5.48120784759521"
## [1] "End time: 2025-08-03 16:46:08.7579"
## [1] "Pass took 6.062"
## [1] "Start pass 197:"
## [1] "Start time: 2025-08-03 16:46:08.758246"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:08.859119"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:14.334697"
## [1] "run_time: 5.47557806968689"
## [1] "End time: 2025-08-03 16:46:14.822982"
## [1] "Pass took 6.0647"
## [1] "Start pass 198:"
## [1] "Start time: 2025-08-03 16:46:14.823385"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:14.926184"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:20.485254"
## [1] "run_time: 5.55907011032104"
## [1] "End time: 2025-08-03 16:46:20.97851"
## [1] "Pass took 6.1551"
## [1] "Start pass 199:"
## [1] "Start time: 2025-08-03 16:46:20.978907"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:21.076261"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:26.542405"
## [1] "run_time: 5.46614384651184"
## [1] "End time: 2025-08-03 16:46:27.010096"
## [1] "Pass took 6.0312"
## [1] "Start pass 200:"
## [1] "Start time: 2025-08-03 16:46:27.01043"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:27.113929"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:32.483183"
## [1] "run_time: 5.36925387382507"
## [1] "End time: 2025-08-03 16:46:32.968658"
## [1] "Pass took 5.9582"
## [1] "Start pass 201:"
## [1] "Start time: 2025-08-03 16:46:32.975467"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:33.084162"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:40.689314"
## [1] "run_time: 7.60515189170837"
## [1] "End time: 2025-08-03 16:46:42.078734"
## [1] "Pass took 9.1033"
## [1] "Start pass 202:"
## [1] "Start time: 2025-08-03 16:46:42.079125"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:42.18219"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:49.626827"
## [1] "run_time: 7.44463706016541"
## [1] "End time: 2025-08-03 16:46:51.019838"
## [1] "Pass took 8.9407"
## [1] "Start pass 203:"
## [1] "Start time: 2025-08-03 16:46:51.020194"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:46:51.121436"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:46:58.734741"
## [1] "run_time: 7.61330485343933"
## [1] "End time: 2025-08-03 16:47:00.103687"
## [1] "Pass took 9.0835"
## [1] "Start pass 204:"
## [1] "Start time: 2025-08-03 16:47:00.104196"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:00.208474"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:07.740677"
## [1] "run_time: 7.53220319747925"
## [1] "End time: 2025-08-03 16:47:09.132866"
## [1] "Pass took 9.0287"
## [1] "Start pass 205:"
## [1] "Start time: 2025-08-03 16:47:09.13322"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 206:"
## [1] "Start time: 2025-08-03 16:47:09.236296"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:09.339583"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:16.919729"
## [1] "run_time: 7.58014607429504"
## [1] "End time: 2025-08-03 16:47:18.308705"
## [1] "Pass took 9.0724"
## [1] "Start pass 207:"
## [1] "Start time: 2025-08-03 16:47:18.309102"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 208:"
## [1] "Start time: 2025-08-03 16:47:18.412758"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:18.515478"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:25.956609"
## [1] "run_time: 7.44113111495972"
## [1] "End time: 2025-08-03 16:47:27.343033"
## [1] "Pass took 8.9303"
## [1] "Start pass 209:"
## [1] "Start time: 2025-08-03 16:47:27.343434"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:27.452225"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:34.990104"
## [1] "run_time: 7.53787899017334"
## [1] "End time: 2025-08-03 16:47:36.398897"
## [1] "Pass took 9.0555"
## [1] "Start pass 210:"
## [1] "Start time: 2025-08-03 16:47:36.399303"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:36.506296"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:43.926358"
## [1] "run_time: 7.42006206512451"
## [1] "End time: 2025-08-03 16:47:45.317744"
## [1] "Pass took 8.9184"
## [1] "Start pass 211:"
## [1] "Start time: 2025-08-03 16:47:45.32645"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:45.330406"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:45.556929"
## [1] "run_time: 0.226523160934448"
## [1] "End time: 2025-08-03 16:47:45.585938"
## [1] "Pass took 0.2595"
## [1] "Start pass 212:"
## [1] "Start time: 2025-08-03 16:47:45.586286"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:45.590865"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:45.808816"
## [1] "run_time: 0.217951059341431"
## [1] "End time: 2025-08-03 16:47:45.838238"
## [1] "Pass took 0.252"
## [1] "Start pass 213:"
## [1] "Start time: 2025-08-03 16:47:45.838542"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:45.842923"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:46.071486"
## [1] "run_time: 0.228563070297241"
## [1] "End time: 2025-08-03 16:47:46.099651"
## [1] "Pass took 0.2611"
## [1] "Start pass 214:"
## [1] "Start time: 2025-08-03 16:47:46.099982"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:46.104448"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:46.322276"
## [1] "run_time: 0.217828035354614"
## [1] "End time: 2025-08-03 16:47:46.348747"
## [1] "Pass took 0.2488"
## [1] "Start pass 215:"
## [1] "Start time: 2025-08-03 16:47:46.349052"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 216:"
## [1] "Start time: 2025-08-03 16:47:46.355742"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:46.359901"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:46.579974"
## [1] "run_time: 0.220072984695435"
## [1] "End time: 2025-08-03 16:47:46.609221"
## [1] "Pass took 0.2535"
## [1] "Start pass 217:"
## [1] "Start time: 2025-08-03 16:47:46.609516"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 218:"
## [1] "Start time: 2025-08-03 16:47:46.614646"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:46.618173"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:46.841657"
## [1] "run_time: 0.223484039306641"
## [1] "End time: 2025-08-03 16:47:46.869991"
## [1] "Pass took 0.2553"
## [1] "Start pass 219:"
## [1] "Start time: 2025-08-03 16:47:46.870275"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 220:"
## [1] "Start time: 2025-08-03 16:47:46.880267"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 221:"
## [1] "Start time: 2025-08-03 16:47:46.885149"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:46.981996"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:52.832565"
## [1] "run_time: 5.85056900978088"
## [1] "End time: 2025-08-03 16:47:53.555537"
## [1] "Pass took 6.6704"
## [1] "Start pass 222:"
## [1] "Start time: 2025-08-03 16:47:53.555949"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:47:53.659831"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:47:59.608664"
## [1] "run_time: 5.94883298873901"
## [1] "End time: 2025-08-03 16:48:00.499351"
## [1] "Pass took 6.9434"
## [1] "Start pass 223:"
## [1] "Start time: 2025-08-03 16:48:00.49972"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:00.606638"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:06.576603"
## [1] "run_time: 5.9699649810791"
## [1] "End time: 2025-08-03 16:48:07.313953"
## [1] "Pass took 6.8142"
## [1] "Start pass 224:"
## [1] "Start time: 2025-08-03 16:48:07.314295"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:07.411017"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:13.616468"
## [1] "run_time: 6.20545101165771"
## [1] "End time: 2025-08-03 16:48:14.521241"
## [1] "Pass took 7.2069"
## [1] "Start pass 225:"
## [1] "Start time: 2025-08-03 16:48:14.521618"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:14.624909"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:20.587263"
## [1] "run_time: 5.96235418319702"
## [1] "End time: 2025-08-03 16:48:21.335329"
## [1] "Pass took 6.8137"
## [1] "Start pass 226:"
## [1] "Start time: 2025-08-03 16:48:21.342759"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:21.435464"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:27.33975"
## [1] "run_time: 5.90428614616394"
## [1] "End time: 2025-08-03 16:48:28.069165"
## [1] "Pass took 6.7264"
## [1] "Start pass 227:"
## [1] "Start time: 2025-08-03 16:48:28.069587"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:28.192374"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:34.25104"
## [1] "run_time: 6.05866599082947"
## [1] "End time: 2025-08-03 16:48:35.152175"
## [1] "Pass took 7.0826"
## [1] "Start pass 228:"
## [1] "Start time: 2025-08-03 16:48:35.152558"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:35.251107"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:41.281451"
## [1] "run_time: 6.03034400939941"
## [1] "End time: 2025-08-03 16:48:42.003534"
## [1] "Pass took 6.851"
## [1] "Start pass 229:"
## [1] "Start time: 2025-08-03 16:48:42.003938"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:42.104412"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:47.932483"
## [1] "run_time: 5.82807087898254"
## [1] "End time: 2025-08-03 16:48:48.666719"
## [1] "Pass took 6.6628"
## [1] "Start pass 230:"
## [1] "Start time: 2025-08-03 16:48:48.667087"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:48.777152"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:54.902536"
## [1] "run_time: 6.12538385391235"
## [1] "End time: 2025-08-03 16:48:55.625644"
## [1] "Pass took 6.9586"
## [1] "Start pass 231:"
## [1] "Start time: 2025-08-03 16:48:55.633538"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:55.685804"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:48:59.124604"
## [1] "run_time: 3.43880009651184"
## [1] "End time: 2025-08-03 16:48:59.599023"
## [1] "Pass took 3.9655"
## [1] "Start pass 232:"
## [1] "Start time: 2025-08-03 16:48:59.599424"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:48:59.652037"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:03.008279"
## [1] "run_time: 3.35624217987061"
## [1] "End time: 2025-08-03 16:49:03.486568"
## [1] "Pass took 3.8871"
## [1] "Start pass 233:"
## [1] "Start time: 2025-08-03 16:49:03.486964"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:03.54127"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:06.750123"
## [1] "run_time: 3.20885300636292"
## [1] "End time: 2025-08-03 16:49:07.243706"
## [1] "Pass took 3.7567"
## [1] "Start pass 234:"
## [1] "Start time: 2025-08-03 16:49:07.244041"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:07.29441"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:10.558725"
## [1] "run_time: 3.26431512832642"
## [1] "End time: 2025-08-03 16:49:11.042255"
## [1] "Pass took 3.7982"
## [1] "Start pass 235:"
## [1] "Start time: 2025-08-03 16:49:11.042589"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:11.095347"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:14.413585"
## [1] "run_time: 3.31823801994324"
## [1] "End time: 2025-08-03 16:49:14.894512"
## [1] "Pass took 3.8519"
## [1] "Start pass 236:"
## [1] "Start time: 2025-08-03 16:49:14.902374"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:14.953629"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:18.176839"
## [1] "run_time: 3.22321009635925"
## [1] "End time: 2025-08-03 16:49:18.655711"
## [1] "Pass took 3.7533"
## [1] "Start pass 237:"
## [1] "Start time: 2025-08-03 16:49:18.656091"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:18.705441"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:22.110651"
## [1] "run_time: 3.40521001815796"
## [1] "End time: 2025-08-03 16:49:22.575374"
## [1] "Pass took 3.9193"
## [1] "Start pass 238:"
## [1] "Start time: 2025-08-03 16:49:22.575803"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 239:"
## [1] "Start time: 2025-08-03 16:49:22.632059"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:22.685276"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:25.879461"
## [1] "run_time: 3.19418501853943"
## [1] "End time: 2025-08-03 16:49:26.352935"
## [1] "Pass took 3.7209"
## [1] "Start pass 240:"
## [1] "Start time: 2025-08-03 16:49:26.353402"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:26.404258"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:29.778694"
## [1] "run_time: 3.37443590164185"
## [1] "End time: 2025-08-03 16:49:30.252814"
## [1] "Pass took 3.8994"
## [1] "Start pass 241:"
## [1] "Start time: 2025-08-03 16:49:30.260913"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 242:"
## [1] "Start time: 2025-08-03 16:49:30.312469"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 243:"
## [1] "Start time: 2025-08-03 16:49:30.377356"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 244:"
## [1] "Start time: 2025-08-03 16:49:30.437324"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 245:"
## [1] "Start time: 2025-08-03 16:49:30.488105"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 246:"
## [1] "Start time: 2025-08-03 16:49:30.54038"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 247:"
## [1] "Start time: 2025-08-03 16:49:30.5931"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 248:"
## [1] "Start time: 2025-08-03 16:49:30.651009"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 249:"
## [1] "Start time: 2025-08-03 16:49:30.704007"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 250:"
## [1] "Start time: 2025-08-03 16:49:30.759695"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 251:"
## [1] "Start time: 2025-08-03 16:49:30.811615"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 252:"
## [1] "Start time: 2025-08-03 16:49:30.826855"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 253:"
## [1] "Start time: 2025-08-03 16:49:30.84555"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 254:"
## [1] "Start time: 2025-08-03 16:49:30.860578"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 255:"
## [1] "Start time: 2025-08-03 16:49:30.875348"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 256:"
## [1] "Start time: 2025-08-03 16:49:30.890168"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 257:"
## [1] "Start time: 2025-08-03 16:49:30.904995"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 258:"
## [1] "Start time: 2025-08-03 16:49:30.920059"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 259:"
## [1] "Start time: 2025-08-03 16:49:30.934349"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 260:"
## [1] "Start time: 2025-08-03 16:49:30.94791"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 261:"
## [1] "Start time: 2025-08-03 16:49:30.96123"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:31.082938"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:38.024267"
## [1] "run_time: 6.94132900238037"
## [1] "End time: 2025-08-03 16:49:38.23709"
## [1] "Pass took 7.2759"
## [1] "Start pass 262:"
## [1] "Start time: 2025-08-03 16:49:38.237485"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:38.362756"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:45.231082"
## [1] "run_time: 6.86832594871521"
## [1] "End time: 2025-08-03 16:49:45.447218"
## [1] "Pass took 7.2097"
## [1] "Start pass 263:"
## [1] "Start time: 2025-08-03 16:49:45.44762"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:45.576862"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:52.512142"
## [1] "run_time: 6.93527984619141"
## [1] "End time: 2025-08-03 16:49:52.72146"
## [1] "Pass took 7.2738"
## [1] "Start pass 264:"
## [1] "Start time: 2025-08-03 16:49:52.721839"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:49:52.845494"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:49:59.74436"
## [1] "run_time: 6.89886593818665"
## [1] "End time: 2025-08-03 16:49:59.962637"
## [1] "Pass took 7.2408"
## [1] "Start pass 265:"
## [1] "Start time: 2025-08-03 16:49:59.963031"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:00.082843"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:07.06199"
## [1] "run_time: 6.97914695739746"
## [1] "End time: 2025-08-03 16:50:07.276907"
## [1] "Pass took 7.3139"
## [1] "Start pass 266:"
## [1] "Start time: 2025-08-03 16:50:07.286506"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:07.404501"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:14.233114"
## [1] "run_time: 6.82861304283142"
## [1] "End time: 2025-08-03 16:50:14.452812"
## [1] "Pass took 7.1663"
## [1] "Start pass 267:"
## [1] "Start time: 2025-08-03 16:50:14.45317"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:14.574412"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:21.547086"
## [1] "run_time: 6.97267389297485"
## [1] "End time: 2025-08-03 16:50:21.765938"
## [1] "Pass took 7.3128"
## [1] "Start pass 268:"
## [1] "Start time: 2025-08-03 16:50:21.766339"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:21.895226"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:28.850748"
## [1] "run_time: 6.95552206039429"
## [1] "End time: 2025-08-03 16:50:29.063516"
## [1] "Pass took 7.2972"
## [1] "Start pass 269:"
## [1] "Start time: 2025-08-03 16:50:29.063871"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:29.193377"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:36.188584"
## [1] "run_time: 6.99520707130432"
## [1] "End time: 2025-08-03 16:50:36.399829"
## [1] "Pass took 7.336"
## [1] "Start pass 270:"
## [1] "Start time: 2025-08-03 16:50:36.400209"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:36.521991"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:43.469428"
## [1] "run_time: 6.94743704795837"
## [1] "End time: 2025-08-03 16:50:43.688599"
## [1] "Pass took 7.2884"
## [1] "Start pass 271:"
## [1] "Start time: 2025-08-03 16:50:43.697169"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:43.802563"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:50:53.587819"
## [1] "run_time: 9.78525614738464"
## [1] "End time: 2025-08-03 16:50:55.951607"
## [1] "Pass took 12.2544"
## [1] "Start pass 272:"
## [1] "Start time: 2025-08-03 16:50:55.951987"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 273:"
## [1] "Start time: 2025-08-03 16:50:56.065444"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:50:56.169207"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:51:06.06901"
## [1] "run_time: 9.89980292320251"
## [1] "End time: 2025-08-03 16:51:08.211792"
## [1] "Pass took 12.1463"
## [1] "Start pass 274:"
## [1] "Start time: 2025-08-03 16:51:08.212181"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:51:08.316875"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:51:18.218806"
## [1] "run_time: 9.90193104743958"
## [1] "End time: 2025-08-03 16:51:20.340423"
## [1] "Pass took 12.1282"
## [1] "Start pass 275:"
## [1] "Start time: 2025-08-03 16:51:20.340828"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 276:"
## [1] "Start time: 2025-08-03 16:51:20.44794"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 277:"
## [1] "Start time: 2025-08-03 16:51:20.548827"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:51:20.649627"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:51:30.479732"
## [1] "run_time: 9.83010506629944"
## [1] "End time: 2025-08-03 16:51:32.603041"
## [1] "Pass took 12.0542"
## [1] "Start pass 278:"
## [1] "Start time: 2025-08-03 16:51:32.603439"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:51:32.714609"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:51:42.632341"
## [1] "run_time: 9.91773200035095"
## [1] "End time: 2025-08-03 16:51:44.768641"
## [1] "Pass took 12.1652"
## [1] "Start pass 279:"
## [1] "Start time: 2025-08-03 16:51:44.76899"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:51:44.872544"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:51:54.734977"
## [1] "run_time: 9.86243295669556"
## [1] "End time: 2025-08-03 16:51:56.885965"
## [1] "Pass took 12.117"
## [1] "Start pass 280:"
## [1] "Start time: 2025-08-03 16:51:56.88638"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:51:56.990461"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:06.811652"
## [1] "run_time: 9.82119083404541"
## [1] "End time: 2025-08-03 16:52:08.928274"
## [1] "Pass took 12.0419"
## [1] "Start pass 281:"
## [1] "Start time: 2025-08-03 16:52:08.939071"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:09.059533"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:15.538424"
## [1] "run_time: 6.47889089584351"
## [1] "End time: 2025-08-03 16:52:15.677577"
## [1] "Pass took 6.7385"
## [1] "Start pass 282:"
## [1] "Start time: 2025-08-03 16:52:15.677938"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:15.798486"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:22.069398"
## [1] "run_time: 6.27091193199158"
## [1] "End time: 2025-08-03 16:52:22.205691"
## [1] "Pass took 6.5278"
## [1] "Start pass 283:"
## [1] "Start time: 2025-08-03 16:52:22.206077"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:22.331911"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:28.761388"
## [1] "run_time: 6.42947697639465"
## [1] "End time: 2025-08-03 16:52:28.899273"
## [1] "Pass took 6.6932"
## [1] "Start pass 284:"
## [1] "Start time: 2025-08-03 16:52:28.899635"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:29.020947"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:35.43937"
## [1] "run_time: 6.41842293739319"
## [1] "End time: 2025-08-03 16:52:35.573225"
## [1] "Pass took 6.6736"
## [1] "Start pass 285:"
## [1] "Start time: 2025-08-03 16:52:35.573602"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:35.874409"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:42.20446"
## [1] "run_time: 6.33005094528198"
## [1] "End time: 2025-08-03 16:52:42.349137"
## [1] "Pass took 6.7755"
## [1] "Start pass 286:"
## [1] "Start time: 2025-08-03 16:52:42.359163"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:42.476341"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:48.781323"
## [1] "run_time: 6.30498194694519"
## [1] "End time: 2025-08-03 16:52:48.91858"
## [1] "Pass took 6.5594"
## [1] "Start pass 287:"
## [1] "Start time: 2025-08-03 16:52:48.918942"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:49.039142"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:52:55.460735"
## [1] "run_time: 6.4215931892395"
## [1] "End time: 2025-08-03 16:52:55.604016"
## [1] "Pass took 6.6851"
## [1] "Start pass 288:"
## [1] "Start time: 2025-08-03 16:52:55.604398"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:52:55.728144"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:07.533128"
## [1] "run_time: 11.8049840927124"
## [1] "End time: 2025-08-03 16:53:07.818582"
## [1] "Pass took 12.2142"
## [1] "Start pass 289:"
## [1] "Start time: 2025-08-03 16:53:07.819255"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:08.149856"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:20.291594"
## [1] "run_time: 12.1417379379272"
## [1] "End time: 2025-08-03 16:53:20.428215"
## [1] "Pass took 12.609"
## [1] "Start pass 290:"
## [1] "Start time: 2025-08-03 16:53:20.428591"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:20.558062"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:27.075126"
## [1] "run_time: 6.51706385612488"
## [1] "End time: 2025-08-03 16:53:27.214808"
## [1] "Pass took 6.7862"
## [1] "Start pass 291:"
## [1] "Start time: 2025-08-03 16:53:27.226617"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:27.258208"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:29.130977"
## [1] "run_time: 1.87276887893677"
## [1] "End time: 2025-08-03 16:53:29.176724"
## [1] "Pass took 1.9501"
## [1] "Start pass 292:"
## [1] "Start time: 2025-08-03 16:53:29.177139"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:29.201887"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:30.947762"
## [1] "run_time: 1.74587512016296"
## [1] "End time: 2025-08-03 16:53:31.001388"
## [1] "Pass took 1.8242"
## [1] "Start pass 293:"
## [1] "Start time: 2025-08-03 16:53:31.001895"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:31.030693"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:32.861748"
## [1] "run_time: 1.83105492591858"
## [1] "End time: 2025-08-03 16:53:32.91428"
## [1] "Pass took 1.9124"
## [1] "Start pass 294:"
## [1] "Start time: 2025-08-03 16:53:32.915001"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:32.943624"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:34.672559"
## [1] "run_time: 1.72893500328064"
## [1] "End time: 2025-08-03 16:53:34.717335"
## [1] "Pass took 1.8023"
## [1] "Start pass 295:"
## [1] "Start time: 2025-08-03 16:53:34.717762"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:34.741388"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:36.444119"
## [1] "run_time: 1.70273089408875"
## [1] "End time: 2025-08-03 16:53:36.507806"
## [1] "Pass took 1.79"
## [1] "Start pass 296:"
## [1] "Start time: 2025-08-03 16:53:36.517324"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:36.544247"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:38.34212"
## [1] "run_time: 1.79787302017212"
## [1] "End time: 2025-08-03 16:53:38.390211"
## [1] "Pass took 1.8729"
## [1] "Start pass 297:"
## [1] "Start time: 2025-08-03 16:53:38.39396"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:38.418812"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:40.184321"
## [1] "run_time: 1.76550889015198"
## [1] "End time: 2025-08-03 16:53:40.228834"
## [1] "Pass took 1.8349"
## [1] "Start pass 298:"
## [1] "Start time: 2025-08-03 16:53:40.229191"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:40.253967"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:42.001611"
## [1] "run_time: 1.74764394760132"
## [1] "End time: 2025-08-03 16:53:42.050199"
## [1] "Pass took 1.821"
## [1] "Start pass 299:"
## [1] "Start time: 2025-08-03 16:53:42.050694"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:42.074804"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:43.82362"
## [1] "run_time: 1.74881601333618"
## [1] "End time: 2025-08-03 16:53:43.890469"
## [1] "Pass took 1.8398"
## [1] "Start pass 300:"
## [1] "Start time: 2025-08-03 16:53:43.890974"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:43.916867"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:45.664743"
## [1] "run_time: 1.74787592887878"
## [1] "End time: 2025-08-03 16:53:45.711525"
## [1] "Pass took 1.8206"
## [1] "Start pass 301:"
## [1] "Start time: 2025-08-03 16:53:45.720514"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 302:"
## [1] "Start time: 2025-08-03 16:53:45.77435"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:45.853412"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:50.841226"
## [1] "run_time: 4.98781418800354"
## [1] "End time: 2025-08-03 16:53:52.086017"
## [1] "Pass took 6.3117"
## [1] "Start pass 303:"
## [1] "Start time: 2025-08-03 16:53:52.086421"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 304:"
## [1] "Start time: 2025-08-03 16:53:52.164322"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 305:"
## [1] "Start time: 2025-08-03 16:53:52.220414"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 306:"
## [1] "Start time: 2025-08-03 16:53:52.274241"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 307:"
## [1] "Start time: 2025-08-03 16:53:52.329438"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 308:"
## [1] "Start time: 2025-08-03 16:53:52.385298"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 309:"
## [1] "Start time: 2025-08-03 16:53:52.437056"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 310:"
## [1] "Start time: 2025-08-03 16:53:52.489665"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 311:"
## [1] "Start time: 2025-08-03 16:53:52.54143"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:52.591858"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:53:56.681567"
## [1] "run_time: 4.08970904350281"
## [1] "End time: 2025-08-03 16:53:57.004243"
## [1] "Pass took 4.4628"
## [1] "Start pass 312:"
## [1] "Start time: 2025-08-03 16:53:57.00488"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:53:57.051932"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:01.428052"
## [1] "run_time: 4.37611985206604"
## [1] "End time: 2025-08-03 16:54:01.786323"
## [1] "Pass took 4.7814"
## [1] "Start pass 313:"
## [1] "Start time: 2025-08-03 16:54:01.786748"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:01.839036"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:05.760581"
## [1] "run_time: 3.92154502868652"
## [1] "End time: 2025-08-03 16:54:06.096932"
## [1] "Pass took 4.3102"
## [1] "Start pass 314:"
## [1] "Start time: 2025-08-03 16:54:06.097301"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:06.145647"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:10.090785"
## [1] "run_time: 3.9451379776001"
## [1] "End time: 2025-08-03 16:54:10.429485"
## [1] "Pass took 4.3322"
## [1] "Start pass 315:"
## [1] "Start time: 2025-08-03 16:54:10.429849"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:10.477555"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:14.442171"
## [1] "run_time: 3.96461606025696"
## [1] "End time: 2025-08-03 16:54:14.752639"
## [1] "Pass took 4.3228"
## [1] "Start pass 316:"
## [1] "Start time: 2025-08-03 16:54:14.761519"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:14.815403"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:18.806614"
## [1] "run_time: 3.9912109375"
## [1] "End time: 2025-08-03 16:54:19.163128"
## [1] "Pass took 4.4016"
## [1] "Start pass 317:"
## [1] "Start time: 2025-08-03 16:54:19.163481"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:19.215188"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:23.154474"
## [1] "run_time: 3.93928599357605"
## [1] "End time: 2025-08-03 16:54:23.475546"
## [1] "Pass took 4.3121"
## [1] "Start pass 318:"
## [1] "Start time: 2025-08-03 16:54:23.475967"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:23.523123"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:27.487458"
## [1] "run_time: 3.9643349647522"
## [1] "End time: 2025-08-03 16:54:27.820115"
## [1] "Pass took 4.3441"
## [1] "Start pass 319:"
## [1] "Start time: 2025-08-03 16:54:27.820486"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:27.867864"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:31.769677"
## [1] "run_time: 3.90181303024292"
## [1] "End time: 2025-08-03 16:54:32.110244"
## [1] "Pass took 4.2898"
## [1] "Start pass 320:"
## [1] "Start time: 2025-08-03 16:54:32.110597"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:32.160485"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:54:36.11852"
## [1] "run_time: 3.95803499221802"
## [1] "End time: 2025-08-03 16:54:36.457867"
## [1] "Pass took 4.3473"
## [1] "Start pass 321:"
## [1] "Start time: 2025-08-03 16:54:36.467505"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:54:36.946004"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:55:01.55152"
## [1] "run_time: 24.6055161952972"
## [1] "End time: 2025-08-03 16:55:02.044071"
## [1] "Pass took 25.5766"
## [1] "Start pass 322:"
## [1] "Start time: 2025-08-03 16:55:02.044432"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:55:02.5366"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:55:26.69183"
## [1] "run_time: 24.1552298069"
## [1] "End time: 2025-08-03 16:55:27.215471"
## [1] "Pass took 25.171"
## [1] "Start pass 323:"
## [1] "Start time: 2025-08-03 16:55:27.215927"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:55:27.719144"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:55:51.685786"
## [1] "run_time: 23.9666419029236"
## [1] "End time: 2025-08-03 16:55:52.20189"
## [1] "Pass took 24.986"
## [1] "Start pass 324:"
## [1] "Start time: 2025-08-03 16:55:52.202311"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:55:52.694393"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:56:17.31064"
## [1] "run_time: 24.616247177124"
## [1] "End time: 2025-08-03 16:56:17.836443"
## [1] "Pass took 25.6341"
## [1] "Start pass 325:"
## [1] "Start time: 2025-08-03 16:56:17.836859"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:56:18.343764"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:56:43.237014"
## [1] "run_time: 24.8932499885559"
## [1] "End time: 2025-08-03 16:56:43.773773"
## [1] "Pass took 25.9369"
## [1] "Start pass 326:"
## [1] "Start time: 2025-08-03 16:56:43.786165"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:56:44.265573"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:57:08.799897"
## [1] "run_time: 24.5343239307404"
## [1] "End time: 2025-08-03 16:57:09.620663"
## [1] "Pass took 25.8345"
## [1] "Start pass 327:"
## [1] "Start time: 2025-08-03 16:57:09.621064"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:57:10.120255"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:57:37.746948"
## [1] "run_time: 27.6266930103302"
## [1] "End time: 2025-08-03 16:57:38.327536"
## [1] "Pass took 28.7065"
## [1] "Start pass 328:"
## [1] "Start time: 2025-08-03 16:57:38.32798"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:57:38.847394"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:58:03.323177"
## [1] "run_time: 24.4757831096649"
## [1] "End time: 2025-08-03 16:58:03.860071"
## [1] "Pass took 25.5321"
## [1] "Start pass 329:"
## [1] "Start time: 2025-08-03 16:58:03.860462"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:58:04.355977"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:58:28.59176"
## [1] "run_time: 24.2357828617096"
## [1] "End time: 2025-08-03 16:58:29.094065"
## [1] "Pass took 25.2336"
## [1] "Start pass 330:"
## [1] "Start time: 2025-08-03 16:58:29.094496"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:58:29.590903"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:58:54.125357"
## [1] "run_time: 24.534453868866"
## [1] "End time: 2025-08-03 16:58:54.6305"
## [1] "Pass took 25.536"
## [1] "Start pass 331:"
## [1] "Start time: 2025-08-03 16:58:54.642026"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:58:54.672512"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:58:58.212426"
## [1] "run_time: 3.53991389274597"
## [1] "End time: 2025-08-03 16:58:58.351024"
## [1] "Pass took 3.709"
## [1] "Start pass 332:"
## [1] "Start time: 2025-08-03 16:58:58.351393"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:58:58.379935"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:01.923177"
## [1] "run_time: 3.54324197769165"
## [1] "End time: 2025-08-03 16:59:02.039697"
## [1] "Pass took 3.6883"
## [1] "Start pass 333:"
## [1] "Start time: 2025-08-03 16:59:02.040129"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:02.068472"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:05.520132"
## [1] "run_time: 3.45166015625"
## [1] "End time: 2025-08-03 16:59:05.636235"
## [1] "Pass took 3.5961"
## [1] "Start pass 334:"
## [1] "Start time: 2025-08-03 16:59:05.636613"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:05.661231"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:09.194496"
## [1] "run_time: 3.53326487541199"
## [1] "End time: 2025-08-03 16:59:09.33806"
## [1] "Pass took 3.7014"
## [1] "Start pass 335:"
## [1] "Start time: 2025-08-03 16:59:09.33842"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:09.366059"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:12.852606"
## [1] "run_time: 3.48654699325562"
## [1] "End time: 2025-08-03 16:59:12.981531"
## [1] "Pass took 3.6431"
## [1] "Start pass 336:"
## [1] "Start time: 2025-08-03 16:59:12.992039"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:13.017812"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:16.566291"
## [1] "run_time: 3.5484790802002"
## [1] "End time: 2025-08-03 16:59:16.68474"
## [1] "Pass took 3.6927"
## [1] "Start pass 337:"
## [1] "Start time: 2025-08-03 16:59:16.685109"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:16.710084"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:20.120855"
## [1] "run_time: 3.4107711315155"
## [1] "End time: 2025-08-03 16:59:20.254181"
## [1] "Pass took 3.5691"
## [1] "Start pass 338:"
## [1] "Start time: 2025-08-03 16:59:20.254572"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:20.282776"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:23.673717"
## [1] "run_time: 3.39094090461731"
## [1] "End time: 2025-08-03 16:59:23.789726"
## [1] "Pass took 3.5352"
## [1] "Start pass 339:"
## [1] "Start time: 2025-08-03 16:59:23.790146"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:23.818507"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:27.36605"
## [1] "run_time: 3.54754304885864"
## [1] "End time: 2025-08-03 16:59:27.480854"
## [1] "Pass took 3.6907"
## [1] "Start pass 340:"
## [1] "Start time: 2025-08-03 16:59:27.481204"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:27.506727"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:30.986823"
## [1] "run_time: 3.48009610176086"
## [1] "End time: 2025-08-03 16:59:31.10767"
## [1] "Pass took 3.6265"
## [1] "Start pass 341:"
## [1] "Start time: 2025-08-03 16:59:31.118013"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:31.129454"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:32.721471"
## [1] "run_time: 1.59201717376709"
## [1] "End time: 2025-08-03 16:59:32.807931"
## [1] "Pass took 1.6899"
## [1] "Start pass 342:"
## [1] "Start time: 2025-08-03 16:59:32.80828"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:32.820777"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:34.366886"
## [1] "run_time: 1.54610896110535"
## [1] "End time: 2025-08-03 16:59:34.453042"
## [1] "Pass took 1.6448"
## [1] "Start pass 343:"
## [1] "Start time: 2025-08-03 16:59:34.453386"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:34.465333"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:36.03427"
## [1] "run_time: 1.56893706321716"
## [1] "End time: 2025-08-03 16:59:36.135337"
## [1] "Pass took 1.682"
## [1] "Start pass 344:"
## [1] "Start time: 2025-08-03 16:59:36.135724"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:36.148347"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:37.630654"
## [1] "run_time: 1.48230719566345"
## [1] "End time: 2025-08-03 16:59:37.71628"
## [1] "Pass took 1.5806"
## [1] "Start pass 345:"
## [1] "Start time: 2025-08-03 16:59:37.716698"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:37.729275"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:39.219234"
## [1] "run_time: 1.48995900154114"
## [1] "End time: 2025-08-03 16:59:39.30779"
## [1] "Pass took 1.5911"
## [1] "Start pass 346:"
## [1] "Start time: 2025-08-03 16:59:39.318906"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:39.330591"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:40.869303"
## [1] "run_time: 1.53871202468872"
## [1] "End time: 2025-08-03 16:59:40.983961"
## [1] "Pass took 1.6651"
## [1] "Start pass 347:"
## [1] "Start time: 2025-08-03 16:59:40.984306"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:40.996362"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:42.539483"
## [1] "run_time: 1.54312109947205"
## [1] "End time: 2025-08-03 16:59:42.654818"
## [1] "Pass took 1.6705"
## [1] "Start pass 348:"
## [1] "Start time: 2025-08-03 16:59:42.655402"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:42.666836"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:44.183993"
## [1] "run_time: 1.51715707778931"
## [1] "End time: 2025-08-03 16:59:44.270212"
## [1] "Pass took 1.6148"
## [1] "Start pass 349:"
## [1] "Start time: 2025-08-03 16:59:44.270573"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:44.281674"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:46.214226"
## [1] "run_time: 1.93255209922791"
## [1] "End time: 2025-08-03 16:59:46.575862"
## [1] "Pass took 2.3053"
## [1] "Start pass 350:"
## [1] "Start time: 2025-08-03 16:59:46.576309"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:46.612524"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:51.096837"
## [1] "run_time: 4.48431301116943"
## [1] "End time: 2025-08-03 16:59:51.19278"
## [1] "Pass took 4.6165"
## [1] "Start pass 351:"
## [1] "Start time: 2025-08-03 16:59:51.204668"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:51.229163"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:54.0465"
## [1] "run_time: 2.81733703613281"
## [1] "End time: 2025-08-03 16:59:54.214073"
## [1] "Pass took 3.0094"
## [1] "Start pass 352:"
## [1] "Start time: 2025-08-03 16:59:54.214483"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:54.227221"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 16:59:57.145226"
## [1] "run_time: 2.91800498962402"
## [1] "End time: 2025-08-03 16:59:57.322812"
## [1] "Pass took 3.1083"
## [1] "Start pass 353:"
## [1] "Start time: 2025-08-03 16:59:57.323274"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 16:59:57.335997"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:03.49849"
## [1] "run_time: 6.16249299049377"
## [1] "End time: 2025-08-03 17:00:04.053746"
## [1] "Pass took 6.7305"
## [1] "Start pass 354:"
## [1] "Start time: 2025-08-03 17:00:04.054169"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:04.126947"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:11.839033"
## [1] "run_time: 7.71208596229553"
## [1] "End time: 2025-08-03 17:00:12.004126"
## [1] "Pass took 7.95"
## [1] "Start pass 355:"
## [1] "Start time: 2025-08-03 17:00:12.004486"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:12.017684"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:14.784017"
## [1] "run_time: 2.76633310317993"
## [1] "End time: 2025-08-03 17:00:14.944843"
## [1] "Pass took 2.9404"
## [1] "Start pass 356:"
## [1] "Start time: 2025-08-03 17:00:14.956072"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:14.967928"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:17.642809"
## [1] "run_time: 2.67488098144531"
## [1] "End time: 2025-08-03 17:00:17.819984"
## [1] "Pass took 2.8639"
## [1] "Start pass 357:"
## [1] "Start time: 2025-08-03 17:00:17.820391"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:17.833439"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:20.479391"
## [1] "run_time: 2.64595198631287"
## [1] "End time: 2025-08-03 17:00:20.634612"
## [1] "Pass took 2.8142"
## [1] "Start pass 358:"
## [1] "Start time: 2025-08-03 17:00:20.634972"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:20.647313"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:23.384047"
## [1] "run_time: 2.73673391342163"
## [1] "End time: 2025-08-03 17:00:23.550601"
## [1] "Pass took 2.9156"
## [1] "Start pass 359:"
## [1] "Start time: 2025-08-03 17:00:23.55097"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:23.564059"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:26.197203"
## [1] "run_time: 2.63314390182495"
## [1] "End time: 2025-08-03 17:00:26.348098"
## [1] "Pass took 2.7971"
## [1] "Start pass 360:"
## [1] "Start time: 2025-08-03 17:00:26.348509"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:26.360504"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:29.368064"
## [1] "run_time: 3.00756001472473"
## [1] "End time: 2025-08-03 17:00:29.541962"
## [1] "Pass took 3.1935"
## [1] "Start pass 361:"
## [1] "Start time: 2025-08-03 17:00:29.554789"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 362:"
## [1] "Start time: 2025-08-03 17:00:29.585986"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 363:"
## [1] "Start time: 2025-08-03 17:00:29.620909"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 364:"
## [1] "Start time: 2025-08-03 17:00:29.64982"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:29.679809"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:33.262061"
## [1] "run_time: 3.58225202560425"
## [1] "End time: 2025-08-03 17:00:33.77455"
## [1] "Pass took 4.1247"
## [1] "Start pass 365:"
## [1] "Start time: 2025-08-03 17:00:33.775002"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:33.80415"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:37.064035"
## [1] "run_time: 3.25988483428955"
## [1] "End time: 2025-08-03 17:00:37.622505"
## [1] "Pass took 3.8475"
## [1] "Start pass 366:"
## [1] "Start time: 2025-08-03 17:00:37.634026"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:37.660493"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:40.882126"
## [1] "run_time: 3.22163319587708"
## [1] "End time: 2025-08-03 17:00:41.422937"
## [1] "Pass took 3.7889"
## [1] "Start pass 367:"
## [1] "Start time: 2025-08-03 17:00:41.423334"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:41.451707"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:44.643954"
## [1] "run_time: 3.19224715232849"
## [1] "End time: 2025-08-03 17:00:45.157934"
## [1] "Pass took 3.7346"
## [1] "Start pass 368:"
## [1] "Start time: 2025-08-03 17:00:45.158292"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 369:"
## [1] "Start time: 2025-08-03 17:00:45.186343"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:45.212254"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:48.811196"
## [1] "run_time: 3.59894204139709"
## [1] "End time: 2025-08-03 17:00:49.332708"
## [1] "Pass took 4.1464"
## [1] "Start pass 370:"
## [1] "Start time: 2025-08-03 17:00:49.333412"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:49.361258"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:00:52.485684"
## [1] "run_time: 3.12442588806152"
## [1] "End time: 2025-08-03 17:00:53.037763"
## [1] "Pass took 3.7044"
## [1] "Start pass 371:"
## [1] "Start time: 2025-08-03 17:00:53.049247"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:00:53.535215"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:01:27.96318"
## [1] "run_time: 34.4279651641846"
## [1] "End time: 2025-08-03 17:01:30.231958"
## [1] "Pass took 37.1827"
## [1] "Start pass 372:"
## [1] "Start time: 2025-08-03 17:01:30.232483"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:01:30.730413"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:02:05.100399"
## [1] "run_time: 34.3699860572815"
## [1] "End time: 2025-08-03 17:02:07.268064"
## [1] "Pass took 37.0356"
## [1] "Start pass 373:"
## [1] "Start time: 2025-08-03 17:02:07.268454"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:02:07.778132"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:02:41.982266"
## [1] "run_time: 34.2041339874268"
## [1] "End time: 2025-08-03 17:02:44.224134"
## [1] "Pass took 36.9557"
## [1] "Start pass 374:"
## [1] "Start time: 2025-08-03 17:02:44.224546"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:02:44.73186"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:03:19.584007"
## [1] "run_time: 34.852147102356"
## [1] "End time: 2025-08-03 17:03:21.784349"
## [1] "Pass took 37.5598"
## [1] "Start pass 375:"
## [1] "Start time: 2025-08-03 17:03:21.784749"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:03:22.282616"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:03:56.633416"
## [1] "run_time: 34.350800037384"
## [1] "End time: 2025-08-03 17:03:58.829438"
## [1] "Pass took 37.0447"
## [1] "Start pass 376:"
## [1] "Start time: 2025-08-03 17:03:58.844069"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:03:59.335881"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:04:33.748235"
## [1] "run_time: 34.4123539924622"
## [1] "End time: 2025-08-03 17:04:35.896901"
## [1] "Pass took 37.0528"
## [1] "Start pass 377:"
## [1] "Start time: 2025-08-03 17:04:35.897314"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:04:36.39392"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:05:10.768473"
## [1] "run_time: 34.3745529651642"
## [1] "End time: 2025-08-03 17:05:12.919454"
## [1] "Pass took 37.0221"
## [1] "Start pass 378:"
## [1] "Start time: 2025-08-03 17:05:12.91986"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:05:13.4159"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:05:47.924895"
## [1] "run_time: 34.5089950561523"
## [1] "End time: 2025-08-03 17:05:50.102218"
## [1] "Pass took 37.1824"
## [1] "Start pass 379:"
## [1] "Start time: 2025-08-03 17:05:50.102656"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:05:50.629935"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:06:24.871386"
## [1] "run_time: 34.2414510250092"
## [1] "End time: 2025-08-03 17:06:27.134707"
## [1] "Pass took 37.0321"
## [1] "Start pass 380:"
## [1] "Start time: 2025-08-03 17:06:27.135041"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:06:27.644403"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:07:01.81386"
## [1] "run_time: 34.1694569587708"
## [1] "End time: 2025-08-03 17:07:04.015022"
## [1] "Pass took 36.88"
## [1] "Start pass 381:"
## [1] "Start time: 2025-08-03 17:07:04.028685"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:07:04.229901"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:07:20.042968"
## [1] "run_time: 15.8130669593811"
## [1] "End time: 2025-08-03 17:07:22.408113"
## [1] "Pass took 18.3794"
## [1] "Start pass 382:"
## [1] "Start time: 2025-08-03 17:07:22.408525"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:07:22.610197"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:07:38.412682"
## [1] "run_time: 15.8024849891663"
## [1] "End time: 2025-08-03 17:07:40.550729"
## [1] "Pass took 18.1422"
## [1] "Start pass 383:"
## [1] "Start time: 2025-08-03 17:07:40.551151"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:07:40.754508"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:07:56.750063"
## [1] "run_time: 15.9955549240112"
## [1] "End time: 2025-08-03 17:07:59.048073"
## [1] "Pass took 18.4969"
## [1] "Start pass 384:"
## [1] "Start time: 2025-08-03 17:07:59.048462"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:07:59.24624"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:08:15.131805"
## [1] "run_time: 15.8855650424957"
## [1] "End time: 2025-08-03 17:08:17.269556"
## [1] "Pass took 18.2211"
## [1] "Start pass 385:"
## [1] "Start time: 2025-08-03 17:08:17.269974"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:08:17.469565"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:08:33.302483"
## [1] "run_time: 15.8329181671143"
## [1] "End time: 2025-08-03 17:08:35.601061"
## [1] "Pass took 18.3311"
## [1] "Start pass 386:"
## [1] "Start time: 2025-08-03 17:08:35.614581"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:08:35.817225"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:08:51.693022"
## [1] "run_time: 15.8757970333099"
## [1] "End time: 2025-08-03 17:08:53.787389"
## [1] "Pass took 18.1728"
## [1] "Start pass 387:"
## [1] "Start time: 2025-08-03 17:08:53.787805"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:08:53.988391"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:09:09.960781"
## [1] "run_time: 15.9723901748657"
## [1] "End time: 2025-08-03 17:09:12.280366"
## [1] "Pass took 18.4926"
## [1] "Start pass 388:"
## [1] "Start time: 2025-08-03 17:09:12.280778"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:09:12.489304"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:09:28.242675"
## [1] "run_time: 15.7533710002899"
## [1] "End time: 2025-08-03 17:09:30.368497"
## [1] "Pass took 18.0877"
## [1] "Start pass 389:"
## [1] "Start time: 2025-08-03 17:09:30.36894"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:09:30.576121"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:09:46.281974"
## [1] "run_time: 15.7058529853821"
## [1] "End time: 2025-08-03 17:09:48.590848"
## [1] "Pass took 18.2219"
## [1] "Start pass 390:"
## [1] "Start time: 2025-08-03 17:09:48.59121"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:09:48.802285"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:08.377055"
## [1] "run_time: 19.5747699737549"
## [1] "End time: 2025-08-03 17:10:10.507852"
## [1] "Pass took 21.9166"
## [1] "Start pass 391:"
## [1] "Start time: 2025-08-03 17:10:10.520068"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:10.545808"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:12.718403"
## [1] "run_time: 2.17259502410889"
## [1] "End time: 2025-08-03 17:10:12.78479"
## [1] "Pass took 2.2647"
## [1] "Start pass 392:"
## [1] "Start time: 2025-08-03 17:10:12.785192"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:12.811293"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:14.798502"
## [1] "run_time: 1.98720908164978"
## [1] "End time: 2025-08-03 17:10:14.866632"
## [1] "Pass took 2.0814"
## [1] "Start pass 393:"
## [1] "Start time: 2025-08-03 17:10:14.867029"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:14.891322"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:16.894812"
## [1] "run_time: 2.00349020957947"
## [1] "End time: 2025-08-03 17:10:16.959877"
## [1] "Pass took 2.0928"
## [1] "Start pass 394:"
## [1] "Start time: 2025-08-03 17:10:16.960221"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:16.992029"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:18.964792"
## [1] "run_time: 1.97276306152344"
## [1] "End time: 2025-08-03 17:10:19.034596"
## [1] "Pass took 2.0744"
## [1] "Start pass 395:"
## [1] "Start time: 2025-08-03 17:10:19.034924"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:19.081749"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:21.101597"
## [1] "run_time: 2.01984810829163"
## [1] "End time: 2025-08-03 17:10:21.168259"
## [1] "Pass took 2.1333"
## [1] "Start pass 396:"
## [1] "Start time: 2025-08-03 17:10:21.180429"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:21.205814"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:23.242734"
## [1] "run_time: 2.03692007064819"
## [1] "End time: 2025-08-03 17:10:23.30672"
## [1] "Pass took 2.1263"
## [1] "Start pass 397:"
## [1] "Start time: 2025-08-03 17:10:23.307128"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:23.332319"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:25.345516"
## [1] "run_time: 2.01319694519043"
## [1] "End time: 2025-08-03 17:10:25.414602"
## [1] "Pass took 2.1075"
## [1] "Start pass 398:"
## [1] "Start time: 2025-08-03 17:10:25.414946"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:25.439105"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:27.460734"
## [1] "run_time: 2.02162885665894"
## [1] "End time: 2025-08-03 17:10:27.52789"
## [1] "Pass took 2.1129"
## [1] "Start pass 399:"
## [1] "Start time: 2025-08-03 17:10:27.528217"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:27.552282"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:29.536286"
## [1] "run_time: 1.98400402069092"
## [1] "End time: 2025-08-03 17:10:29.603456"
## [1] "Pass took 2.0752"
## [1] "Start pass 400:"
## [1] "Start time: 2025-08-03 17:10:29.603928"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:29.628046"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:31.666706"
## [1] "run_time: 2.03866004943848"
## [1] "End time: 2025-08-03 17:10:31.732583"
## [1] "Pass took 2.1287"
## [1] "Start pass 401:"
## [1] "Start time: 2025-08-03 17:10:31.744412"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:31.755782"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:32.897642"
## [1] "run_time: 1.14186000823975"
## [1] "End time: 2025-08-03 17:10:32.94861"
## [1] "Pass took 1.2042"
## [1] "Start pass 402:"
## [1] "Start time: 2025-08-03 17:10:32.948945"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:32.959991"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:33.816451"
## [1] "run_time: 0.856460094451904"
## [1] "End time: 2025-08-03 17:10:33.873991"
## [1] "Pass took 0.925"
## [1] "Start pass 403:"
## [1] "Start time: 2025-08-03 17:10:33.874547"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:33.888999"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:34.792897"
## [1] "run_time: 0.903898000717163"
## [1] "End time: 2025-08-03 17:10:34.856831"
## [1] "Pass took 0.9823"
## [1] "Start pass 404:"
## [1] "Start time: 2025-08-03 17:10:34.857553"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:34.873191"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:35.775875"
## [1] "run_time: 0.902683973312378"
## [1] "End time: 2025-08-03 17:10:35.824981"
## [1] "Pass took 0.9674"
## [1] "Start pass 405:"
## [1] "Start time: 2025-08-03 17:10:35.825321"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:35.839691"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:36.695054"
## [1] "run_time: 0.855363130569458"
## [1] "End time: 2025-08-03 17:10:36.747618"
## [1] "Pass took 0.9223"
## [1] "Start pass 406:"
## [1] "Start time: 2025-08-03 17:10:36.761389"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:36.772892"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:37.66731"
## [1] "run_time: 0.894418001174927"
## [1] "End time: 2025-08-03 17:10:37.717044"
## [1] "Pass took 0.9557"
## [1] "Start pass 407:"
## [1] "Start time: 2025-08-03 17:10:37.717455"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:37.729626"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:38.630886"
## [1] "run_time: 0.901260137557983"
## [1] "End time: 2025-08-03 17:10:38.67806"
## [1] "Pass took 0.9606"
## [1] "Start pass 408:"
## [1] "Start time: 2025-08-03 17:10:38.678408"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:38.689384"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:39.735083"
## [1] "run_time: 1.04569911956787"
## [1] "End time: 2025-08-03 17:10:39.794161"
## [1] "Pass took 1.1158"
## [1] "Start pass 409:"
## [1] "Start time: 2025-08-03 17:10:39.794941"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:39.809926"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:40.663154"
## [1] "run_time: 0.853227853775024"
## [1] "End time: 2025-08-03 17:10:40.714545"
## [1] "Pass took 0.9196"
## [1] "Start pass 410:"
## [1] "Start time: 2025-08-03 17:10:40.714916"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:40.72913"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:41.630163"
## [1] "run_time: 0.9010329246521"
## [1] "End time: 2025-08-03 17:10:41.680643"
## [1] "Pass took 0.9657"
## [1] "Start pass 411:"
## [1] "Start time: 2025-08-03 17:10:41.693659"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:41.7195"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:43.351631"
## [1] "run_time: 1.63213086128235"
## [1] "End time: 2025-08-03 17:10:43.537583"
## [1] "Pass took 1.8439"
## [1] "Start pass 412:"
## [1] "Start time: 2025-08-03 17:10:43.537967"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:43.564198"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:45.150558"
## [1] "run_time: 1.58635997772217"
## [1] "End time: 2025-08-03 17:10:45.352554"
## [1] "Pass took 1.8146"
## [1] "Start pass 413:"
## [1] "Start time: 2025-08-03 17:10:45.352886"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:45.378699"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:46.986812"
## [1] "run_time: 1.60811305046082"
## [1] "End time: 2025-08-03 17:10:47.172834"
## [1] "Pass took 1.8199"
## [1] "Start pass 414:"
## [1] "Start time: 2025-08-03 17:10:47.173214"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:47.198141"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:48.788853"
## [1] "run_time: 1.59071183204651"
## [1] "End time: 2025-08-03 17:10:48.977071"
## [1] "Pass took 1.8039"
## [1] "Start pass 415:"
## [1] "Start time: 2025-08-03 17:10:48.977461"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:49.00651"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:50.612999"
## [1] "run_time: 1.60648894309998"
## [1] "End time: 2025-08-03 17:10:50.843229"
## [1] "Pass took 1.8658"
## [1] "Start pass 416:"
## [1] "Start time: 2025-08-03 17:10:50.860371"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:50.887615"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:52.525424"
## [1] "run_time: 1.63780903816223"
## [1] "End time: 2025-08-03 17:10:52.737904"
## [1] "Pass took 1.8775"
## [1] "Start pass 417:"
## [1] "Start time: 2025-08-03 17:10:52.73824"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:52.766957"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:54.375427"
## [1] "run_time: 1.60846996307373"
## [1] "End time: 2025-08-03 17:10:54.560013"
## [1] "Pass took 1.8218"
## [1] "Start pass 418:"
## [1] "Start time: 2025-08-03 17:10:54.560369"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:54.590212"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:56.267507"
## [1] "run_time: 1.67729496955872"
## [1] "End time: 2025-08-03 17:10:56.449439"
## [1] "Pass took 1.8891"
## [1] "Start pass 419:"
## [1] "Start time: 2025-08-03 17:10:56.449771"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:56.475972"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:10:58.125592"
## [1] "run_time: 1.64962005615234"
## [1] "End time: 2025-08-03 17:10:58.326342"
## [1] "Pass took 1.8766"
## [1] "Start pass 420:"
## [1] "Start time: 2025-08-03 17:10:58.326801"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:10:58.371554"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:00.070501"
## [1] "run_time: 1.6989471912384"
## [1] "End time: 2025-08-03 17:11:00.283536"
## [1] "Pass took 1.9567"
## [1] "Start pass 421:"
## [1] "Start time: 2025-08-03 17:11:00.300633"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:00.307972"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:00.812405"
## [1] "run_time: 0.504433155059814"
## [1] "End time: 2025-08-03 17:11:00.887839"
## [1] "Pass took 0.5872"
## [1] "Start pass 422:"
## [1] "Start time: 2025-08-03 17:11:00.888244"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:00.898409"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:01.403535"
## [1] "run_time: 0.505125999450684"
## [1] "End time: 2025-08-03 17:11:01.447915"
## [1] "Pass took 0.5597"
## [1] "Start pass 423:"
## [1] "Start time: 2025-08-03 17:11:01.448271"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:01.455287"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:01.918165"
## [1] "run_time: 0.462877988815308"
## [1] "End time: 2025-08-03 17:11:01.961759"
## [1] "Pass took 0.5135"
## [1] "Start pass 424:"
## [1] "Start time: 2025-08-03 17:11:01.962117"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:01.9687"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:02.441657"
## [1] "run_time: 0.472957134246826"
## [1] "End time: 2025-08-03 17:11:02.483986"
## [1] "Pass took 0.5219"
## [1] "Start pass 425:"
## [1] "Start time: 2025-08-03 17:11:02.484337"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:02.490313"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:02.976022"
## [1] "run_time: 0.485708951950073"
## [1] "End time: 2025-08-03 17:11:03.023867"
## [1] "Pass took 0.5395"
## [1] "Start pass 426:"
## [1] "Start time: 2025-08-03 17:11:03.037399"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:03.044702"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:03.573956"
## [1] "run_time: 0.529253959655762"
## [1] "End time: 2025-08-03 17:11:03.629652"
## [1] "Pass took 0.5923"
## [1] "Start pass 427:"
## [1] "Start time: 2025-08-03 17:11:03.630087"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:03.638007"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:04.225453"
## [1] "run_time: 0.587445974349976"
## [1] "End time: 2025-08-03 17:11:04.275304"
## [1] "Pass took 0.6452"
## [1] "Start pass 428:"
## [1] "Start time: 2025-08-03 17:11:04.275654"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:04.282885"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:04.783558"
## [1] "run_time: 0.500672817230225"
## [1] "End time: 2025-08-03 17:11:04.830957"
## [1] "Pass took 0.5553"
## [1] "Start pass 429:"
## [1] "Start time: 2025-08-03 17:11:04.831349"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:04.838708"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:05.318044"
## [1] "run_time: 0.479336023330688"
## [1] "End time: 2025-08-03 17:11:05.361689"
## [1] "Pass took 0.5303"
## [1] "Start pass 430:"
## [1] "Start time: 2025-08-03 17:11:05.362019"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:05.368776"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:05.827301"
## [1] "run_time: 0.458524942398071"
## [1] "End time: 2025-08-03 17:11:05.876201"
## [1] "Pass took 0.5142"
## [1] "Start pass 431:"
## [1] "Start time: 2025-08-03 17:11:05.890654"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:05.972578"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:08.695156"
## [1] "run_time: 2.72257804870605"
## [1] "End time: 2025-08-03 17:11:08.817324"
## [1] "Pass took 2.9267"
## [1] "Start pass 432:"
## [1] "Start time: 2025-08-03 17:11:08.81773"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:08.864027"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:11.670995"
## [1] "run_time: 2.80696797370911"
## [1] "End time: 2025-08-03 17:11:11.816909"
## [1] "Pass took 2.9992"
## [1] "Start pass 433:"
## [1] "Start time: 2025-08-03 17:11:11.817291"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:11.862184"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:14.574794"
## [1] "run_time: 2.7126100063324"
## [1] "End time: 2025-08-03 17:11:14.697867"
## [1] "Pass took 2.8806"
## [1] "Start pass 434:"
## [1] "Start time: 2025-08-03 17:11:14.698255"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:14.74785"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:17.452388"
## [1] "run_time: 2.70453810691833"
## [1] "End time: 2025-08-03 17:11:17.595692"
## [1] "Pass took 2.8974"
## [1] "Start pass 435:"
## [1] "Start time: 2025-08-03 17:11:17.596044"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:17.644089"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:20.310246"
## [1] "run_time: 2.66615700721741"
## [1] "End time: 2025-08-03 17:11:20.438513"
## [1] "Pass took 2.8425"
## [1] "Start pass 436:"
## [1] "Start time: 2025-08-03 17:11:20.451236"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:20.496809"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:23.224911"
## [1] "run_time: 2.72810196876526"
## [1] "End time: 2025-08-03 17:11:23.345565"
## [1] "Pass took 2.8943"
## [1] "Start pass 437:"
## [1] "Start time: 2025-08-03 17:11:23.345899"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:23.399469"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:26.091982"
## [1] "run_time: 2.69251298904419"
## [1] "End time: 2025-08-03 17:11:26.24615"
## [1] "Pass took 2.9003"
## [1] "Start pass 438:"
## [1] "Start time: 2025-08-03 17:11:26.246491"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:26.313856"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:29.027607"
## [1] "run_time: 2.71375107765198"
## [1] "End time: 2025-08-03 17:11:29.149236"
## [1] "Pass took 2.9027"
## [1] "Start pass 439:"
## [1] "Start time: 2025-08-03 17:11:29.149571"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:29.195692"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:31.96064"
## [1] "run_time: 2.76494789123535"
## [1] "End time: 2025-08-03 17:11:32.086771"
## [1] "Pass took 2.9372"
## [1] "Start pass 440:"
## [1] "Start time: 2025-08-03 17:11:32.087135"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:32.13537"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:34.792535"
## [1] "run_time: 2.65716505050659"
## [1] "End time: 2025-08-03 17:11:34.91854"
## [1] "Pass took 2.8314"
## [1] "Start pass 441:"
## [1] "Start time: 2025-08-03 17:11:34.931576"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:34.938479"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:36.470674"
## [1] "run_time: 1.53219509124756"
## [1] "End time: 2025-08-03 17:11:36.604661"
## [1] "Pass took 1.6731"
## [1] "Start pass 442:"
## [1] "Start time: 2025-08-03 17:11:36.605018"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:36.612452"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:38.064162"
## [1] "run_time: 1.45170998573303"
## [1] "End time: 2025-08-03 17:11:38.222198"
## [1] "Pass took 1.6172"
## [1] "Start pass 443:"
## [1] "Start time: 2025-08-03 17:11:38.222581"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:38.230818"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:39.704517"
## [1] "run_time: 1.47369885444641"
## [1] "End time: 2025-08-03 17:11:39.839633"
## [1] "Pass took 1.6171"
## [1] "Start pass 444:"
## [1] "Start time: 2025-08-03 17:11:39.840042"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:39.847622"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:41.33697"
## [1] "run_time: 1.48934817314148"
## [1] "End time: 2025-08-03 17:11:41.494928"
## [1] "Pass took 1.6549"
## [1] "Start pass 445:"
## [1] "Start time: 2025-08-03 17:11:41.496251"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:41.506577"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:42.993376"
## [1] "run_time: 1.48679900169373"
## [1] "End time: 2025-08-03 17:11:43.131448"
## [1] "Pass took 1.6352"
## [1] "Start pass 446:"
## [1] "Start time: 2025-08-03 17:11:43.145092"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 447:"
## [1] "Start time: 2025-08-03 17:11:43.153592"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 448:"
## [1] "Start time: 2025-08-03 17:11:43.176611"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:43.196079"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:44.738408"
## [1] "run_time: 1.54232907295227"
## [1] "End time: 2025-08-03 17:11:44.888317"
## [1] "Pass took 1.7117"
## [1] "Start pass 449:"
## [1] "Start time: 2025-08-03 17:11:44.88873"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:44.897685"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:46.402395"
## [1] "run_time: 1.50470995903015"
## [1] "End time: 2025-08-03 17:11:46.538315"
## [1] "Pass took 1.6496"
## [1] "Start pass 450:"
## [1] "Start time: 2025-08-03 17:11:46.538717"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:46.546743"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:48.056243"
## [1] "run_time: 1.50950002670288"
## [1] "End time: 2025-08-03 17:11:48.187835"
## [1] "Pass took 1.6491"
## [1] "Start pass 451:"
## [1] "Start time: 2025-08-03 17:11:48.200962"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 452:"
## [1] "Start time: 2025-08-03 17:11:48.252145"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 453:"
## [1] "Start time: 2025-08-03 17:11:48.318424"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:48.395433"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:52.167962"
## [1] "run_time: 3.77252912521362"
## [1] "End time: 2025-08-03 17:11:52.910601"
## [1] "Pass took 4.5922"
## [1] "Start pass 454:"
## [1] "Start time: 2025-08-03 17:11:52.910993"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 455:"
## [1] "Start time: 2025-08-03 17:11:52.966539"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 456:"
## [1] "Start time: 2025-08-03 17:11:53.02147"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 457:"
## [1] "Start time: 2025-08-03 17:11:53.075344"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 458:"
## [1] "Start time: 2025-08-03 17:11:53.129103"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:53.181108"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:11:56.826333"
## [1] "run_time: 3.64522504806519"
## [1] "End time: 2025-08-03 17:11:57.557053"
## [1] "Pass took 4.428"
## [1] "Start pass 459:"
## [1] "Start time: 2025-08-03 17:11:57.557443"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:11:57.61202"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:01.366226"
## [1] "run_time: 3.75420594215393"
## [1] "End time: 2025-08-03 17:12:02.109905"
## [1] "Pass took 4.5525"
## [1] "Start pass 460:"
## [1] "Start time: 2025-08-03 17:12:02.110284"
## [1] "round"
## [1] "Skipping this model; wrote dtails"
## [1] "Start pass 461:"
## [1] "Start time: 2025-08-03 17:12:02.163734"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:02.175602"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:02.897732"
## [1] "run_time: 0.722130060195923"
## [1] "End time: 2025-08-03 17:12:02.928898"
## [1] "Pass took 0.7652"
## [1] "Start pass 462:"
## [1] "Start time: 2025-08-03 17:12:02.92924"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:02.939365"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:03.662448"
## [1] "run_time: 0.723083019256592"
## [1] "End time: 2025-08-03 17:12:03.695937"
## [1] "Pass took 0.7667"
## [1] "Start pass 463:"
## [1] "Start time: 2025-08-03 17:12:03.696294"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:03.707282"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:04.457611"
## [1] "run_time: 0.75032901763916"
## [1] "End time: 2025-08-03 17:12:04.489919"
## [1] "Pass took 0.7936"
## [1] "Start pass 464:"
## [1] "Start time: 2025-08-03 17:12:04.490293"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:04.502551"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:05.240238"
## [1] "run_time: 0.7376868724823"
## [1] "End time: 2025-08-03 17:12:05.273428"
## [1] "Pass took 0.7831"
## [1] "Start pass 465:"
## [1] "Start time: 2025-08-03 17:12:05.273804"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:05.285687"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:05.98935"
## [1] "run_time: 0.703663110733032"
## [1] "End time: 2025-08-03 17:12:06.024866"
## [1] "Pass took 0.7511"
## [1] "Start pass 466:"
## [1] "Start time: 2025-08-03 17:12:06.044514"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:06.066805"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:06.861901"
## [1] "run_time: 0.795096158981323"
## [1] "End time: 2025-08-03 17:12:06.900785"
## [1] "Pass took 0.8563"
## [1] "Start pass 467:"
## [1] "Start time: 2025-08-03 17:12:06.901189"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:06.914844"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:07.661612"
## [1] "run_time: 0.746767997741699"
## [1] "End time: 2025-08-03 17:12:07.696544"
## [1] "Pass took 0.7954"
## [1] "Start pass 468:"
## [1] "Start time: 2025-08-03 17:12:07.696896"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:07.708384"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:08.584915"
## [1] "run_time: 0.876530885696411"
## [1] "End time: 2025-08-03 17:12:08.621577"
## [1] "Pass took 0.9247"
## [1] "Start pass 469:"
## [1] "Start time: 2025-08-03 17:12:08.621934"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:08.634909"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:09.423273"
## [1] "run_time: 0.788364171981812"
## [1] "End time: 2025-08-03 17:12:09.45787"
## [1] "Pass took 0.8359"
## [1] "Start pass 470:"
## [1] "Start time: 2025-08-03 17:12:09.458268"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:09.469436"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:10.188191"
## [1] "run_time: 0.718755006790161"
## [1] "End time: 2025-08-03 17:12:10.220456"
## [1] "Pass took 0.7622"
## [1] "Start pass 471:"
## [1] "Start time: 2025-08-03 17:12:10.254683"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:10.274935"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:11.151064"
## [1] "run_time: 0.876128911972046"
## [1] "End time: 2025-08-03 17:12:11.271842"
## [1] "Pass took 1.0172"
## [1] "Start pass 472:"
## [1] "Start time: 2025-08-03 17:12:11.272256"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:11.286704"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:12.229993"
## [1] "run_time: 0.943289041519165"
## [1] "End time: 2025-08-03 17:12:12.356699"
## [1] "Pass took 1.0844"
## [1] "Start pass 473:"
## [1] "Start time: 2025-08-03 17:12:12.357066"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:12.37077"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:13.224485"
## [1] "run_time: 0.853714942932129"
## [1] "End time: 2025-08-03 17:12:13.351901"
## [1] "Pass took 0.9948"
## [1] "Start pass 474:"
## [1] "Start time: 2025-08-03 17:12:13.352276"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:13.367569"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:14.217847"
## [1] "run_time: 0.85027813911438"
## [1] "End time: 2025-08-03 17:12:14.338864"
## [1] "Pass took 0.9866"
## [1] "Start pass 475:"
## [1] "Start time: 2025-08-03 17:12:14.33919"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:14.352437"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:15.195406"
## [1] "run_time: 0.842968940734863"
## [1] "End time: 2025-08-03 17:12:15.317387"
## [1] "Pass took 0.9782"
## [1] "Start pass 476:"
## [1] "Start time: 2025-08-03 17:12:15.332181"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:15.350954"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:16.197749"
## [1] "run_time: 0.846794843673706"
## [1] "End time: 2025-08-03 17:12:16.351752"
## [1] "Pass took 1.0196"
## [1] "Start pass 477:"
## [1] "Start time: 2025-08-03 17:12:16.352612"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:16.369365"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:17.274596"
## [1] "run_time: 0.90523099899292"
## [1] "End time: 2025-08-03 17:12:17.398728"
## [1] "Pass took 1.0461"
## [1] "Start pass 478:"
## [1] "Start time: 2025-08-03 17:12:17.399318"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:17.413306"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:18.288143"
## [1] "run_time: 0.874836921691895"
## [1] "End time: 2025-08-03 17:12:18.405157"
## [1] "Pass took 1.0058"
## [1] "Start pass 479:"
## [1] "Start time: 2025-08-03 17:12:18.4055"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:18.423289"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:19.284295"
## [1] "run_time: 0.861006021499634"
## [1] "End time: 2025-08-03 17:12:19.415737"
## [1] "Pass took 1.0102"
## [1] "Start pass 480:"
## [1] "Start time: 2025-08-03 17:12:19.416081"
## [1] "round"
## [1] "Running IRT-M"
## [1] "IRT-M start time: 2025-08-03 17:12:19.428491"
```

```
## Sampling...
```

```
## [1] "IRT-M End time: 2025-08-03 17:12:20.265614"
## [1] "run_time: 0.837122917175293"
## [1] "End time: 2025-08-03 17:12:20.412192"
## [1] "Pass took 0.9961"
## 
## > ## Save
## > rname = paste0("irtm_only_results_single_pass.rds")
## 
## > tname = paste0("irtm_only_time_single_pass.rds")
## 
## > pname = paste0("irtm_only_params_single_pass.rds")
## 
## > save(all_results, file=rname)
## 
## > save(model_times, file=tname)
## 
## > save(params_tracker, file=pname)
```

``` r
## #' plots
## updated 7/31:
source("irtm_only_range_plots.R", echo = TRUE)
```

```
## 
## > library(dplyr)
## 
## > library(tidyverse)
```

```
## ── Attaching core tidyverse packages ───────────────────────────────────────── tidyverse 2.0.0 ──
## ✔ forcats   1.0.0     ✔ readr     2.1.5
## ✔ lubridate 1.9.3     ✔ stringr   1.5.1
## ✔ purrr     1.0.2     ✔ tibble    3.3.0
```

```
## ── Conflicts ─────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ tidyr::expand() masks Matrix::expand()
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ✖ tidyr::pack()   masks Matrix::pack()
## ✖ dplyr::select() masks MASS::select()
## ✖ tidyr::unpack() masks Matrix::unpack()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

```
## 
## > library(ggplot2)
## 
## > source('irtm_results_to_df_range.R') ## script to format list of results as single df
## 
## > source('na_indicies.R') # helper to find NA values in model comparisons
## 
## > ## Load data:
## > ## Partial:
## > #load("irtm_only_params_partial_.rds")
## > ## all_results:
## > #load("irtm_only_time_partial_.rds")
## > ## model_times:
## > #l .... [TRUNCATED] 
## 
## > load("irtm_only_time_single_pass.rds")
## 
## > load("irtm_only_params_single_pass.rds")
## 
## > ##
## > all_results <- lapply(all_results, function(x) {
## +   if ("irtM" %in% names(x)) {
## +     names(x)[names(x) == "irtM"] <- "irtm"
## +   }
## +   return( .... [TRUNCATED] 
## 
## > all_results <- lapply(all_results, function(x) {
## +   if ("CFA" %in% names(x)) {
## +     names(x)[names(x) == "CFA"] <- "bcfa"
## +   }
## +   return(x)
## + })
## 
## > ## get index of NA values in the sim results
## > ## NA out the time runs for those models
## > ## (to not distort estimated time)
## > ## first column is ro .... [TRUNCATED] 
## 
## > ## update time to NA out times for failed models:
## > updated_time <- na_times(model_times, na_ind)
## [1] "NA index dataframe is empty, returning original list"
## 
## > ## Param list to df:
## > ## Need to remove null entries
## > ## but keep them!
## > 
## > # Initialize an empty list to store non-NULL values
## > non_null_params .... [TRUNCATED] 
## 
## > non_null_results <- compact(all_results)
## 
## > non_null_time <- compact(model_times)
## 
## > # Create a data frame from the non-NULL list
## > params_df <- bind_rows(non_null_params)
## 
## > ## Send results to dataframe:
## > 
## > sim_results <- irtm_results_to_df(non_null_results,
## +                                   params_df, 
## +             .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## [1] 201
## [1] 202
## [1] 203
## [1] 204
## [1] 205
## [1] 206
## [1] 207
## [1] 208
## [1] 209
## [1] 210
## [1] 211
## [1] 212
## [1] 213
## [1] 214
## [1] 215
## [1] 216
## [1] 217
## [1] 218
## [1] 219
## [1] 220
## [1] 221
## [1] 222
## [1] 223
## [1] 224
## [1] 225
## [1] 226
## [1] 227
## [1] 228
## [1] 229
## [1] 230
## [1] 231
## [1] 232
## [1] 233
## [1] 234
## [1] 235
## [1] 236
## [1] 237
## [1] 238
## [1] 239
## [1] 240
## [1] 241
## [1] 242
## [1] 243
## [1] 244
## [1] 245
## [1] 246
## [1] 247
## [1] 248
## [1] 249
## [1] 250
## [1] 251
## [1] 252
## [1] 253
## [1] 254
## [1] 255
## [1] 256
## [1] 257
## [1] 258
## [1] 259
## [1] 260
## [1] 261
## [1] 262
## [1] 263
## [1] 264
## [1] 265
## [1] 266
## [1] 267
## [1] 268
## [1] 269
## [1] 270
## [1] 271
## [1] 272
## [1] 273
## [1] 274
## [1] 275
## [1] 276
## [1] 277
## [1] 278
## [1] 279
## [1] 280
## [1] 281
## [1] 282
## [1] 283
## [1] 284
## [1] 285
## [1] 286
## [1] 287
## [1] 288
## [1] 289
## [1] 290
## [1] 291
## [1] 292
## [1] 293
## [1] 294
## [1] 295
## [1] 296
## [1] 297
## [1] 298
## [1] 299
## [1] 300
## [1] 301
## [1] 302
## [1] 303
## [1] 304
## [1] 305
## [1] 306
## [1] 307
## [1] 308
## [1] 309
## [1] 310
## [1] 311
## [1] 312
## [1] 313
## [1] 314
## [1] 315
## [1] 316
## [1] 317
## [1] 318
## [1] 319
## [1] 320
## [1] 321
## [1] 322
## [1] 323
## [1] 324
## [1] 325
## [1] 326
## [1] 327
## [1] 328
## [1] 329
## [1] 330
## [1] 331
## [1] 332
## [1] 333
## [1] 334
## [1] 335
## [1] 336
## [1] 337
## [1] 338
## [1] 339
## [1] 340
## [1] 341
## [1] 342
## [1] 343
## [1] 344
## [1] 345
## [1] 346
## [1] 347
## [1] 348
## [1] 349
## [1] 350
## [1] 351
## [1] 352
## [1] 353
## [1] 354
## [1] 355
## [1] 356
## [1] 357
## [1] 358
## [1] 359
## [1] 360
## [1] 361
## [1] 362
## [1] 363
## [1] 364
## [1] 365
## [1] 366
## [1] 367
## [1] 368
## [1] 369
## [1] 370
## [1] 371
## [1] 372
## [1] 373
## [1] 374
## [1] 375
## [1] 376
## [1] 377
## [1] 378
## [1] 379
## [1] 380
## [1] 381
## [1] 382
## [1] 383
## [1] 384
## [1] 385
## [1] 386
## [1] 387
## 
## > ## Runtime by model
## > time_results <- irtm_results_to_df(non_null_time ,
## +                                    params_df,
## +                           .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## [1] 201
## [1] 202
## [1] 203
## [1] 204
## [1] 205
## [1] 206
## [1] 207
## [1] 208
## [1] 209
## [1] 210
## [1] 211
## [1] 212
## [1] 213
## [1] 214
## [1] 215
## [1] 216
## [1] 217
## [1] 218
## [1] 219
## [1] 220
## [1] 221
## [1] 222
## [1] 223
## [1] 224
## [1] 225
## [1] 226
## [1] 227
## [1] 228
## [1] 229
## [1] 230
## [1] 231
## [1] 232
## [1] 233
## [1] 234
## [1] 235
## [1] 236
## [1] 237
## [1] 238
## [1] 239
## [1] 240
## [1] 241
## [1] 242
## [1] 243
## [1] 244
## [1] 245
## [1] 246
## [1] 247
## [1] 248
## [1] 249
## [1] 250
## [1] 251
## [1] 252
## [1] 253
## [1] 254
## [1] 255
## [1] 256
## [1] 257
## [1] 258
## [1] 259
## [1] 260
## [1] 261
## [1] 262
## [1] 263
## [1] 264
## [1] 265
## [1] 266
## [1] 267
## [1] 268
## [1] 269
## [1] 270
## [1] 271
## [1] 272
## [1] 273
## [1] 274
## [1] 275
## [1] 276
## [1] 277
## [1] 278
## [1] 279
## [1] 280
## [1] 281
## [1] 282
## [1] 283
## [1] 284
## [1] 285
## [1] 286
## [1] 287
## [1] 288
## [1] 289
## [1] 290
## [1] 291
## [1] 292
## [1] 293
## [1] 294
## [1] 295
## [1] 296
## [1] 297
## [1] 298
## [1] 299
## [1] 300
## [1] 301
## [1] 302
## [1] 303
## [1] 304
## [1] 305
## [1] 306
## [1] 307
## [1] 308
## [1] 309
## [1] 310
## [1] 311
## [1] 312
## [1] 313
## [1] 314
## [1] 315
## [1] 316
## [1] 317
## [1] 318
## [1] 319
## [1] 320
## [1] 321
## [1] 322
## [1] 323
## [1] 324
## [1] 325
## [1] 326
## [1] 327
## [1] 328
## [1] 329
## [1] 330
## [1] 331
## [1] 332
## [1] 333
## [1] 334
## [1] 335
## [1] 336
## [1] 337
## [1] 338
## [1] 339
## [1] 340
## [1] 341
## [1] 342
## [1] 343
## [1] 344
## [1] 345
## [1] 346
## [1] 347
## [1] 348
## [1] 349
## [1] 350
## [1] 351
## [1] 352
## [1] 353
## [1] 354
## [1] 355
## [1] 356
## [1] 357
## [1] 358
## [1] 359
## [1] 360
## [1] 361
## [1] 362
## [1] 363
## [1] 364
## [1] 365
## [1] 366
## [1] 367
## [1] 368
## [1] 369
## [1] 370
## [1] 371
## [1] 372
## [1] 373
## [1] 374
## [1] 375
## [1] 376
## [1] 377
## [1] 378
## [1] 379
## [1] 380
## [1] 381
## [1] 382
## [1] 383
## [1] 384
## [1] 385
## [1] 386
## [1] 387
##   iteration      irtm pass_N pass_K pass_d
## 1        12 0.2959101     50      5      3
## 2        13 0.2852340     50      5      3
## 3        16 0.3277249     50      5      3
## 4        20 0.3110759     50      5      3
## 5        25 0.9444242     50      5      8
## 6        29 0.9408710     50      5      8
```

```
## `summarise()` has grouped output by 'pass_N', 'pass_K'. You can override using the `.groups`
## argument.
```

```
## 
## > ## summarize time by model:
## > #bsem_times = time_results[which(time_results$model=="bsem"),]
## > #bcfa_times = time_results[which(time_results$model== .... [TRUNCATED] 
## 
## > summary(irtm_times$min)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.2178  1.3984  3.1942  6.3138  7.4201 34.1695 
## 
## > summary(irtm_times$max)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.2286  1.4773  3.7725  7.0544  8.9134 34.8522 
## 
## > ## Plot of time variability:
## > ## to diagnose time stamp inconsistencies:
## > 
## > # Create a parameter combo label
## > timing_df <- time_results %>%
## +    .... [TRUNCATED] 
## 
## > # Arrange levels in increasing N, then K, then D
## > ordered_levels <- timing_df %>%
## +   arrange(pass_N, pass_K, pass_d) %>%
## +   distinct(param_combo) .... [TRUNCATED] 
## 
## > # Apply the ordering to param_combo
## > timing_df <- timing_df %>%
## +   mutate(param_combo = factor(param_combo, levels = ordered_levels))
## 
## > # Plot boxplots of average runtime per parameter combination, faceted by model
## > 
## > timeplots = ggplot(timing_df, aes(x = param_combo, y = avg)) +
## + .... [TRUNCATED] 
## 
## > ##summary(time_results$max)
## > 
## > timeplots
```

```
## 
## > ggsave(filename='simulations/results/figures/timeplots_range_irtm_only.png', 
## +        plot=timeplots,
## +        dpi = 300,  width = 12, height=6)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

```
## 
## > ## Data for Fig 3:  count NA by models:
## > na_count_by_group <- irtm_results_to_df(non_null_results,
## +                                         params .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## [1] 201
## [1] 202
## [1] 203
## [1] 204
## [1] 205
## [1] 206
## [1] 207
## [1] 208
## [1] 209
## [1] 210
## [1] 211
## [1] 212
## [1] 213
## [1] 214
## [1] 215
## [1] 216
## [1] 217
## [1] 218
## [1] 219
## [1] 220
## [1] 221
## [1] 222
## [1] 223
## [1] 224
## [1] 225
## [1] 226
## [1] 227
## [1] 228
## [1] 229
## [1] 230
## [1] 231
## [1] 232
## [1] 233
## [1] 234
## [1] 235
## [1] 236
## [1] 237
## [1] 238
## [1] 239
## [1] 240
## [1] 241
## [1] 242
## [1] 243
## [1] 244
## [1] 245
## [1] 246
## [1] 247
## [1] 248
## [1] 249
## [1] 250
## [1] 251
## [1] 252
## [1] 253
## [1] 254
## [1] 255
## [1] 256
## [1] 257
## [1] 258
## [1] 259
## [1] 260
## [1] 261
## [1] 262
## [1] 263
## [1] 264
## [1] 265
## [1] 266
## [1] 267
## [1] 268
## [1] 269
## [1] 270
## [1] 271
## [1] 272
## [1] 273
## [1] 274
## [1] 275
## [1] 276
## [1] 277
## [1] 278
## [1] 279
## [1] 280
## [1] 281
## [1] 282
## [1] 283
## [1] 284
## [1] 285
## [1] 286
## [1] 287
## [1] 288
## [1] 289
## [1] 290
## [1] 291
## [1] 292
## [1] 293
## [1] 294
## [1] 295
## [1] 296
## [1] 297
## [1] 298
## [1] 299
## [1] 300
## [1] 301
## [1] 302
## [1] 303
## [1] 304
## [1] 305
## [1] 306
## [1] 307
## [1] 308
## [1] 309
## [1] 310
## [1] 311
## [1] 312
## [1] 313
## [1] 314
## [1] 315
## [1] 316
## [1] 317
## [1] 318
## [1] 319
## [1] 320
## [1] 321
## [1] 322
## [1] 323
## [1] 324
## [1] 325
## [1] 326
## [1] 327
## [1] 328
## [1] 329
## [1] 330
## [1] 331
## [1] 332
## [1] 333
## [1] 334
## [1] 335
## [1] 336
## [1] 337
## [1] 338
## [1] 339
## [1] 340
## [1] 341
## [1] 342
## [1] 343
## [1] 344
## [1] 345
## [1] 346
## [1] 347
## [1] 348
## [1] 349
## [1] 350
## [1] 351
## [1] 352
## [1] 353
## [1] 354
## [1] 355
## [1] 356
## [1] 357
## [1] 358
## [1] 359
## [1] 360
## [1] 361
## [1] 362
## [1] 363
## [1] 364
## [1] 365
## [1] 366
## [1] 367
## [1] 368
## [1] 369
## [1] 370
## [1] 371
## [1] 372
## [1] 373
## [1] 374
## [1] 375
## [1] 376
## [1] 377
## [1] 378
## [1] 379
## [1] 380
## [1] 381
## [1] 382
## [1] 383
## [1] 384
## [1] 385
## [1] 386
## [1] 387
```

```
## `summarise()` has grouped output by 'pass_N', 'pass_K'. You can override using the `.groups`
## argument.
```

```
## 
## > gg_sim_results <- irtm_results_to_df(non_null_results,
## +                                   params_df, 
## +                                   mode = 1) .... [TRUNCATED] 
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
## [1] 22
## [1] 23
## [1] 24
## [1] 25
## [1] 26
## [1] 27
## [1] 28
## [1] 29
## [1] 30
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
## [1] 37
## [1] 38
## [1] 39
## [1] 40
## [1] 41
## [1] 42
## [1] 43
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
## [1] 49
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
## [1] 64
## [1] 65
## [1] 66
## [1] 67
## [1] 68
## [1] 69
## [1] 70
## [1] 71
## [1] 72
## [1] 73
## [1] 74
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
## [1] 80
## [1] 81
## [1] 82
## [1] 83
## [1] 84
## [1] 85
## [1] 86
## [1] 87
## [1] 88
## [1] 89
## [1] 90
## [1] 91
## [1] 92
## [1] 93
## [1] 94
## [1] 95
## [1] 96
## [1] 97
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
## [1] 131
## [1] 132
## [1] 133
## [1] 134
## [1] 135
## [1] 136
## [1] 137
## [1] 138
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
## [1] 146
## [1] 147
## [1] 148
## [1] 149
## [1] 150
## [1] 151
## [1] 152
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
## [1] 159
## [1] 160
## [1] 161
## [1] 162
## [1] 163
## [1] 164
## [1] 165
## [1] 166
## [1] 167
## [1] 168
## [1] 169
## [1] 170
## [1] 171
## [1] 172
## [1] 173
## [1] 174
## [1] 175
## [1] 176
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
## [1] 182
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
## [1] 199
## [1] 200
## [1] 201
## [1] 202
## [1] 203
## [1] 204
## [1] 205
## [1] 206
## [1] 207
## [1] 208
## [1] 209
## [1] 210
## [1] 211
## [1] 212
## [1] 213
## [1] 214
## [1] 215
## [1] 216
## [1] 217
## [1] 218
## [1] 219
## [1] 220
## [1] 221
## [1] 222
## [1] 223
## [1] 224
## [1] 225
## [1] 226
## [1] 227
## [1] 228
## [1] 229
## [1] 230
## [1] 231
## [1] 232
## [1] 233
## [1] 234
## [1] 235
## [1] 236
## [1] 237
## [1] 238
## [1] 239
## [1] 240
## [1] 241
## [1] 242
## [1] 243
## [1] 244
## [1] 245
## [1] 246
## [1] 247
## [1] 248
## [1] 249
## [1] 250
## [1] 251
## [1] 252
## [1] 253
## [1] 254
## [1] 255
## [1] 256
## [1] 257
## [1] 258
## [1] 259
## [1] 260
## [1] 261
## [1] 262
## [1] 263
## [1] 264
## [1] 265
## [1] 266
## [1] 267
## [1] 268
## [1] 269
## [1] 270
## [1] 271
## [1] 272
## [1] 273
## [1] 274
## [1] 275
## [1] 276
## [1] 277
## [1] 278
## [1] 279
## [1] 280
## [1] 281
## [1] 282
## [1] 283
## [1] 284
## [1] 285
## [1] 286
## [1] 287
## [1] 288
## [1] 289
## [1] 290
## [1] 291
## [1] 292
## [1] 293
## [1] 294
## [1] 295
## [1] 296
## [1] 297
## [1] 298
## [1] 299
## [1] 300
## [1] 301
## [1] 302
## [1] 303
## [1] 304
## [1] 305
## [1] 306
## [1] 307
## [1] 308
## [1] 309
## [1] 310
## [1] 311
## [1] 312
## [1] 313
## [1] 314
## [1] 315
## [1] 316
## [1] 317
## [1] 318
## [1] 319
## [1] 320
## [1] 321
## [1] 322
## [1] 323
## [1] 324
## [1] 325
## [1] 326
## [1] 327
## [1] 328
## [1] 329
## [1] 330
## [1] 331
## [1] 332
## [1] 333
## [1] 334
## [1] 335
## [1] 336
## [1] 337
## [1] 338
## [1] 339
## [1] 340
## [1] 341
## [1] 342
## [1] 343
## [1] 344
## [1] 345
## [1] 346
## [1] 347
## [1] 348
## [1] 349
## [1] 350
## [1] 351
## [1] 352
## [1] 353
## [1] 354
## [1] 355
## [1] 356
## [1] 357
## [1] 358
## [1] 359
## [1] 360
## [1] 361
## [1] 362
## [1] 363
## [1] 364
## [1] 365
## [1] 366
## [1] 367
## [1] 368
## [1] 369
## [1] 370
## [1] 371
## [1] 372
## [1] 373
## [1] 374
## [1] 375
## [1] 376
## [1] 377
## [1] 378
## [1] 379
## [1] 380
## [1] 381
## [1] 382
## [1] 383
## [1] 384
## [1] 385
## [1] 386
## [1] 387
##   iteration     irtm pass_N pass_K pass_d
## 1        12 3.997450     50      5      3
## 2        13 3.819781     50      5      3
## 3        16 4.095410     50      5      3
## 4        20 4.264376     50      5      3
## 5        25 3.755040     50      5      8
## 6        29 3.572611     50      5      8
```

```
## `summarise()` has grouped output by 'pass_N', 'pass_K'. You can override using the `.groups`
## argument.
```

```
## 
## > ## column names for labels:
## > 
## > colnames(gg_sim_results)[which(colnames(gg_sim_results) == "pass_N")] <- "N"
## 
## > colnames(gg_sim_results)[which(colnames(gg_sim_results) == "pass_K")] <- "K"
## 
## > p_results <- ggplot(gg_sim_results, aes(x= pass_d, 
## +                                      y=avg,
## +                                      ymin=min, 
##  .... [TRUNCATED] 
## 
## > p_results
```

```
## 
## > ggsave(filename='simulations/results/figures/MSE_irtm-only.png', 
## +        plot=p_results,
## +        dpi = 300,  width = 12, height=6)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-2.png)

```
## 
## > ## Time results
## > 
## > colnames(time_results)[which(colnames(time_results) == "pass_N")] <- "N"
## 
## > colnames(time_results)[which(colnames(time_results) == "pass_K")] <- "K"
## 
## > t_results <- ggplot(time_results, aes(x= pass_d, 
## +                                         y=avg,
## +                                         ymin=mi .... [TRUNCATED] 
## 
## > t_results
```

```
## 
## > ggsave(filename='simulations/results/figures/time_range_irt-bsem-bcfa.png', 
## +        plot=t_results,
## +        dpi = 300,  width = 12, height=6)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-3.png)

```
## 
## > ## For partial data:
## > ## plot which models that we're still waiting for:
## > gg_remainder <- ggplot(na.omit(na_count_by_group), 
## +                  a .... [TRUNCATED] 
## 
## > gg_remainder
```

```
## 
## > ggsave(filename='simulations/results/figures/sim_progress.png',
## +        plot=gg_remainder,
## +        dpi = 300, 
## +        width = 12, 
## +        heig .... [TRUNCATED]
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-4.png)

``` r
## #' Section: Application and Illustration
```

The scripts walk through IRT-M on a synthetic public opinion survey.
The results are based on our package vignette
For details about how we generated the data, see https://github.com/margaretfoster/IRTM-Synth


``` r
## Mjf: 8/1/25: check where the data pulls from for things that run in 
## knitr-- the location of the master file working directory or 
## the relative directory of the source() script 
source("application.R", echo = TRUE)
```

```
## 
## > ## Data prep:
## > library(tidyverse) # version: tidyverse_2.0.0 
## 
## > library(dplyr) #version: dplyr_1.1.4
## 
## > library(stats) # version: stats4
## 
## > library(fastDummies) # version: fastDummies_1.7.3
## 
## > library(reshape2) #version: reshape2_1.4.4
```

```
## 
## Attaching package: 'reshape2'
```

```
## The following object is masked from 'package:tidyr':
## 
##     smiths
```

```
## 
## > ## IRT-M estimation:
## > #devtools::install_github("dasiegel/IRT-M")
## > library(IRTM) #version 1.00
## 
## > ## Results visualization: 
## > library(ggplot2)  # version: ggplot2_3.4.4
## 
## > library(ggridges) #version: ggridges_0.5.6 
## 
## > library(RColorBrewer) #version: RColorBrewer_1.1-3
## 
## > library(ggrepel) # version: ggrepel_0.9.5 
## 
## > ##Formatting the Input Data
## > 
## > synth_questions <- NULL  # Initialize to avoid R CMD check notes
## 
## > load("./vdata/synth_questions.rda")
## 
## > ## Convert numeric ordinal responses to factors
## > ebdatsub <- lapply(ebdatsynth[,], factor) ## that's a list now
## 
## > ## converts the list back into a dataframe:
## > Y <- dummy_cols(.data=ebdatsub,
## +                 remove_selected_columns=TRUE)
## 
## > ## remove the .data that dummy_cols adds to the column names
## > colnames(Y) <- gsub(".data.", '', colnames(Y))
## 
## > ## remove the data objects:
## > rm(ebdatsub)
## 
## > rm(ebdatsynth)
## 
## > ##Loading and formatting M-Matrix
## > load('./vdata/mcodes.rda')
## 
## > ## Only keep M-Codes with loadings or outcomes:
## > MCodes$encoding <- rowSums(abs(MCodes[,4:9])) 
## 
## > MCodes <- MCodes[which(MCodes$encoding > 0),]
## 
## > ## Produce a K-coded questions x R-responses data frame:
## > 
## > d <- 6 #number of coded dimensions
## 
## > mcolumns <- c("QMap", "D1-Culture threat", 
## +               "D2-ReligionThreat", 
## +               "D3-Economic Threat",
## +               "D4-HealthTh ..." ... [TRUNCATED] 
## 
## > combine <- MCodes[,mcolumns] %>% ## question codes and loadings 
## +   inner_join(
## +     Y %>% 
## +       t() %>% 
## +       as.data.frame(stringsAsFactor .... [TRUNCATED]
```

```
## Warning: `type_convert()` only converts columns of type 'character'.
## - `df` has no columns of type 'character'
```

```
## 
## ── Column specification ─────────────────────────────────────────────────────────────────────────
## cols()
```

```
## 
## > M_matrix <- as.data.frame(combine[, 1:(d+1)])
## 
## > #Reverse the earlier transposition of the observations:
## > Y_in <- combine[, (d+2):ncol(combine)]%>%
## +   t() %>%
## +   as.data.frame()
## 
## > Y_in <- as.data.frame(sapply(Y_in, as.numeric))
## 
## > ## Take the question names and 
## > ## convert to column names
## > 
## > question <- combine[,1] %>%
## +   as.data.frame() 
## 
## > colnames(Y_in) <- question[,1]
## 
## > rm(combine)
## 
## > rm(question)
## 
## > d=6
## 
## > irt <- irt_m(Y_in = Y_in, 
## +              d = d,
## +              M_matrix = M_matrix,
## +              nsamp = 1000,
## +              nburn=20,
## +         .... [TRUNCATED]
```

```
## Sampling...
```

```
## 
## > ## summarize:
## > avgthetas <- theta_av(irt$theta)
## 
## > ## load idvs:
## > load("./vdata/synth_idvs.rda")
## 
## > thetas <- cbind(avgthetas, synthidvs)
## 
## > ## Rename columns for readability:
## > colnames(thetas)[1:6] <- paste0("Theta", 1:6)
## 
## > colnames(thetas)[colnames(thetas)=="qb7_2"] <- "MoreBorderControl"
## 
## > ## Cast into factors:
## > thetas$mediatrust <- as.factor(thetas$mediatrust)
## 
## > thetas$class <- as.factor(thetas$class)
## 
## > thetas$polorient <- as.factor(thetas$polorient)
## 
## > head(thetas)
##       Theta1     Theta2      Theta3      Theta4      Theta5      Theta6 X    uniqid d63
## 1 -1.1801776 -0.1812774 -0.23662140 -0.05661034  0.07376345  0.23263700 0 320387826   3
## 2  0.1667156  1.1914145  0.04538808 -0.67535170 -0.01673677  0.02634323 1 394380111   4
## 3  0.6502136  0.1802329  0.73730648  0.73758667 -0.24387151 -1.86725672 2 139929284   1
## 4 -0.9643428 -0.1131966 -0.09803433 -0.22297706  0.06035259  0.23078217 3 424648035   3
## 5 -1.6361396 -0.3893252 -1.23283521 -0.92241585 -0.15984863  1.01213852 4 478547108   3
## 6  1.1271754  1.3648267  1.41266390  0.38934493 -0.26058779 -0.36644349 5 180669540   3
##          class polorient mediatrust trustnom trustallm trustwebonly trusttradm qa6a_1 qa6a_2
## 1  MiddleClass  FarRight      Other        0         0            0          1      1      1
## 2 WorkingClass    Center   TrustAll        0         0            0          1      1      1
## 3  MiddleClass    Center  TrustTrad        0         0            0          1      1      2
## 4  LowerMiddle      Left   TrustAll        0         0            0          1      1      1
## 5 WorkingClass    Center  TrustTrad        0         0            0          1      1      1
## 6  MiddleClass    Center      Other        0         0            0          1      2      1
##   qa6a_5 qa6a_3 qa6at qa6a_4 d63.1 d15a d1r2 d1 d11r1 d10 d1r1 d15a_r1 d11 d11r2 d15a_r2
## 1      2      1     2      2     3   -1    1  9     3   1    9       1  59     3       1
## 2      2      2     2      1     4    3    2  8     2   1    3       1  81     3       2
## 3      1      3     2      2     1   19    1  6     3   1    2       3  32     2       7
## 4      2      1     3      1     3   10    3  5     4   2    3       2  95     5       2
## 5      1      1     2      1     3   15    2  7     3   2    3       2  48     4       7
## 6      2      2     3      3     3    4    5 10     4   1    9       2  28     4       7
## 
## > #Compute correlation matrix of latent dimensions
## > theta_names <- c("Culture Threat",
## +                  "Religion Threat", 
## +                  "Eco ..." ... [TRUNCATED] 
## 
## > theta_corr <- dim_corr(irt$Sigma, theta_names)
## 
## > theta_corr
##                     Culture Threat Religion Threat Economic Threat Health Threat
## Culture Threat           1.0000000      0.17082095       0.5513292     0.5206374
## Religion Threat          0.1708210      1.00000000       0.1695355     0.1676804
## Economic Threat          0.5513292      0.16953548       1.0000000     0.5459271
## Health Threat            0.5206374      0.16768041       0.5459271     1.0000000
## Support Immigration     -0.1841322     -0.05645759      -0.1888250    -0.1740718
## Support EU              -0.4762871     -0.16677353      -0.5386303    -0.4967107
##                     Support Immigration Support EU
## Culture Threat              -0.18413218 -0.4762871
## Religion Threat             -0.05645759 -0.1667735
## Economic Threat             -0.18882500 -0.5386303
## Health Threat               -0.17407177 -0.4967107
## Support Immigration          1.00000000  0.1738642
## Support EU                   0.17386416  1.0000000
## 
## > ## Rename for interpretability:
## > ## Mapping:
## > ## Theta1-Culture threat
## > ## Theta2-ReligionThreat
## > ## Theta3-Economic Threat
## > ## Theta4-HealthTh .... [TRUNCATED] 
## 
## > #Save aggregate plot
## > ggbase <- irt_vis(d = d,
## +                   T_out = thetas,
## +                   sub_name = NULL, 
## +                   out_fi .... [TRUNCATED]
```

```
## No id variables; using all as measure variables
```

```
## Picking joint bandwidth of 0.136
```

```
## 
## > #Save plot subset by media trust
## > ggmt <- irt_vis(d = d,
## +                 T_out = thetas,
## +                 sub_name = "mediatrust",
## +             .... [TRUNCATED]
```

```
## Using mediatrust as id variables
```

```
## Picking joint bandwidth of 0.231
```

```
## Picking joint bandwidth of 0.055
```

```
## Picking joint bandwidth of 0.204
```

```
## Picking joint bandwidth of 0.212
```

```
## Picking joint bandwidth of 0.0726
```

```
## Picking joint bandwidth of 0.21
```

```
## 
## > ## Lambda
## > 
## > 
## > #Extract relevant substantive notes and create data frame with them and item codes
## > 
## > #filtered_MCodes <- MCodes[MCodes[[2]] %in .... [TRUNCATED]
```

Plots saved in application.R:

```
## Error in parse(text = input): attempt to use zero-length variable name
```



``` r
## System summary:
sessionInfo()
```

```
## R version 4.4.1 (2024-06-14)
## Platform: x86_64-apple-darwin20
## Running under: macOS 15.5
## 
## Matrix products: default
## BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
## LAPACK: /Library/Frameworks/R.framework/Versions/4.4-x86_64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.0
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## time zone: America/New_York
## tzcode source: internal
## 
## attached base packages:
## [1] stats4    stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
##  [1] ggrepel_0.9.6      RColorBrewer_1.1-3 ggridges_0.5.6     reshape2_1.4.4    
##  [5] fastDummies_1.7.4  lubridate_1.9.3    forcats_1.0.0      stringr_1.5.1     
##  [9] purrr_1.0.2        readr_2.1.5        tibble_3.3.0       tidyverse_2.0.0   
## [13] tidyr_1.3.1        dplyr_1.1.4        IRTM_0.0.1.1       ggplot2_3.5.2     
## [17] RcppDist_0.1.1.1   RcppProgress_0.4.2 tmvtnorm_1.6       gmm_1.8           
## [21] sandwich_3.1-1     Matrix_1.7-1       truncnorm_1.0-9    nimble_1.2.1      
## [25] coda_0.19-4.1      mvtnorm_1.3-3      MASS_7.3-61       
## 
## loaded via a namespace (and not attached):
##  [1] generics_0.1.4         stringi_1.8.7          lattice_0.22-6         hms_1.1.3             
##  [5] pracma_2.4.4           magrittr_2.0.3         timechange_0.3.0       evaluate_1.0.1        
##  [9] grid_4.4.1             plyr_1.8.9             scales_1.4.0           textshaping_0.4.0     
## [13] numDeriv_2016.8-1.1    cli_3.6.5              rlang_1.1.6            RcppArmadillo_14.6.0-1
## [17] withr_3.0.2            yaml_2.3.10            tools_4.4.1            parallel_4.4.1        
## [21] tzdb_0.4.0             vctrs_0.6.5            R6_2.6.1               zoo_1.8-14            
## [25] lifecycle_1.0.4        ragg_1.3.3             pkgconfig_2.0.3        pillar_1.11.0         
## [29] gtable_0.3.6           data.table_1.16.2      glue_1.8.0             Rcpp_1.1.0            
## [33] systemfonts_1.1.0      xfun_0.52              tidyselect_1.2.1       rstudioapi_0.17.1     
## [37] knitr_1.50             farver_2.1.2           igraph_2.1.1           labeling_0.4.3        
## [41] compiler_4.4.1
```

