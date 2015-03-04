data <- read.csv('household_power_consumption.txt', sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))
data$Time <- strptime(paste(data$Date, data$Time), '%d/%m/%Y%H:%M:%S')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
startDate <- as.Date('2007-02-01')
endDate <- as.Date('2007-02-02')
filteredData <- data[data$Date >= startDate & data$Date <= endDate,]

png('plot1.png', width=480, height=480)
par(bg='transparent')
hist(
    filteredData$Global_active_power,
    col='red',
    xlab="Global Active Power (kilowatts)",
    main="Global Active Power"
    )
dev.off()
