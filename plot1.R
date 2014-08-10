##Read the data into R, and give the data frame column names.
data<-read.table("household_power_consumption.txt", sep=";",skip= 66637, nrow=2880)
cN<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrow=1)
colnames(data)<-colnames(cN)

##Add a new column to data with Date and Time combined as.POSIXlt
D<-data$Date
D_asDate<-as.Date(D,"%d/%m/%Y")
combDateTime<-paste(D_asDate,data$Time)
p<-as.POSIXlt(combDateTime)
data$DateTime<-p

##Create a histogram on the screen
library(datasets)
par(mfrow=c(1,1),mar=c(5,4,4,2))
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",cex.lab=0.75, cex.axis=0.75,col="red")

##Copy to a PNG file with width 480 pixels and height 480 pixels
dev.copy(png,"plot1.png", width=480,height=480)
dev.off()

