plot3 <- function() {
  data <- read.table("../data/household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  variables <- colnames(data)
  consumption <- read.table("../data/household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=variables)
  consumption[,1] <- as.Date(consumption[,1],"%d/%m/%Y")
  cDate <- consumption$Dat
  cTime <- consumption$Time
  consumption[,10] <- as.POSIXct(paste(cDate, cTime), "%d/%m/%Y %H:%M:%S")
  png(file="../output/plot3.png")
  cV10 <- consumption$V10
  csm1 <- consumption$Sub_metering_1
  csm2 <- consumption$Sub_metering_2
  csm3 <- consumption$Sub_metering_3
  plot(cV10, csm1, type="l", xlab="", ylab="Energy sub metering")
  points(cV10, csm2, type="l", col="red")
  points(cV10, csm3, type="l", col="blue")
  legend("topright", col=c("black","red","blue"), lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}
