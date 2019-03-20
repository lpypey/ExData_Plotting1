## Read textfile from workfolder
textfile <- "./household_power_consumption.txt"

## Load textfile in table
tabel <- read.table(textfile, header=TRUE, sep=";", stringsAsFactors = FALSE)

## select data betwen 1/2/2007 and 2/2/2007
subsettabel <- tabel[tabel$Date %in% c("1/2/2007", "2/2/2007") ,] 

# make data numerisource(plot1.Rc
globalactivepower <- as.numeric(subsettabel$Global_active_power)

# create date+time column seperated by a space  " "
datetime <- strptime(paste(subsettabel$Date, subsettabel$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Create png file
png("plot2.png", width=480, height=480)

# print line graph with type line ("l")
plot(datetime, globalactivepower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

# Close graphics device png
dev.off()