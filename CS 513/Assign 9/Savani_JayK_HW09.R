### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207




rm(list=ls())

#import dataset 
name<-file.choose()
a<-read.csv(name)
View(a)

data1 = subset(a, select = -c(id) )

data1$diagnosis <- factor(data1$diagnosis, levels = c('M','B'),labels = c(1,2))

index<-sort(sample(nrow(a),as.integer(.70*nrow(a))))
training<-data1[index,]
testing<-data1[-index,]

library(e1071)
svm.model <- svm(diagnosis~ ., data = training)
svm.pred <- predict(svm.model,  testing )

#Confusion matrix 
conf_matrix <- table(predict_svm=svm.pred,class=testing$diagnosis)
print(conf_matrix)

#Accuracy 
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)


