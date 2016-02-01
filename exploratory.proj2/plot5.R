#load appropriate libraries
library(ggplot2)

# save files as data frames so that the data can be accessed
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# open png file for saving the plot
png("plot5.png", width=480, height=480)

motor <- subset(NEI, (fips == "24510") & (type == "ON-ROAD"))

Data<-with (motor,aggregate(motor[,'Emissions'],by=list(year), sum, na.rm=TRUE))

ggplot(Data, aes(x = Group.1, y = x)) + geom_line() + geom_point() + xlab('Year')+ ylab('Total Emissions')+ ggtitle('Total Emissions Motor Vehicles in Baltimore City')

#exit graphics device in order to save graph into file Plot2.R
dev.off()