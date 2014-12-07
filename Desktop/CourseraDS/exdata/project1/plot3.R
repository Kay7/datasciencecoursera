## data downloaded and stored in text file "household.txt"
library(data.table)
a<-fread("household.txt", stringsAsFactors=FALSE, na.strings="?", skip="1/2/2007", nrows=2880, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
h<-fread("household.txt", stringsAsFactors=FALSE, na.strings="?", nrows=2)
col_names<-names(h)
names(a)<-col_names
a1<-as.data.frame(a)

p<-paste(a1[,1], a1[,2])
datetime<-strptime(p, format="%d/%m/%Y %H:%M:%S")
a2<-cbind(datetime, a1)

png(filename="plot3.png")
with(a2, { plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
           lines(datetime, Sub_metering_2, col="red")
           lines(datetime, Sub_metering_3, col="blue")
           legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
         })
dev.off()
          