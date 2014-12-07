rm(list=ls())
library(lubridate)
library(datasets)
setwd("/Users/himabindu/Desktop/coursera/data") 

## reading the data
data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE)
data$Date<-as.Date(data$Date,"%d/%m/%Y") ## formatting the date
date1 = as.Date("01/02/2007","%d/%m/%Y")
print(date1)
date2 = as.Date("02/02/2007","%d/%m/%Y")
print(date2)

## subsetting the data as per dates asked
subdata<-data[(data$Date == date1  | data$Date == date2) ,]
class(subdata$Global_active_power)
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

##plotting 
png(filename="plot1.png",width=480,height=480)
hist(subdata$Global_active_power,main="GLOBAL ACTIVE POWER" ,xlab = "Global Active Power(kilowatts)" ,col= "red")
dev.off()


