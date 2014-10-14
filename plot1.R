## PLOT 01

## reading data
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## subsetting
subdata<-data[data$Date == "1/2/2007" | data$Date ==  "2/2/2007",]

## plotting
png(filename='plot1.png', width = 480, height = 480)
hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()