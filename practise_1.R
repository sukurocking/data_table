library(data.table)
library(dplyr)
#DT[i, j, by]
# Take DT, subset by 'i', then calculate 'j' grouped by 'by'

DT <- data.table(A = c(1L,2L), B = c('a','b','c', 'd', 'e', 'f'), C = rnorm(6), D = TRUE)
DT
class(DT$A)

# i part ------------------------------------------------------------------


DT[5:6]
DF <- as_data_frame(DT)
class(DF)
class(DT)

#A data table containing 3rd row,4th row twice and 6th row
data.table(DT[c(3,4,4,6)])


DT[c(.N - 1, .N), ] #2nd last and last rows
DT[.N - 1:.N, ] #This apparently prints all the rows in reverse order except last row
DT[nrow(DT) - 1:nrow(DT), ] #This prints the same too
nrow(DT)
DT[.N - 1] #2nd last row
DT[5:6,] #But this prints the last 2 rows or rather 5th to 6th rows




# j part ------------------------------------------------------------------


DT[,.('2nd column' = B,'4th column' = D)] #2nd and the 4th column

DT[,.(sumA = sum(A), meanC = mean(C))] #The dot-paranthesis syntax of 'j'
DT[, plot(cars)]
