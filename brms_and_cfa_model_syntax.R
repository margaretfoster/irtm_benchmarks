## Script to convert M list of dim x dim x feature factor loading matrices
## vars, a vector of variable names that correspond to entries in the data
## into an SEM/CFA model
## two implementations: CFA SEM in blavaan and CFA and SEM in brms
## blavaan format first
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


###%%%%%%%%%%%%%%%%%%%%
## BRMS
#############

## Function to create a brms line for a single latent factor
brms_line <- function(M, dims, vars, response_var = NULL){
  ## function takes M-matrix, list of variable names, target dimension, and optional response variable
  ## returns loadings in brms format
  loading_vec = M[dims, dims, ] ## extract loading from M matrix list
  names(loading_vec) = vars ## the loadings with variable list
  
  ## Get variables with non-zero loadings
  nonzero_vars <- names(loading_vec[which(loading_vec != 0)])
  
  if(length(nonzero_vars) == 0){
    return("") # Return empty string if no loadings
  }
  
  ## Handle the response variable (either provided or use first loaded item)
  if(is.null(response_var)){
    response_var <- nonzero_vars[1]
    nonzero_vars <- nonzero_vars[-1] # Remove first item as it's now the response
  }
  
  ## Create the formula with remaining predictors
  if(length(nonzero_vars) > 0){
    predictors <- paste0(nonzero_vars, collapse = " + ")
    formula <- paste0(response_var, " ~ ", predictors)
  } else {
    formula <- paste0(response_var, " ~ 1") # Intercept only if no other predictors
  }
  
  ## Return the brms formula line
  return(formula)
}

## Function to create multiple brms formulas for all latent factors
brms_format <- function(M, dims, vars, response_vars = NULL){
  ## Initialize empty list for formulas
  formulas <- list()
  
  if(dims <= 0){
    print("No dimensions to model, returning empty string")
    return("")
  }
  
  ## Process each dimension
  for(i in 1:dims){
    ## Use specified response variable for this dimension if provided
    response_var <- if(!is.null(response_vars) && length(response_vars) >= i) response_vars[i] else NULL
    
    ## Get the formula for this dimension
    formula <- brms_line(M, i, vars, response_var)
    
    if(formula != ""){
      ## Add factor name as comment and formula
      formulas[[length(formulas) + 1]] <- paste0("# Factor t", i, "\n", formula)
    }
  }
  
  ## Return combined formulas
  return(paste0(unlist(formulas), collapse = "\n\n"))
}

## Function to create a brms format with latent variables explicitly defined
brms_latent_format <- function(M, dims, vars){
  ## Initialize empty list for formulas
  formulas <- list()
  formulas[[1]] <- "# BRMS Latent Variable Model" # Header
  
  if(dims <= 0){
    print("No dimensions to model, returning empty string")
    return("")
  }
  
  ## First define the latent variables
  latent_defs <- paste0("# Latent variable definitions")
  formulas[[2]] <- latent_defs
  
  ## Then create measurement model equations
  for(i in 1:dims){
    loading_vec = M[i, i, ]
    names(loading_vec) = vars
    nonzero_vars <- names(loading_vec[which(loading_vec != 0)])
    
    if(length(nonzero_vars) > 0){
      for(var in nonzero_vars){
        ## For each indicator, create a formula relating it to the latent variable
        formula <- paste0(var, " | mi() ~ 1 + t", i)
        formulas[[length(formulas) + 1]] <- formula
      }
      
      ## Add blank line between factors
      formulas[[length(formulas) + 1]] <- ""
    }
  }
  
  ## Return combined formulas
  return(paste0(unlist(formulas), collapse = "\n"))
}

## Function to generate a complete brms model specification
## Includes both measurement model and structural model
brms_complete_model <- function(M, dims, vars, cormatrix = NULL, corrthresh = 0.25){
  ## Start with measurement model
  model <- brms_latent_format(M, dims, vars)
  
  ## Add structural relations if correlation matrix provided
  if(!is.null(cormatrix)){
    ## Extract correlations above threshold
    ts2 <- cormatrix
    diag(ts2) <- 0 # Remove self-references
    ts2[ts2 < corrthresh] <- 0
    
    ## Find non-zero correlations
    base <- which(ts2 != 0, arr.ind = TRUE)
    
    if(dim(base)[1] > 0){
      ## Add structural model header
      model <- paste0(model, "\n\n# Structural model (factor correlations)\n")
      
      ## Process each correlation
      for(i in 1:nrow(base)){
        ## Sort to ensure unique pairs
        pair <- sort(base[i,])
        
        ## Create correlation formula
        formula <- paste0("t", pair[1], " ~ t", pair[2])
        model <- paste0(model, formula, "\n")
      }
    }
  }
  
  return(model)
}

## Function to create a brms model using the | operator for ordered factors
## This is particularly useful for ordinal IRT models
brms_irt_format <- function(M, dims, vars, ordered = TRUE){
  ## Initialize empty list for formulas
  formulas <- list()
  formulas[[1]] <- "# BRMS IRT Model" # Header
  
  if(dims <= 0){
    print("No dimensions to model, returning empty string")
    return("")
  }
  
  ## For each latent trait/factor
  for(i in 1:dims){
    loading_vec = M[i, i, ]
    names(loading_vec) = vars
    nonzero_vars <- names(loading_vec[which(loading_vec != 0)])
    
    if(length(nonzero_vars) > 0){
      formulas[[length(formulas) + 1]] <- paste0("# Items for latent trait t", i)
      
      for(var in nonzero_vars){
        ## For ordinal IRT, we typically use cumulative link functions
        ordering <- if(ordered) "cumulative()" else "gaussian()"
        formula <- paste0(var, " | ", ordering, " ~ 1 + t", i)
        formulas[[length(formulas) + 1]] <- formula
      }
      
      ## Add blank line between factors
      formulas[[length(formulas) + 1]] <- ""
    }
  }
  
  ## Return combined formulas
  return(paste0(unlist(formulas), collapse = "\n"))
}

## Example usage:
## Assuming M is your factor loading matrix list, dims is the number of dimensions,
## and vars is your vector of variable names:
# 
# # For basic brms format
# brms_model <- brms_format(M, dims, vars)
# 
# # For latent variable format
# brms_latent_model <- brms_latent_format(M, dims, vars)
# 
# # For complete model with correlations
# brms_full_model <- brms_complete_model(M, dims, vars, cormatrix)
# 
# # For IRT model specification
# brms_irt_model <- brms_irt_format(M, dims, vars)

