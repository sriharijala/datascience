library(dplyr)
library(xlsx)
library(XML)
library(data.table)
library(stats)

highValueHomes <- function() {
    
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    
    fileName <- "survey-data.csv"
    
    if(!file.exists(fileName))
      download.file(fileUrl, fileName)
    
    data <- read.csv(fileName)

    count(filter(data, VAL == "24"))
    
}

naturalGasData <- function() {
    
    xlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    
    fileName <- "fdata-gov.xlsx"
    
    if(!file.exists(fileName))
        download.file(xlFile, fileName, mode='wb')
    
    data <- read.xlsx(fileName, 1, header=FALSE, colClasses="character", stringsAsFactors=TRUE)
    
    #dat <- data[18:23, 7:15]
    
    DT <- data.table(data)
    
    DT <- DT[c(18:23)]
   
}


readXml <- function() {
    
    xmlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
    
    fileName <- "xml-data.xml"
    
    if(!file.exists(fileName))
        download.file(xmlFile, fileName)
    
    doc <- xmlTreeParse(fileName, useInternalNodes = TRUE)
    
    rootNode <- xmlRoot(doc)
    
    length(getNodeSet(rootNode, '//zipcode[text()="21231"]'))
}

averageValue <- function() {
    
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    
    fileName <- "community-survey.csv"
    
    if(!file.exists(fileName))
        download.file(fileUrl, fileName)
    
    DT <- fread(fileName)
   
    #option 1
    pt <- proc.time()
    
    mean(DT[DT$SEX==1,]$pwgtp15)
    mean(DT[DT$SEX==2,]$pwgtp15)
    
    option1Time <- proc.time() - pt
    
    pt <- proc.time()
    mean(DT$pwgtp15,by=DT$SEX)
    option2Time <- proc.time() - pt
    
    #option 3
    #pt <- proc.time()
    
    #rowMeans(DT)[DT$SEX==1]
    #rowMeans(DT)[DT$SEX==2]
    
    #option3Time <- proc.time() - pt
    
    pt <- proc.time()
    sapply(split(DT$pwgtp15,DT$SEX),mean)
    option4Time <- proc.time() - pt
    
    pt <- proc.time()
    DT[,mean(pwgtp15),by=SEX]
    option5Time <- proc.time() - pt
    
    pt <- proc.time()
    tapply(DT$pwgtp15,DT$SEX,mean)
    option6Time <- proc.time() - pt
    
    print("option1 ----")
    print(option1Time)
    
    print("option2 ----")
    print(option2Time)
    #print(paste("option3 ----> "), option3Time, sep = " ")
    
    print("option4 ----")
    print(option4Time)
    
    print("option5 ----")
    print(option5Time)
    
    print("option6 ----")
    print(option6Time)
    
    
}