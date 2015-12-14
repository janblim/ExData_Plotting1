library(data.table)
DT<-fread("household_power_consumption.txt")
DT<- subset(DT, Date %in% c("1/2/2007", "2/2/2007"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT$Time<-as.POSIXct(paste(DT$Date, DT$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot1.png", width = 480, height = 480)

hist(as.numeric(DT$Global_active_power), col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()