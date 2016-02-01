# save files as data frames so that the data can be accessed
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# open png file for saving the plot
png("plot1.png", width=480, height=480)

#Sum emissions by year and save in a new data frame called Data
Data<-with (NEI,aggregate(NEI[,'Emissions'],by=list(year), sum, na.rm=TRUE))

#plot graph
plot(Data$Group.1, Data$x, type = "b", xlab = "Year", ylab = "Total Emissions", main = "Total Emissions from all Sources", col = "red")

#close file connections to save graph
dev.off()