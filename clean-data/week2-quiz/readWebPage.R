

# Read a web page and count the number of lines in 10th, 20th, 30th, 100th line


con = url("http://biostat.jhsph.edu/~jleek/contact.html")

htmlCode = readLines(con)

close(con)

print("Number of lines in 10th, 20th, 30th, 100th lines")
print(paste(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]),nchar(htmlCode[100]), sep = " "))

htmlCode