power <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S") 
plot(power$DateTime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, type="l", col="red")
lines(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 580, height = 480, units = "px")
dev.off()