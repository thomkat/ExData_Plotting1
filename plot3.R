## PLOT 03

## reading data
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## subsetting 
subdata<-data[data$Date == "1/2/2007" | data$Date ==  "2/2/2007",]
dmerge<-paste(subdata$Date,subdata$Time)
dmerge<-strptime(dmerge,"%d/%m/%Y %T")

## plotting
png(filename="plot3.png",width=480,height=480)
plot(dmerge,subdata$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
lines(dmerge,subdata$Sub_metering_1)
lines(dmerge,subdata$Sub_metering_2,col="red")
lines(dmerge,subdata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)

dev.off()
