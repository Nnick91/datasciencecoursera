plot3 <- function(){
  
  workdir = "C:/Users/om/Desktop/Coursera/Exdata"   
  setwd(workdir)                                  #Setting working directory
  
  dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  
  dataset[,1] <- as.Date(dataset[,1], format = "%d/%m/%Y")
  
  rdata <- subset(dataset, dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02")
  library(plyr)
  revalue(as.character(rdata[,1:ncol(rdata)]), c("?" = "NA"))
  
  png(file = "plot3.png", width = 480, height = 480, units ="px", bg = "transparent")
  library(lubridate)
  rdata[,1] <- ymd_hms(paste(rdata[,1], rdata[,2]))
  plot(rdata[,1], as.numeric(as.character(rdata[,7])), type = "l", xlab = "", ylab = "Energy sub metering")
  points(rdata[,1], as.numeric(as.character(rdata[,8])), type = "l", col = "red")
  points(rdata[,1], as.numeric(as.character(rdata[,9])), type = "l", col = "blue")
  legend("topright", legend = list("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 0.75, cex = 0.75)
  dev.off()
}