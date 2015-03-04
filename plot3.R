data <- read.csv('household_power_consumption.txt', sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))
data$Time <- strptime(paste(data$Date, data$Time), '%d/%m/%Y%H:%M:%S')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
startDate <- as.Date('2007-02-01')
endDate <- as.Date('2007-02-02')
filteredData <- data[data$Date >= startDate & data$Date <= endDate,]

png('plot3.png', width=480, height=480)
par(bg='transparent')

plot(
    filteredData$Time,
    filteredData$Sub_metering_1,
    xlab='',
    ylab='Energy sub metering',
    type='n'
)

legend('topright', lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

lines(
    filteredData$Time,
    filteredData$Sub_metering_1,
    col='black'
)

lines(
    filteredData$Time,
    filteredData$Sub_metering_2,
    col='red'
)

lines(
    filteredData$Time,
    filteredData$Sub_metering_3,
    col='blue'
)
dev.off()
