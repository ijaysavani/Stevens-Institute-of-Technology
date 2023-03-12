### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207



rm(list=ls())

#Choosing CSV File
name<-file.choose()
a<-read.csv(name)
View(a)

which(is.na(a))

#Removing Missing Values
a_copy <- a
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

#Constructing the Cart Model
install.packages('rpart') 
library(rpart)
library(rpart.plot) 

a2<- a2[1:4]
size <- floor(0.70 * nrow(a2))

set.seed(123)
random <- sample(seq_len(nrow(a2)), size = size)

train <- a2[random, ]
test <- a2[-random, ]
cart <- rpart(Attrition ~ ., data = train, method = "class")

##Prediction
predicted <- predict(cart, test, type = "class")
print(length(predicted))
print(length(test$Class))

#Creating Confusion Matrix
conf_matrix <- table(predicted,test$Attrition)
print(conf_matrix)

#Final Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)
