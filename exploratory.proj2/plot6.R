#load appropriate libraries
library(plyr)
library(ggplot2)

# save files as data frames so that the data can be accessed
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# open png file for saving the plot
png("plot6.png", width=480, height=480)

#subset data to only include motor vehicles from LA and Baltimore City (year, fip, and sum emissions)
motor <- subset(NEI, ((fips == "24510") | (fips == "06037")) & (type == "ON-ROAD"))
Data <- ddply(motor, c("year", "fips"), function(df)sum(df$Emissions, na.rm=TRUE))
#baltimore <- subset(Data, (year == "1999") & (fips == "24510"))
#la <- subset(Data, (year == "1999") & (fips == "06037"))

#plot
ggplot(data = Data, mapping = aes(year, log(V1), color = fips)) + geom_point() + geom_line()

#exit graphics device in order to save graph into file Plot2.R
dev.off()