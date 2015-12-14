library(data.table)
DT<-fread("household_power_consumption.txt")
DT<- subset(DT, Date %in% c("1/2/2007", "2/2/2007"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT$Time<-as.POSIXct(paste(DT$Date, DT$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(DT$Global_active_power, ylab="Global Active Power (kilowatts)", type = "l", xaxt="n", xlab = "")
timetot <-length(DT$Global_active_power)
axis(1, at=c(1,timetot/2,timetot),lab=c("Thu","Fri","Sat"))

dev.off()
