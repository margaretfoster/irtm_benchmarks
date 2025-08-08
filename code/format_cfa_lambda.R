## Function to make the cfa and iRT lambdas compatible

## CFA loadings come in the format:
# X1...XN, for only those variables in the model
## rownames are also out of order

## need to:
## sync feature names
## intersecting features
## sync dimension names 
## sort (merge together or just order)

comp_lambda <- function(cfa_fit, feature_names){
  ## format cfa_lambda:
  ## note: cfa object will reorder features
  ## and will drop non-loading features
  lambd <-  as.data.frame(lavInspect(fit_cfa)$lambda)
  ## non-loading features:
  missing = setdiff(feature_names, rownames(lambd))
  ## build in zero rows for missing features:
  for (i in missing){
    lambd[i, ] <- 0
  }
  
  ## order rows:
  lambd <- lambd[order(as.numeric(sub("X", "", rownames(lambd)))),]
  
  return(as.matrix(lambd))
}
