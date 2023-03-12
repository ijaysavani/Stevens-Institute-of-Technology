### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207

#Clear Enviromental Variables in the DataSet
rm(list = ls())

#Remove NAs in the DataSet
name<-file.choose()
Final2 <- read.csv(name)
Final2 <- na.omit(Final2)

#Set column 'Attrition' in the DataSet
Final2$Attrition <- factor(Final2$Attrition)

#Display top 30 Rows
head(Final2, n = 30)

#Get the IDS test & train dataSet
id <- array()
for (x in (0:as.integer(nrow(Final2)/4))) {
  if(as.integer(4*x + 1) > (nrow(Final2))) {
    break
  }
  id[x + 1] = as.integer(4*x + 1)
}

#Split the DataSet
traindata <- Final2[-id,]
testdata <- Final2[id,]

#Implement Random Forest 
library(randomForest)
rf <- randomForest(Attrition~., data = traindata, importance = TRUE)

#Implement Random Forest method
predictrf <- predict(rf, testdata)  

#Identify & plotting Important Features
importance(rf)
varImpPlot(rf, main = "Chart of variable importance")

#Frequency Table 
table(RandomForest = predictrf, Attrition = testdata$Attrition)

#Calculate error-rate & wrong predictions
wrongpreds_rf <- sum(predictrf != testdata$Attrition)

#Error-Rate
errorrate_rf <- wrongpreds_rf/length(predictrf)
print(paste("Error Rate:" , errorrate_rf))
