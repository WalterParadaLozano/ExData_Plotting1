
#load libraries

library(dplyr)
library(ggplot2)
library(datasets)
library(lattice)

#Load Data

Data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE)
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
Data1 <- subset(Data, Date == "2007-02-01" | Date == "2007-02-02")
Datetime <- strptime(paste(Data1$Date,as.character(Data1$Time)),"%Y-%m-%d %H:%M:%S")

#Plotting plot1

with(Data1,hist(as.numeric(Global_active_power),main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(png,file="Plot1.png",width= 480,height=480,units="px")
dev.off() 

