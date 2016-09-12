#Description: Measurements of electric power consumption 

library(stringr)

#Read file
EPC=read.csv("household_power_consumption.txt",sep=";",dec=".",header = TRUE)

#Configure Date
EPC$fecha=as.Date(EPC$Date,format ="%d/%m/%Y")
p=subset(EPC,fecha>="2007-02-01")
k=subset(p,fecha<="2007-02-02")

#Time
k$Time<-strptime(str_join(k$Date,k$Time), format="%d/%m/%Y %H:%M:%S")


##PLOT3
par(mfcol= c(1,1))
par(cex = 1)
plot(k$Time,k$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(k$Time,k$Sub_metering_2,col="red")
lines(k$Time,k$Sub_metering_3,col="blue")
legend("topright",legend =c("Sub_metering_1,","Sub_metering_2","Sub_metering_3"),text.col =c("black","red","blue"))

#Save Plot 
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
