## Read textfile from workfolder
textfile <- "./household_power_consumption.txt"

## Load textfile in table
tabel <- read.table(textfile, header=TRUE, sep=";", stringsAsFactors = FALSE)

## select data betwen 1/2/2007 and 2/2/2007
subsettabel <- tabel[tabel$Date %in% c("1/2/2007", "2/2/2007") ,] 

# make data numerisource(plot1.Rc
globalactivepower <- as.numeric(subsettabel$Global_active_power)

# Create png file
png("plot1.png", width=480, height=480)

# print histogram
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close graphics device png
dev.off()