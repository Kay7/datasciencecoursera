## data downloaded and stored in text file "household.txt"
library(data.table)
a<-fread("household.txt", stringsAsFactors=FALSE, na.strings="?", skip="1/2/2007", nrows=2880, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
a1<-as.data.frame(a)

png(filename="plot1.png")
hist(a1[,3], xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()