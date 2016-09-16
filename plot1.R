temp<-"datafile.txt"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp,method="libcurl")
data<-read.table(unz(temp,"household_power_consumption.txt"),sep=";",header=TRUE)
data[] <- lapply(data, as.character)
data$asDate<- as.Date(data$Date,format="%d/%m/%Y")
subdata<- subset(data,asDate>="2007-02-01"& asDate<="2007-02-02")
png("plot1.png",  width = 480, height = 480)
with(data,hist(as.numeric(subdata$Global_active_power),col="red",main= "Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()