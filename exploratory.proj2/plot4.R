#load appropriate libraries
library(plyr)
library(ggplot2)

# save files as data frames so that the data can be accessed
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# open png file for saving the plot
png("plot4.png", width=480, height=480)

coalSources <- SCC[grep("^Coal ", SCC$Short.Name, ignore.case=F),"SCC"]

Data <- ddply(NEI[NEI$SCC %in% coalSources,], c("year"), function(df)sum(df$Emissions, na.rm=TRUE))

ggplot(Data, aes(x=year,y=V1)) + geom_line() + geom_point() + xlab('Year')+ ylab('Total Emissions')+ ggtitle('Total Emissions Coal Combustion-related sources')

#exit graphics device in order to save graph into file Plot2.R
dev.off()