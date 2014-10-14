
d <- read.table("household_power_consumption.txt", header=TRUE,
                sep=";", colClasses="character")

d$Date <- as.Date(d$Date, "%d/%m/%Y")

x <- subset(d, as.Date("01/02/2007", "%d/%m/%Y") <= Date & Date <= as.Date("02/02/2007", "%d/%m/%Y"))
time <- paste(as.character.Date(x$Date, "%Y-%m-%d"), x$Time)
time <- strptime(time, format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(time, as.numeric(x$Global_active_power), type="l", ylab="Global Active Power")
plot(time, as.numeric(x$Voltage), type="l", ylab="Voltage", xlab="datetime")
plot(time, as.numeric(x$Sub_metering_1), type="l", 
     xlab="", ylab="Energy sub metering",
     col="black")
lines(time, as.numeric(x$Sub_metering_2),
      col="red")
lines(time, as.numeric(x$Sub_metering_3),
      col="blue")

legend("topright", tail(names(x),3), col=c("black","red","blue"),
       lty=1, bty="n")
plot(time, as.numeric(x$Global_reactive_power), type="l",ylab="Global_reactive_power",
     xlab="datetime")
dev.off()




