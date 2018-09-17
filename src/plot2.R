plot2 <- function() {
  data <- read.table("../data/household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  variables <- colnames(data)
  consumption <- read.table("../data/household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=variables)
  consumption[,1] <- as.Date(consumption[,1],"%d/%m/%Y")
  cDate <- consumption$Date
  cTime <- consumption$Time
  consumption[,10] <- as.POSIXct(paste(cDate, cTime), "%d/%m/%Y %H:%M:%S")
  png(file="../output/plot2.png")
  cV10 <- consumption$V10
  cGlobalPower <- consumption$Global_active_power
  plot(cV10, cGlobalPower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}
