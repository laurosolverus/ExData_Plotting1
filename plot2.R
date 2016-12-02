plot2 <- function(){
  DataClasses <- c("character", NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" )
  dataConsuption <- read.table("household_power_consumption.txt", header= T, sep = ";",na.strings = "?", colClasses = DataClasses)
  dataConsuption$Date <-as.Date(dataConsuption$Date, format = "%d/%m/%Y")
  BaseDados <- dataConsuption[dataConsuption$Date >= "2007-02-01",]
  BaseDados <- BaseDados[BaseDados$Date <= "2007-02-02",]
  datetime <- paste(as.Date(BaseDados$Date), BaseDados$Time)
  BaseDados$Datetime <- as.POSIXct(datetime)
  png("plot2.png", width=480, height=480)
  plot(BaseDados$Datetime,BaseDados$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}