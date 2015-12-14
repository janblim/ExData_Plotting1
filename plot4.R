library(data.table)
DT<-fread("household_power_consumption.txt")
DT<- subset(DT, Date %in% c("1/2/2007", "2/2/2007"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT$Time<-as.POSIXct(paste(DT$Date, DT$Time), format = "%Y-%m-%d %H:%M:%S")


png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(DT$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l", xaxt="n", xlab = "")
timetot <-length(DT$Global_active_power)
axis(1, at=c(1,timetot/2,timetot),lab=c("Thu","Fri","Sat"))

plot(DT$Voltage, ylab="Voltage", type = "l", xaxt="n", xlab = "datetime")
axis(1, at=c(1,timetot/2,timetot),lab=c("Thu","Fri","Sat"))

plot(DT$Sub_metering_1, ylab="Energy sub metering", type = "l", xaxt="n", xlab = "")
lines(DT$Sub_metering_2, col = "red")
lines(DT$Sub_metering_3, col = "blue")
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
axis(1, at=c(1,timetot/2,timetot),lab=c("Thu","Fri","Sat"))

plot(DT$Global_reactive_power, ylab="Global_reactive_power", type = "l", xaxt="n", xlab = "datetime")
axis(1, at=c(1,timetot/2,timetot),lab=c("Thu","Fri","Sat"))

dev.off()
