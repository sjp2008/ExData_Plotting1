power <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(power, {
  plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
  plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n") 
  plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
})
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()