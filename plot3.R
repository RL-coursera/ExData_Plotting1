options(scipen=999)
setwd("/Users/robert/Documents")
data_power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_power <- subset(data_power, Date %in% c("1/2/2007","2/2/2007"))
data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_power$Date), data_power$Time)
data_power$Datetime <- as.POSIXct(datetime)
png("/Users/robert/Documents/plot3.png", width=480, height=480)
with(data_power, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()