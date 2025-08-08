## Script to convert M list of dim x dim x feature factor loading matrices
## vars, a vector of variable names that correspond to entries in the data
## into an SEM/CFA model.
## take a list of dimensions to find (might or might not be all)

## CFA , SEM syntax
## myModel<- ' 
#  f1 =~ item1 + item2 + item3
#  f2 =~ item4 + item5 + item6
#  f3 =~ item7 + item8 + item9
#'
## factor correlation syntax
#fmCovars <-'
# t1~~ t2
# t1 ~~ t3
# t2 ~~ t3
#'

## Extracting loadings from the M-matrix:
##M[3,3,] = loadings for theta3, rows are the variables

## Rbind the loadings and variable names:

## factors and variables format:
## for a specific line
cfa_line <- function(M, dims, vars){
  ## function takes M-matrix, list of variable names, and target dimension
  ## returns loadings in CFA/SEM format
  loading_vec = M[dims,dims,] ## extract loading from M matrix list
  names(loading_vec) = vars ## the loadings the variable list
  ## pull out those with a non-zero value, paste the names together
  model_spec <- paste0(names(loading_vec[which(loading_vec !=0)]),
                collapse = " + ")
  
  ## Take the model specification:
  return(model_spec)
} ## end CFA format

## convert the lines into a list
## Calls the line format function
## d times:
cfa_format <- function(M, dims, vars){
  ## Declare empty list
    format = list()
  ## first line newline character:
  format[[1]] = '\n'
  
  if(dims > 0){ ## catch case of empty dim structure
    for(i in 1:dims){
      tmp =  cfa_line(M, i, vars=vars)
      format[[i+1]] = paste0('t', i, " =~ ", tmp, '\n')
    } ## End for 1:d
  }else{
    print("No dimensions to model, returning empty string")
    return(" ")}
  
  ## return character format 
  return(paste0(unlist(format)))
}

### Specify the correlations structure:
## Takes a matrix with correlations
## returns a lavaan-formatted string
## 

corr_format <- function(cormatrix, corrthresh = 0.25){
  ts2 = cormatrix ## in the sims, true_Sigma is ground truth
  diag(ts2) = 0 ## remove self-references
  
  ## Keep correlations a threshold threshold)
  ## default at 0.25
    ts2[ts2 < corrthresh] <- 0
    
    ## convert into a list of non-zero pairings
    ## 1) sort each pairing in ascending order
    ## so n -m and m-n are recognized as the same
    base = which(ts2!=0, arr.ind = T)

  if(dim(base)[1]==0){
      cf = "\n" ## placeholder if no correlations
      return(cf) ## end function and return empty line
  }else{ 
    for(i in 1:nrow(base)){
      base[i,] = sort(base[i,]) 
  } ## end sort base
    
    ## convert list of unique pairs into
    ## string format
    base = unique(base)
    covar_format = list()
    ## first entry newline:
    for(i in 1:nrow(base)){
    covar_format[i+1] =  paste0(paste0('t', 
                                       unlist(base[i,])),
                                collapse =  " ~~ ")
  }## end covar_format loop

    covar_format <- grep("X[0-9]+", covar_format, value = TRUE) # drop empty loadings    
    cf = paste0('\n ', unlist(covar_format), collapse=' \n ') ## header and footer newline

    return(cf) 
}#end else 
} ## end corr_format

