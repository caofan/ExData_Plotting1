d <- read.table("household_power_consumption.txt", header=TRUE,
                sep=";", colClasses="character")

d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$Global_active_power <- as.numeric(d$Global_active_power)

x <- subset(d, as.Date("01/02/2007", "%d/%m/%Y") <= Date & Date <= as.Date("02/02/2007", "%d/%m/%Y"))
png(filename="plot3.png")

time <- paste(as.character.Date(x$Date, "%Y-%m-%d"), x$Time)
time <- strptime(time, format="%Y-%m-%d %H:%M:%S")
plot(time, as.numeric(x$Sub_metering_1), type="l", 
     xlab="", ylab="Energy sub metering",
     col="black")
lines(time, as.numeric(x$Sub_metering_2),
     col="red")
lines(time, as.numeric(x$Sub_metering_3),
     col="blue")

legend("topright", tail(names(x),3), col=c("black","red","blue"),
       lty=1, bty="o")

dev.off()



