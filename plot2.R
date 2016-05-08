hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
hpc2day<-subset(hpc,Date=="1/2/2007"|Date=="2/2/2007") #subset data of 1/2/2007 or 2/2/2007
hpc2day$time<-strptime(paste(hpc2day$Date,hpc2day$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
hpcn<-cbind.data.frame(Time=hpc2day$time,apply(hpc2day[,3:9],2,as.numeric))
plot(hpcn$Time,hpcn$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
