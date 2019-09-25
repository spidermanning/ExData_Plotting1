#DATA

#load dplyr for transform
library(dplyr)
#read the file, which has fields seperated by ";"
hpcfile<-read.csv2("household_power_consumption.txt")
#subset to two dates in question, Feb 1-2, 2007. Note the file date format is D/M/Y
hpc<-subset(hpcfile,Date %in% c("1/2/2007","2/2/2007"))
#rewrites the Global_Active_power column as numeric, otherwise the wrong values will be read into the histogram
hpc<-transform(hpc,Global_active_power=as.numeric(as.character(Global_active_power)))

#PLOT

#use with to call the hpc data set
#hist function plots a histogram of the values in Global_active_power
#color is set to red and main and xaxis labels changed to match model
with(hpc,hist(Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)"))

#OUTPUT

#save the plot to a new device -- .png file
dev.copy(png,"plot1.png")
#close the device
dev.off()