#load appropriate libraries
library(plyr)

# save files as data frames so that the data can be accessed
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# open png file for saving the plot
png("plot2.png", width=480, height=480)

#subset data to only include emissions from Baltimore City, Maryland
Maryland <- subset(NEI, fips == "24510")

#find total emissions based on year in Baltimore City, Maryland
Data<-with (Maryland,aggregate(Maryland[,'Emissions'],by=list(year), sum, na.rm=TRUE))

#plot
plot(Data$Group.1, Data$x, type = "b", xlab = "Year", ylab = "Total Emissions in Baltimore City", main = "Total Emissions in Baltimore City by Year", col = "blue")

#exit graphics device in order to save graph into file Plot2.R
dev.off()
