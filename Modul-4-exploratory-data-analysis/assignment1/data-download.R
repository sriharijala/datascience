## PLOT  OVERVIEW

##Reads in the "Individual household electric power consumption Data Set"ù available from the UC Irvine Machine Learning Repository, and produces four graphs for the dates February 1 and 2, 2007. 


if(!file.exists("household_power_consumption.txt")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}
