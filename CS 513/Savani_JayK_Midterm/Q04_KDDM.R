### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207

#Question 4

rm(list=ls())

name<-file.choose()
a<-read.csv(name)
View(a)

which(is.na(a))

a_copy<-a

#Removing Missing Values
a2 <-na.omit(a_copy)

#Discretize the Monthly Income
a2$MonthlyIncome<-ifelse(a2$MonthlyIncome<=3000,1,ifelse(a2$MonthlyIncome>3000&a2$MonthlyIncome<=5000,2,ifelse(a2$MonthlyIncome>5000&a2$MonthlyIncome<=8500,3,4)))
a2$MonthlyIncome <- as.factor(a2$MonthlyIncome)
a2$MonthlyIncome

#Discretize the AGE
a2$Age<-ifelse(a2$Age<=31,1,ifelse(a2$Age>31&a2$Age<=38,2,ifelse(a2$Age>38&a2$Age<=48,3,4)))
a2$Age <- as.factor(a2$Age)
summary(a2)


i<-sort(sample(nrow(a2),as.integer(.70*nrow(a2))))
training_set<-a2[i,]
testing_set<-a2[-i,]

#Constructing the Naive Bayes
install.packages("e1071")
installed.packages()
library(e1071)
library(class) 
set.seed(150)
AB <- naiveBayes(Attrition~., data =training_set)

#Prediction
predictnaive <- predict(AB, testing_set)

#Creating Confusion Matrix 
confusionmatrix <- table(predict_nb=predictnaive,class=testing_set$Attrition)
print(confusionmatrix)

#Final Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(confusionmatrix)

