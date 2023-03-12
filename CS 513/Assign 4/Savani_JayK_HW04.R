### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###




# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207



rm(list=ls())
a<-read.csv(file="~/Desktop/breastcancerwisconsin.csv", na.strings = {'?'})
View(a)
a <- na.omit(a)
View(a)
a$Class<- factor(a$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(a$Class)
a <- a[,-1]
index__ <- sort(sample(nrow(a),round(.30*nrow(a))))
trainData <- a[-index__,]
testData <- a[index__,]
library(e1071)
model = naiveBayes(Class~., data = trainData)
pred = predict(model, testData)
prediction_ <- table(testData$Class, pred, dnn=c("Prediction","Actual")) 
acc <- function(a){sum(diag(a)/(sum(rowSums(a)))) * 100}
acc(prediction_)
