
#find the sum of the fourth column data

fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

fileName <- "survey-data.csv"

if(!file.exists(fileName))
    download.file(fileUrl, fileName)
   
dat <- read.fwf(fileName, 
		widths = c(1,9,5,
			4,1,3,5,
			4,1,3,5,
			4,1,3,5,
			4,1,3),
		skip = 4,
		col.names = c("C1", "Week","C2",
				"Nino1+2-SST","C3", "Nino1+2-SSTA","C4",
				"Nino3-SST","C5", "Nino3-SSTA","C6", 
				"Nino34-SST","C7","Nino34-SSTA","C8",
				"Nino4-SST","C9","Nino4-SSTA"
				)
		
	      )


#if you want to delete download file
#unlink(fileName)


df <- data.frame(dat)

print(paste("4th column sum", sum(df$Nino3.SST, na.rm = TRUE) , sep =" "))

#return data frame for further process
df