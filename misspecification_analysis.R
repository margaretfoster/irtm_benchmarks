lib_dir <- "./libraries"
.libPaths(c(lib_dir, .libPaths()))
set.seed(42069)

library(ggplot2)

source('simulations/helpers.R')

ITER = 10
N_vals = c(1000, 250, 50)     # Which values of N do we simulate for?
K_vals = c(250, 50, 10)                 # Which values of K do we simulate for?
d_vals = c(2, 5, 8)                            # Which values of d do we simulate for?
miss_vals = seq(0, 1, 0.25)

NKd_vals = data.frame(expand.grid(N_vals, K_vals, d_vals))
ggdata = data.frame(matrix(NA, length(N_vals)*length(K_vals)*length(d_vals)*length(miss_vals), 7))
names(ggdata) = c('n', 'k', 'd', 'miss', 'mse', 'lo', 'hi')
j = 1
for (r in 1:nrow(NKd_vals)){
  N    <- NKd_vals[r, 1]
  K    <- NKd_vals[r, 2]
  d    <- NKd_vals[r, 3]
  
  fname = paste0("simulations/results/misspecification/miss_results_N=", 
                 N, "_K=", K, "_d=",d, ".rds")
  if(!file.exists(fname))
    next
  dat = readRDS(fname)
  
  mse_dat = apply(dat$THETA, c(3,4), mse, dat$PARAMS$theta, root=T)
  
  ggdata[j:((j-1)+length(miss_vals)), ] = data.frame(n=paste0('N=',N), 
                                                     k=paste0('K=',K), 
                                                     d=d, miss=miss_vals,
                                                 mse=rowMeans(mse_dat), 
                                                 lo=apply(mse_dat, 1, min), 
                                                 hi=apply(mse_dat, 1, max))
  j = j + length(miss_vals) 
}

p <- ggplot(ggdata, aes(x=miss * 100, y=mse, ymin=lo, ymax=hi,
                    pch=as.factor(d), linetype=as.factor(d))) + 
  geom_point(size=2.5) + geom_line() +  geom_ribbon(alpha=0.2, size=0) + 
  labs(linetype='d', pch='d') + 
  xlab('% M entries misspecified') + ylab('RMSE') + 
  facet_grid(n ~ k) + theme_bw() +
  theme(legend.position=c(0.05,0.89), 
        legend.background = element_rect(color='black'), 
        text=element_text(size=20, family="Times"))

ggsave(filename='simulations/results/figures/M_misspecification.png', plot=p,
          dpi = 300,  width = 12, height=6)
 