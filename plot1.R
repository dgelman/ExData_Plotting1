temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
textfile <- unzip(temp)
data <- read.table(textfile,sep=";",header=T,stringsAsFactors = FALSE,na.strings="?")
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(data,data$Date >= '2007-02-01' & data$Date < '2007-02-03')
names(data)[names(data)=="Date"]<- "Datetime"

png(file = "plot1.png",width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()