rm(list=ls())
library(lubridate)
library(datasets)

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
subdata$z <-strptime(subdata$x, "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

#plotting
png(filename="ExData_Plotting1/figure/plot2.png",width=480,height=480)
plot(subdata$z,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
