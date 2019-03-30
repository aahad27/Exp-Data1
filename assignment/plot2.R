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
# forming the plot of the required variables
plot(x,data$Global_active_power,type = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)")
#plotting lines to join each variable pair 
lines(x,data$Global_active_power)
#copying and saving the plot as a png
dev.copy(png,"plot2.png")
dev.off()