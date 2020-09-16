complete <- function(directory, id = 1:332) {
  
  ##  ****   CODE  *********
  ## Based on 'getting 'directory' I will get the path of the files where I can get 
  ## the information.
  path <- getwd()
  directory <- paste(path, "/", directory, "/", sep = "")
  idd <- id
  
  ## All files needed to apply the questions.
  all_files <- list.files(directory)
  
  df <- data.frame()
  comp_cases <- 0
  df2 <- 0
  
  for (i in 1:length(idd)) {
    
    file <- paste(directory, all_files[i], sep = "")
    file_data <- read.csv(file)
    
    comp_cases[i] <- sum(complete.cases(file_data))
    id = idd[i]
    cc2 = comp_cases[[i]]
    df2 <- rbind(df2, data.frame(id,cc2))
  }
  print(df2)
}