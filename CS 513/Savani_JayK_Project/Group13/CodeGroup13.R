#Clear the Environment 
dev.off()
rm(list=ls())

#Read the File
file<-file.choose()
raw <- read.csv(file)

#Remove NAs
y <- na.omit(raw)

#Categorize the Columns
y$HeartDisease <- ifelse(y$HeartDisease == 'Yes', 1, 0)
y$Smoking <- ifelse(y$Smoking == 'Yes', 1, 0)
y$AlcoholDrinking <- ifelse(y$AlcoholDrinking == 'Yes', 1, 0)
y$Stroke <- ifelse(y$Stroke == 'Yes', 1, 0)
y$DiffWalking <- ifelse(y$DiffWalking == 'Yes', 1, 0)
y$Sex <- ifelse(y$Sex == 'Male', 1, 0)
y$Diabetic <- ifelse(y$Diabetic == 'Yes', 1, 0)
y$PhysicalActivity <- ifelse(y$PhysicalActivity == 'Yes', 1, 0)
y$GenHealth <- ifelse(y$GenHealth == 'Very good', 1, 0)
y$Asthma <- ifelse(y$Asthma == 'Yes', 1, 0)
y$SkinCancer <- ifelse(y$SkinCancer == 'Yes', 1, 0)

#Extract the Feature Names
colnames = colnames(y)

#Normalize All Columns
normalize <-function(x) {
  n<-((x-min(x))/(max(x)-min(x)))
  return(n) 
}

#Accuracy/Precision metrics   
err_metric=function(comparision.matrix)
{
  true.negative =comparision.matrix[1,1]
  true.positive =comparision.matrix[2,2]
  false.positive =comparision.matrix[1,2]
  false.negative =comparision.matrix[2,1]
  precision =(true.positive)/(true.positive+false.positive)
  recall_score =(false.positive)/(false.positive+true.negative)
  
  f1_score=2*((precision*recall_score)/(precision+recall_score))
  accuracy_model  =(true.positive+true.negative)/(true.positive+true.negative+false.positive+false.negative)
  False_positive_rate =(false.positive)/(false.positive+true.negative)
  False_negative_rate =(false.negative)/(false.negative+true.positive) 
  
  #print(paste("Precision of the model:",round(precision,2)))
  print(paste("Accuracy of the model:",round(accuracy_model,2)))
  #print(paste("Recall value of the model: ",round(recall_score,2)))
  #print(paste("False Positive rate of the model:",round(False_positive_rate,2)))
  #print(paste("False Negative rate of the model:",round(False_negative_rate,2)))
  print(paste("f1 score:",1-round(f1_score,2)))
}

#Calculate the Standard Deviation
sde <- c()
for(col in colnames) { sde <- append(sde, sd(y[, col])) }

#Correlation
correlation <- c()
for (i in seq(1, length(colnames))) {
  cov <- cov(y[, i], y[, "HeartDisease"])
  col_correlation <- cov / (sde[i] * sde[15])
  correlation <- append(correlation, col_correlation)
}

related.features <- ifelse((correlation > 0.05 | correlation < -0.05), TRUE, FALSE)
filtered <- y[related.features]


#For without Correlation Work
# filtered <- y
# Factor the Target Column
filtered$HeartDisease <- as.factor(filtered$HeartDisease)
filtered <- filtered[1:100000, ]

# Data Sampling 
set.seed(1)
index<-sort(sample(nrow(filtered),as.integer(.70*nrow(filtered))))
training_data<-filtered[index,]
testing_data<-filtered[-index,]



# Random Forest
#install.packages('randomForest')
library('randomForest')
tree_mod <- randomForest(x=training_data[, c(-1)], y = training_data$HeartDisease)
predicted.Random <- predict(tree_mod, testing_data[, c(-1)])
print("RANDOM FOREST: ")
Random = table(testing_data$HeartDisease, predicted.Random)
err_metric(Random)
print(Random)


# Naive Bayes
#install.packages("e1071")
library(e1071)
classifier_cl <- naiveBayes(HeartDisease~., data = training_data)
predicted.Naive <- predict(classifier_cl, testing_data[-1], type = "class")
print("NAIVE BAYES: ")
Naive = table(testing_data$HeartDisease, predicted.Naive)
err_metric(Naive)
print(Naive)



#KNN
for (colname in colnames) {
  y[, colname] <- normalize(y[, colname])
}
# install.packages("kknn")
library(kknn)
predict_k1 <- kknn(formula= HeartDisease~., training_data , testing_data, k=5,kernel ="rectangular")
predicted.knn <- fitted(predict_k1)
print("KNN: ")
KNN = table(testing_data$HeartDisease, predicted.knn)
err_metric(KNN)
print(KNN)


#SVM
library(e1071)
svm.model <- svm(HeartDisease~ ., data =training_data)
svm.pred <- predict(svm.model,  testing_data)
SVM = table(testing_data$HeartDisease, svm.pred)
err_metric(SVM)
print(SVM)


#Logistic Regression 
library(aod)
library(ggplot2)
logistic_model <- glm(HeartDisease ~ ., family="binomial", data=training_data)
predicted.logistic <- predict(logistic_model, newdata = testing_data, type = "response")
predicted.logistic <- ifelse(predicted.logistic > 0.5, 1, 0)
Logistic = table(testing_data$HeartDisease, predicted.logistic)
err_metric(Logistic)
print(Logistic)


#CS 5.0
library(C50)
cmod<-C5.0(HeartDisease~.,training_data)
summary(cmod)
plot(cmod)
prediction<-predict(cmod,testing_data,type="class") 
#Forming the confusin matrix
conf_matrix<-table(testing_data$HeartDisease,prediction)
str(prediction)
err_metric(conf_matrix)
print(conf_matrix)









