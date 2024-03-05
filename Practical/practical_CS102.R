
#A.
warpbreaks

#1. Find out, in a single command, which columns of warpbreaks are either numeric or integer.
str(warpbreaks)


#2. Is numeric a natural data type for the columns which are stored as such? Convert to integer when necessary.
# YES
# to convert:
numeric <- as.integer(warpbreaks$breaks)

#3.


#B.to load the file
loadFile <- "exampleFile.txt"
#1. to read the file
lines <-readLines(loadFile)

#2.to separate
comment <- grepl("^//", lines)
dataLines <- lines[!comment]
comment
dataLines

#3.to extract  
linedate <- comment[1]
date <- gsub("// Survey data. Created : ", "", linedate)
linedate
date

#4. 
#a.
splitter <- strsplit(dataLines, ";")
splitter

#b.
maxFields <- max(sapply(splitter, length))
filledData <- lapply(splitter, function(x) c(x, rep(NA, max_fields - length(x))))
maxFields
filledData

#c.
matData <- matrix(unlist(filledData), ncol = maxFields, byrow = TRUE)
matData



#d.
LetterD <- comment[2:4]
fieldNames <- gsub("// Field [0-9]+: ", "", LetterD)
colnames(matData) <- fieldNames

