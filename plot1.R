options(scipen=999)
setwd("/Users/robert/Documents")
data_power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_power <- subset(data_power, Date %in% c("1/2/2007","2/2/2007"))
data_power$Date <- as.Date(power$Date, format="%d/%m/%Y")
png("/Users/robert/Documents/plot1.png", width=480, height=480)
hist(data_power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()