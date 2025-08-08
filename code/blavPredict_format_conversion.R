## script to convert list to array
## To get mean theta in blavPredict 

blav_theta_samp_means <- function(fs, len_n, nsamp = nsamp, d = d) {
  print("entering format theta samp means")
  scores <- fs 
  
  if (length(scores) > nsamp) {
    select <- ((length(scores) - nsamp + 1):length(scores))
    bsem_samps <- scores[select]
    #print("Case a: ")
    #print(dim(bsem_samps))
  } else {
    bsem_samps <- scores
    #print(paste0("Case b: ", dim(bsem_samps)))
  }
  
  bsem_array <- array(data = NA, dim = c(len_n, d, length(bsem_samps)))
  #print(paste0("bsem_array is: ", dim(bsem_array)))
  #print(print(paste0("bsem_samps is: ", dim(bsem_samps))))
  
  for (i in seq_along(bsem_samps)) {
    bsem_array[, , i] <- bsem_samps[[i]]
  }
  
  print("Exiting format theta samp means")
  return(apply(bsem_array, c(1, 2), mean))
}


#blav_theta_samp_means <- function(fs, len_n,  nsamp = nsamp, d=d){
  
#  scores <- fs ## working with a reference was a problem
  
  ## make sure the samples omit the burn-in:
  ## not working directly with burn-in param because 
  ## blavaan is supposed to remove, but sometimes doesn't
  
 # if(length(scores) > nsamp){ #if longer than number of samples requested
   # select <- ((length(scores)- nsamp):length(scores))
  #  bsem_samps <- scores[select]
  #  print(paste0(dim(bsem_samps), "case a"))
  #}else{
  #  bsem_samps <- scores
   # print(paste0(dim(bsem_samps), "case b"))
  #}
  
  ## convert list of sampler draws to array
  ## make into N+anchor x d x samples:
  
  #bsem_array <- array(data = NA, dim = c(len_n, d, length(select)))
  #print(dim(bsem_array))
  #print(length(bsem_samps))
  #for (i in 1:length(select)) {
   # bsem_array[, , i] <-  bsem_samps[[i]]
  #}
  ## Return row-wise theta means (of the kth index):
  
  #return(apply(bsem_array, c(1, 2), mean))
#}