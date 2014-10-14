## PLOT 02
## reading data
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## subsetting 
subdata<-data[data$Date == "1/2/2007" | data$Date ==  "2/2/2007",]
dmerge<-paste(subdata$Date,subdata$Time)
dmerge<-strptime(dmerge,"%d/%m/%Y %T")

## plotting
png(filename="plot2.png",width=480,height=480)
plot(dmerge,subdata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(dmerge,subdata$Global_active_power)
dev.off()