d <- read.table("household_power_consumption.txt", header=TRUE,
                sep=";", colClasses="character")

d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$Global_active_power <- as.numeric(d$Global_active_power)

x <- subset(d, as.Date("01/02/2007", "%d/%m/%Y") <= Date & Date <= as.Date("02/02/2007", "%d/%m/%Y"))
png(filename="plot2.png")
time <- paste(as.character.Date(x$Date, "%Y-%m-%d"), x$Time)
time <- strptime(time, format="%Y-%m-%d %H:%M:%S")
plot(time, x$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")



dev.off()

