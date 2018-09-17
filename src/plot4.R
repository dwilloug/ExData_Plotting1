plot4 <- function() {
  data <- read.table("../data/household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  variables <- colnames(data)
  consumption <- read.table("../data/household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=variables)
  consumption[,1] <- as.Date(consumption[,1],"%d/%m/%Y")
  consumption[,10] <- as.POSIXct(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")
  png(file="../output/plot4.png")
  par(mfrow=c(2,2))
  cV10 <- consumption$V10
  cGlobalPower <- consumption$Global_active_power
  cVoltage <- consumption$Voltage
  csm1 <- consumption$Sub_metering_1
  csm2 <- consumption$Sub_metering_2
  csm3 <- consumption$Sub_metering_3
  with(consumption, {
    plot(cV10, cGlobalPower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(cV10, cVoltage, type="l", ylab="Voltage", xlab="datetime")
    plot(cV10, csm1, type="l", xlab="", ylab="Energy sub metering")
    points(cV10, csm2, type="l", col="red")
    points(cV10, csm3, type="l", col="blue")
    legend("topright", bty="n", col=c("black","red","blue"), lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(cV10, cGlobalPower, type="l", ylab="Global_reactive_power", xlab="datetime")
  })
  dev.off()
}
