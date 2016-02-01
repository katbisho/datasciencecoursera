pollutantmean <- function(directory, pollutant, id = 1:332)
{
    # set working directory where you can open up the correct files
    setwd(directory)
    
    for(i in seq_along(id))
    {
        #open desired file given by the number in position i of id vector
        name <- sprintf(fmt = "%03d", id[i])
        name <- paste(name, ".csv", sep="")
        file <- read.csv(name, header = TRUE)
        
        if (i == 1)
        {
            x <- file[ , pollutant]
        }
        else
        {
            y <- file[ , pollutant]
            x <- c(x, y)
        }
    }
    
    mean(x, na.rm = TRUE)
}