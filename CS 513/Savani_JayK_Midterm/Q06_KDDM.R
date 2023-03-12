### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207

rm(list=ls())
library(kknn)
name<-file.choose()
a<-read.csv(name)
View(a)

#Removing the missing values
sum(is.na(a))
a<-na.omit(a)
sum(is.na(a))

#Converting the Infected to integer Yes=1 No=0
a$Attrition <- factor(a$Attrition, levels = c("Yes","No"),labels = c(1,0) )

#Generating train and test in the ratio 70% 30%
size <- sample(1:nrow(a), 0.7 * nrow(a)) 
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run nomalization on first 4 columns of data-set respectively
norma <- as.data.frame(lapply(a[,c(1,2,3)], nor))
summary(norma)
df2 = a['Attrition']
train <- norma[size,] 
clm_train <- df2[size,]
test <- norma[-size,] 
clm_test <- df2[-size,]

#Loading package class
library(class)

clf <- knn(train,test,cl=clm_train,k=3)

#Creating a confusion matrix
con_matrix <- table(clf, clm_test)
print(con_matrix)

#Final Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(con_matrix)
