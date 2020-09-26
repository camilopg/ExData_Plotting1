##Plot3
#read data
luz<-read.table("household_power_consumption.txt", header= TRUE,sep=";",
                stringsAsFactors=FALSE, dec=".")
#We will only be using data from the dates 2007-02-01 and 2007-02-02
subsetdata <- luz[luz$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

#plot Global Active Power 2
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Save plot
dev.copy(png, "plot3.png",
         width  = 480,
         height = 480)
#close device
dev.off()