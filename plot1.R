##Plot1
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

#plot Global Active Power
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
#Save plot
dev.copy(png, "plot1.png",
         width  = 480,
         height = 480)
#close device
dev.off()
