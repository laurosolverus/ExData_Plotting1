plot4 <- function(){
  DataClasses <- c("character", NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" )
  dataConsuption <- read.table("household_power_consumption.txt", header= T, sep = ";",na.strings = "?", colClasses = DataClasses)
  dataConsuption$Date <-as.Date(dataConsuption$Date, format = "%d/%m/%Y")
  BaseDados <- dataConsuption[dataConsuption$Date >= "2007-02-01",]
  BaseDados <- BaseDados[BaseDados$Date <= "2007-02-02",]
  datetime <- paste(as.Date(BaseDados$Date), BaseDados$Time)
  BaseDados$Datetime <- as.POSIXct(datetime)
  
  png("plot4.png", width=480, height=480)
  
  par(mfcol= c(2,2))
  
  
  plot(BaseDados$Datetime,BaseDados$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

  with(BaseDados, plot(Datetime, Sub_metering_1 , type="l", ylab="Energy sub metering", xlab=""))
  lines(BaseDados$Datetime, BaseDados$Sub_metering_2 ,col='Red')
  lines(BaseDados$Datetime, BaseDados$Sub_metering_3,col='Blue')
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
  
  #voltage~Datetime
  plot(BaseDados$Datetime, BaseDados$Voltage, type="l", xlab = "datetime", ylab = "Voltage" )
  
  #Global_reactive_power~Datetime
  plot(BaseDados$Datetime, BaseDados$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power" )
  
  dev.off()
}