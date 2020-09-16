complete <- function(directory, id = 1:332) {
  
  ##  *********************   CODE  **********************************************
  ## Based on 'getting 'directory' I will get the path of the files where 
  ## I can get the information.
  
  path <- getwd()
  directory <- paste(path, "/", directory, "/", sep = "")

  ## All files needed to apply the questions.
  all_files <- list.files(directory)
  
  idd <- vector()
  nobs <- vector()

  for (i in id) {
    dir <- paste(directory, all_files[i], sep = "")
    file_data <- read.csv(dir)
    
    idd = c(idd,i)
    
    ## complete.cases:  Return a logical vector indicating which cases are 
    ## complete, i.e., have no missing values.
    nobs = c(nobs,sum(complete.cases(file_data)))        
  }
  
  # Finally, Create the data frame using the vectors and return it
  data.frame(id = idd, nobs = nobs)
}