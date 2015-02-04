temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
textfile <- unzip(temp)
data <- read.table(textfile,sep=";",header=T,stringsAsFactors = FALSE,na.strings="?")
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(data,data$Date >= '2007-02-01' & data$Date < '2007-02-03')
names(data)[names(data)=="Date"]<- "Datetime"

png(file = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(data$Datetime,data$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power")

plot(data$Datetime,data$Voltage, type="l",
     xlab = "datetime", ylab = "Voltage")

plot(data$Datetime,data$Sub_metering_1, type="l", xlab = "",
      ylab = "Energy sub metering")
 lines(data$Datetime,data$Sub_metering_2, col = "red")
 lines(data$Datetime,data$Sub_metering_3, col = "blue")
 legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        pch=21, cex=0.7, bty = "n",lty=c(1,1,1), col=c("black","red","blue"))

plot(data$Datetime,data$Global_reactive_power, type="l",
     xlab = "datetime", ylab = "Global_reactive_power", lwd = 1)
dev.off()