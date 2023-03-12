### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###




# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207




rm(list=ls())
a<-read.csv(file="~/Desktop/breastcancerwisconsin.csv", na.strings = {'?'})
View(a)





##Remove missing value
a <- na.omit(a)





##Remove Sample column
a<- a[,-1]




##random index selection
index <- sample(nrow(a),round(.70*nrow(a)))




##Split data
trainingData <- a[-index,]
testData <- a[index,]
traininglabel <- trainingData[,1]






library(class)
classifierknn <- knn(trainingData, testData, a[-index,10], k=3)
tb <- table (classifierknn, testData[,10])
accuracy <- function(b){sum(diag(b)/(sum(rowSums(b)))) * 100}
accuracy(tb)





classifierknn <- knn(trainingData, testData, a[-index,10], k=5)
tb<-table (classifierknn, testData[,10])
accuracy <- function(b){sum(diag(b)/(sum(rowSums(b)))) * 100}
accuracy(tb)





classifierknn <- knn(trainingData, testData, a[-index,10], k=10)
tb<-table (classifierknn, testData[,10])
accuracy <- function(b){sum(diag(b)/(sum(rowSums(b)))) * 100}
accuracy(tb)





rm(list=ls())




