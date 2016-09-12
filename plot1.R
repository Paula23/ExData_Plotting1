#Description: Measurements of electric power consumption 

library(stringr)

#Read file 
EPC=read.csv("household_power_consumption.txt",sep=";",dec=".",header = TRUE)

#Date
EPC$fecha=as.Date(EPC$Date,format ="%d/%m/%Y")
p=subset(EPC,fecha>="2007-02-01")
k=subset(p,fecha<="2007-02-02")


#Plot1
par(mfcol= c(1,1))
hist(as.numeric(as.character(k$Global_active_power)), main = "Global Active Power", 
     col = "red", xlab= "Global Active Power (kilowatts)")

#Save Plot 
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()