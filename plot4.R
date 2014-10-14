## PLOT 04

## reading data
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## subsetting 
subdata<-data[data$Date == "1/2/2007" | data$Date ==  "2/2/2007",]
dmerge<-paste(subdata$Date,subdata$Time)
dmerge<-strptime(dmerge,"%d/%m/%Y %T")

## creating png file for 4 graphs in 1 plot
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

## graph 01
plot(dmerge,subdata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(dmerge,subdata$Global_active_power)

## graph 02
plot(dmerge,subdata$Voltage,ylab="Voltage",xlab="datetime",type="n")
lines(dmerge,subdata$Voltage)

## graph 03
plot(dmerge,subdata$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
lines(dmerge,subdata$Sub_metering_1)
lines(dmerge,subdata$Sub_metering_2,col="red")
lines(dmerge,subdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

## graph 04
plot(dmerge,subdata$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="n")
lines(dmerge,subdata$Global_reactive_power)

dev.off()
