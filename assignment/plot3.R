# Reading the values only corresponding to the required dates
data<-read.table("household_power_consumption.txt", sep = ";",na.strings = "?",skip = 66636,
                 nrows = 2880)
# setting the column names of the data as given
names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
               "Global_intensity" ,"Sub_metering_1","Sub_metering_2","Sub_metering_3")
# joining the date and time variables as strings
x<-paste(data[,1],data[,2],sep = ":")
# converting to POXISct format
x<-strptime(x,"%d/%m/%Y:%H:%M:%S")
# froming plot for the required variables
plot(x,data$Sub_metering_1,type = "n", xlab = "",
     ylab = "Energy Sub Metering")
#plotting all three variables vs the time
lines(x,data$Sub_metering_1, col = "black")
lines(x,data$Sub_metering_2, col = "red")
lines(x,data$Sub_metering_3, col = "blue")
# giving apropriate legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty =c(1,1,1),cex = 0.8)
# coying to png file and saving
dev.copy(png,"plot3.png")
dev.off()