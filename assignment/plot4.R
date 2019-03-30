# Reading the values only corresponding to the required dates
data<-read.table("household_power_consumption.txt", sep = ";",na.strings = "?",skip = 66636,
                 nrows = 2880)
# setting the column names for the data as given
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
               "Global_intensity" ,"Sub_metering_1","Sub_metering_2","Sub_metering_3")
# joining the date and time variable as strings
x<-paste(data[,1],data[,2],sep = ":")
# converting to POXISct format
x<-strptime(x,"%d/%m/%Y:%H:%M:%S")
# setting parameters for the plot
par(mfrow = c(2,2), mar = c(4,4,2,4))
# plotting, labelling and setting legends for all 4 plots required
plot(x,data$Global_active_power,type = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(x,data$Global_active_power)
plot(x,data$Voltage,type = "n", xlab = "datetime",
     ylab = "Voltage")
lines(x,data$Voltage)
plot(x,data$Sub_metering_1,type = "n", xlab = "",
     ylab = "Energy Sub Metering")
lines(x,data$Sub_metering_1, col = "black")
lines(x,data$Sub_metering_2, col = "red")
lines(x,data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty =c(1,1,1),cex = 0.4)
plot(x,data$Global_reactive_power,type = "n", xlab = "datetime",
     ylab = "Global_reactive_power")
lines(x,data$Global_reactive_power)
#copying to png and saving
dev.copy(png, "plot4.png")
dev.off()

