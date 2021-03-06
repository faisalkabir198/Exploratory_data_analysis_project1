temp<-"datafile.txt"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp,method="libcurl")
data<-read.table(unz(temp,"household_power_consumption.txt"),sep=";",header=TRUE)
data[] <- lapply(data, as.character)
data$asDate<- as.Date(data$Date,format="%d/%m/%Y")
subdata<- subset(data,asDate>="2007-02-01"& asDate<="2007-02-02")
subdata$DT <- paste(subdata$Date, subdata$Time, sep=" ")
subdata$asDT <- strptime(subdata$DT, format="%d/%m/%Y %H:%M:%S")
png("plot4.png",  width = 480, height = 480)
par(mfrow=c(2,2))
plot(subdata$asDT,subdata$Global_active_power, type="l",ylab="Global Active Power",xlab="")
plot(subdata$asDT, subdata$Voltage, type="l",ylab="Voltage",xlab="datetime")
plot(subdata$asDT,subdata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(subdata$asDT,subdata$Sub_metering_2,col="red")
lines(subdata$asDT,subdata$Sub_metering_3,col="blue")
legend(x="topright",y=28,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),bty='n')
plot(subdata$asDT,subdata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()