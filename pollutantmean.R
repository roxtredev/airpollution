## Part 1:  Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
## across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
## and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from 
## the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the 
## monitors, ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ##    *****************   INPUTS *********************
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files.
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used.
  
  ## Stackoverflow consulted.
  
  ##    *****************  OUTPUTS  *********************
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the results!
  
  ##  ****   CODE  *********
  ## Based on 'getting 'directory' I will get the path of the files where I can get 
  ## the information.
  path <- getwd()
  directory <- paste(path, "/", directory, "/", sep = "")
  
  ## All files needed to apply the questions.
  all_files <- list.files(directory)
  
  ## Going through all the files.
  data <- NA
  for (i in id) {
    dir <- paste(directory, all_files[i], sep = "")
    file_data <- read.csv(dir)
    
    data <- rbind(data, file_data)
  }
  mean(data[[pollutant]], na.rm = TRUE)
}