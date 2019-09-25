#DATA

#load dplyr for mutate
library(dplyr)
#read the file, which has fields seperated by ";"
hpcfile<-read.csv2("household_power_consumption.txt")
#subset to two dates in question, Feb 1-2, 2007. Note the file date format is D/M/Y
hpc<-subset(hpcfile,Date %in% c("1/2/2007","2/2/2007"))
#creates new column in the dataset to serve as the xaxis with date and time
#the existing date and time columns are concactenated via paste, then converted to POSIXct
hpcdate<-mutate(hpc,datetime=as.POSIXct(paste(as.character(Date),as.character(Time),sep="."),format="%d/%m/%Y.%H:%M:%S"))

#PLOT

#use with function to plot using the hpcdate data
#plot specified as type "l" will draw a line graph
#dependent variable (xaxis) is time as created in new datetime column
#independent variable (yaxis) is active power
#use x and y lab to change the labels to match the model
#formatting the date time column in POSIXct automatically creates the Thu/Fri/Sat labels
with(hpcdate,plot(datetime,as.numeric(as.character(Global_active_power)),type="l",xlab = "",ylab = "Global Active Power (kilowatts)"))

#OUTPUT

#save the plot to a new device -- .png file
dev.copy(png,"plot2.png")
#close the device
dev.off()