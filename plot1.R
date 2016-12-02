plot1 <- function(){
  DataClasses <- c("character", NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" )
  dataConsuption <- read.table("household_power_consumption.txt", header= T, sep = ";",na.strings = "?", colClasses = DataClasses)
  dataConsuption$Date <-as.Date(dataConsuption$Date, format = "%d/%m/%Y") 
  BaseDados <- dataConsuption[dataConsuption$Date >= "2007-02-01",]
  BaseDados <- BaseDados[BaseDados$Date <= "2007-02-02",]
  png("plot1.png", width=480, height=480)
  hist(BaseDados$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}