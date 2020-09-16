corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location os the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  

  ##  *****************************   CODE  *********************************************************
  id = 1:332
  f <- function(i) {
    
    ## formatC() formats numbers individually and flexibly using C style format specifications.
    data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    
    ## Return a logical vector indicating which cases are complete, i.e., have no missing values.
    sum(complete.cases(data))
  }
  
  ##  sapply() function takes list, vector or data frame as input and gives output in vector or matrix. It is 
  ##  useful for operations on list objects and returns a list object of same length of original set. 
  ##  sapply() function does the same job as lapply() function but returns a vector.
  nobs = sapply(id, f)
  
  ## Function nobs is a simple generic function to return the number of observations in a range of R model 
  ## objects. Methods are provided to work with a variety of R objects.
  data_frame <- data.frame(id, nobs)
  
  ## nobs is a simple generic function to return the number of observations
  ids = data_frame[data_frame["nobs"] > threshold, ]$id
  
  ##  library(corrr).  corrr is a package for exploring correlations in R.
  corrr = numeric()
  for (i in ids) {
    file = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    dff = file[complete.cases(file), ]
    corrr = c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}