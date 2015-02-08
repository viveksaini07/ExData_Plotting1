data<- read.csv("/Users/vivek/Projects/coursera/ExploratoryDataAnalysis/project1/household_power_consumption.txt", 
                header =TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, strip.white=TRUE)

data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$Date<-NULL
data$Time<-NULL
data$DateTime<- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data<-data[data$DateTime >= strftime("2007-02-01 00:00:00") & data$DateTime < strftime("2007-02-03 00:00:00"),]
data<-na.omit(data)
data$WeekDay<-weekdays(data$DateTime)

png("/tmp/plot3.png")

par(mar=c(4,4,0,0))
with(data, plot(DateTime,Sub_metering_1, type="n", ylab="Energy sub metering"))
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1),co=c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
