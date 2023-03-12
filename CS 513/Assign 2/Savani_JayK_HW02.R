### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###




# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207

rm(list=ls())
options(max.print=10000)

# 1-Load the “breast-cancer-wisconsin.data.csv” perform the EDA analysis
Cancer <- read.csv(file="~/Desktop/breast-cancer-wisconsin.data.csv",header = TRUE)




# I.	Summarizing each column (e.g. min, max, mean )
Cancer$F6<-as.integer(Cancer$F6)
typeof(Cancer$F6)
c<-summary(Cancer)
c




# II.	Identifying missing values
which(is.na(Cancer$F6))




# III.	Replacing the missing values with the “mean” of the column.
Cancer$F6[is.na(Cancer$F6)]<-mean(Cancer$F6,na.rm=TRUE)
Cancer




# IV.	Displaying the frequency table of “Class” vs. F6
g<-ftable(Class=Cancer$Class, F6=Cancer$F6)
g




# V.	Displaying the scatter plot of F1 to F6, one pair at a time
d<-plot(Cancer[2:7])
d




# VI.	Show histogram box plot for columns F7 to F9
install.packages("packHV")
library(packHV)
x<-hist_boxplot(Cancer$F7,freq = TRUE)
x
y<-hist_boxplot(Cancer$F8,freq = TRUE)
y
z<-hist_boxplot(Cancer$F9,freq = TRUE)
z




# 2- Delete all the objects from your R- environment. Reload the “breast-cancer-wisconsin.data.csv” from canvas into R. Remove any row with a missing value in any of the columns.
rm(list=ls())
Cancer <- read.csv(file="~/Desktop/breast-cancer-wisconsin.data.csv",header = TRUE)
View(Cancer)
Cancer$F6<-as.integer(Cancer$F6)
a<-na.omit(Cancer)
View(a)
