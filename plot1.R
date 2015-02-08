data<- read.csv("/Users/vivek/Projects/coursera/ExploratoryDataAnalysis/project1/household_power_consumption.txt", 
                header =TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, strip.white=TRUE)

data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$Date<-NULL
data$Time<-NULL
data$DateTime<- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data<-data[data$DateTime >= strftime("2007-02-01 00:00:00") & data$DateTime < strftime("2007-02-03 00:00:00"),]
data<-na.omit(data)
data$WeekDay<-weekdays(data$DateTime)

png("/tmp/plot1.png")
par(mar=c(4,4,2,2))
hist(data$Global_active_power,col="red", main="Golbal Acitve Power", xlab="Global Active Power (killowatts)")
dev.off()
