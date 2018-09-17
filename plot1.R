plot1 <- function() {
  data <- read.table("../data/household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  variables <- colnames(data)
  consumption <- read.table("../data/household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=variables)
  png(file="../output/plot1.png")
  hist(consumption$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}
