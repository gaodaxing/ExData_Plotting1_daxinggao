hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpc2day<-subset(hpc,Date=="1/2/2007"|Date=="2/2/2007") #subset data of 1/2/2007 or 2/2/2007
hpc2day$time<-strptime(paste(hpc2day$Date,hpc2day$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
hpcn<-cbind.data.frame(Time=hpc2day$time,apply(hpc2day[,3:9],2,as.numeric))
png(filename = "plot3.png",width=480,height=480)
plot(hpcn$Time,hpcn$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(hpcn$Time,hpcn$Sub_metering_2,type="l",col="red")
lines(hpcn$Time,hpcn$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()

