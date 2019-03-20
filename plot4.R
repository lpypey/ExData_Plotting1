
## Read textfile from workfolder
textfile <- "./household_power_consumption.txt"

## Load textfile in table
tabel <- read.table(textfile, header=TRUE, sep=";", stringsAsFactors = FALSE)

## select data betwen 1/2/2007 and 2/2/2007
subsettabel <- tabel[tabel$Date %in% c("1/2/2007", "2/2/2007") ,] 

# make data numerisource
globalactivepower <- as.numeric(subsettabel$Global_active_power)
voltage <- as.numeric(subsettabel$Voltage)
submetering1 <- as.numeric(subsettabel$Sub_metering_1)
submetering2 <- as.numeric(subsettabel$Sub_metering_2)
submetering3 <- as.numeric(subsettabel$Sub_metering_3)
globalreactivepower <- as.numeric(subsettabel$Global_reactive_power)

# create date+time column seperated by a space  " "
datetime <- strptime(paste(subsettabel$Date, subsettabel$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Create png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, globalactivepower, type="l", xlab=" ", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")


plot(datetime, submetering1, type="l", xlab=" ", ylab="Energy sub metering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")


# Close graphics device png
dev.off()