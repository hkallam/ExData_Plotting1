rm(list=ls())
library(lubridate)
library(datasets)
setwd("/Users/himabindu/Desktop/coursera/data")
data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE)
data$Date1<-as.Date(data$Date,"%d/%m/%Y")


#To filter on the following dates
date1 = as.Date("01/02/2007","%d/%m/%Y")
print(date1)
date2 = as.Date("02/02/2007","%d/%m/%Y")
print(date2)
subdata<-data[(data$Date1 == date1  | data$Date1 == date2) ,]

## combining the date and time columns
subdata$x<-paste(subdata$Date, subdata$Time)

## applied strptime on the combined column
subdata$datetime <-strptime(subdata$x, "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

#plotting
png(filename="plot3.png",width=480,height=480)
with(subdata,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(subdata,lines(datetime,Sub_metering_2,type="l",col="red"))
with(subdata,lines(datetime,Sub_metering_3,type="l",col="blue"))
## describing the plotting
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,lty=1,col=c("black","red","blue"))
dev.off()