#Description: Measurements of electric power consumption 

library(stringr)

#Read file 
EPC=read.csv("household_power_consumption.txt",sep=";",dec=".",header = TRUE)

#Date
EPC$fecha=as.Date(EPC$Date,format ="%d/%m/%Y")
p=subset(EPC,fecha>="2007-02-01")
k=subset(p,fecha<="2007-02-02")

#Time
k$Time<-strptime(str_join(k$Date,k$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 2
plot(k$Time,k$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Save Plot 
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
