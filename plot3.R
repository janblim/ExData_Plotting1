library(data.table)
DT<-fread("household_power_consumption.txt")
DT<- subset(DT, Date %in% c("1/2/2007", "2/2/2007"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT$Time<-as.POSIXct(paste(DT$Date, DT$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(DT$Sub_metering_1, ylab="Energy sub metering", type = "l", xaxt="n", xlab = "")
lines(DT$Sub_metering_2, col = "red")
lines(DT$Sub_metering_3, col = "blue")
timetot <-length(DT$Global_active_power)
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
axis(1, at=c(1,timetot/2,timetot),lab=c("Thu","Fri","Sat"))

dev.off()