library(sqldf)


# Downloads the csv data from web if it not already downloaded
# Runs couple of SQLs against the R object to Query specific data


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

fileName <- "survey-data.csv"

if(!file.exists(fileName))
    download.file(fileUrl, fileName)

acs <- read.csv(fileName)

#pwgtp1 With Age Under 50 
pwgtp1UnderFifty <- sqldf("select pwgtp1 from acs where AGEP < 50")

#distinct AGEP from acs
distinctAGEP <- sqldf("select distinct AGEP from acs")

print(paste("pwgtp1 under age fifty:", nrow(pwgtp1UnderFifty), sep=" "))
print(paste("distinct AGEP:", nrow(distinctAGEP), sep=" "))

acs

