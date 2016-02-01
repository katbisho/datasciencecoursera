corr <- function(directory, threshold = 0)
{
    #create a data frame that tells how many complete cases there for files in directory
    data <- complete(directory)
    
    nobs <- data[ , "nobs"]
    id <- data[ , "id"]
    
    #find which ids of data frame have nobs > threshold
    good <- nobs > threshold
    id <- id[good]
    x <- vector(mode = "numeric", length = length(id))
    
    for (i in seq_along(id))
    {
        #open desired file given by the number in position i of id vector
        name <- sprintf(fmt = "%03d", id[i])
        name <- paste(name, ".csv", sep="")
        file <- read.csv(name, header = TRUE)

        sulfate <- file[ , "sulfate"]
        nitrate <- file[ , "nitrate"]
        
        x[i] <- cor(sulfate, nitrate, use = "complete.obs")
    }
    
    x
}