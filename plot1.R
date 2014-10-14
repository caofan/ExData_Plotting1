d <- read.table("household_power_consumption.txt", header=TRUE,
                sep=";", colClasses="character")

d$Date <- as.character(d$Date)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$Time <- as.character(d$Time)
d$Global_active_power <- as.numeric(d$Global_active_power)

x <- subset(d, as.Date("01/02/2007", "%d/%m/%Y") <= Date & Date <= as.Date("02/02/2007", "%d/%m/%Y"))
png(filename="plot1.png")
hist(x$Global_active_power, round(max(x$Global_active_power) / 0.5), col="red",
          xlab = "Global Active Power (kilowatts)",
          ylab = "Frequency", main="Global Active Power",
     axes=FALSE)
axis(1, at=c(0,2,4,6), labels=c(0,2,4,6))
axis(2, at=seq(0,1200,200), labels = seq(0,1200,200))


dev.off()
