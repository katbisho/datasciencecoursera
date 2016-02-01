#load appropriate libraries
library(plyr)
library(ggplot2)

# save files as data frames so that the data can be accessed
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# open png file for saving the plot
png("plot3.png", width=480, height=480)

#subset NEI for Baltimore City, Maryland
Maryland <- subset(NEI, fips == "24510")

#create new dataframe that contains year, type, and the total emissions for Baltimore Maryland
Data <- ddply(Maryland, c("year", "type"), function(df)sum(df$Emissions, na.rm=TRUE))

#graph
ggplot(data = Data, mapping = aes(year, V1, color = type)) + geom_point() + geom_line()

#exit graphics device in order to save graph into file Plot2.R
dev.off()