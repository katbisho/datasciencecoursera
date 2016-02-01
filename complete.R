complete <- function(directory, id = 1:332)
{
    # directory <- paste("~/Documents/datasciencecoursera/", directory, sep = "")
    setwd(directory)
    
    #number vector stands for how many complete cases are in vector id
    number = vector( length = length(id))
    
    for (i in seq_along(id))
    {
        name <-sprintf("%03d", id[i])
        name <- paste(name, ".csv", sep = "")
        file <- read.csv(name, header = TRUE)
        
        number[i] = sum(complete.cases(file))
        
    }
    
    data.frame(id = id, nobs = number)
}