
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

par(mfrow=c(2,2), mar = c(3.9,4,2,1))
#Plotting plot1
with(Data1,plot(Datetime,as.numeric(Global_active_power),type = "l", xlab = "", 
                ylab = "Global Active Power"))
#Plotting plot2
with(Data1,plot(Datetime,as.numeric(Voltage),type = "l", xlab = "dateline", 
                ylab = "Voltage"))
#Plotting plot3
with(Data1,plot(Datetime,as.numeric(Sub_metering_1),type = "l", xlab = "", 
                ylab = "Energy sub metering"))
with(Data1,lines(Datetime,as.numeric(Sub_metering_2),col="red"))
with(Data1,lines(Datetime,as.numeric(Sub_metering_3),col="blue"))
legend("topright",lty=1, cex = 0.6,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plotting plot3
with(Data1,plot(Datetime,as.numeric(Global_reactive_power),type = "l", xlab = "dateline", 
                ylab = "Global_reactive_power"))


dev.copy(png,file="Plot4.png",width= 480,height=480,units="px")
dev.off() 