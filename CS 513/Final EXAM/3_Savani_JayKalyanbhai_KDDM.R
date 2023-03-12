### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207

#Clear Enviromental Variables in the DataSet
rm(list = ls())

#Remove NAs in the DataSet
name<-file.choose()
Final3 <- read.csv(name)
Final3 <- na.omit(Final3)

#Set column Attrition
Final3$Attrition <- factor(Final3$Attrition)

#Display top 30 Rows
head(Final3, n = 30)

#Get the IDS for test train DataSet
id <- array()
for (x in (0:as.integer(nrow(Final3)/4))) {
  if(as.integer(4*x + 1) > (nrow(Final3))) {
    break
  }
  id[x + 1] = as.integer(4*x + 1)
}

#Split the DataSet 
traindata <- Final3[-id,]
testdata <- Final3[id,]

#Install package C5.0
#install.packages("C50",repos="http://cran.us.r-project.org")
library('C50')
c50 <- C5.0(Attrition~., data = traindata)

#Predict C5.0
predictc50 <- predict(c50, testdata, type = "class" )

#Plot the Tree
plot(c50)

#Frequency Table 
table(c5.0 = predictc50, Attrition = testdata$Attrition)

#Calculate Error-Rate
wrongpredc50 <- sum(predictc50 != testdata$Attrition)

#Error-Rate C5.0 predict
errorrate_c50 <- wrongpredc50/length(predictc50)
print(paste("Error Rate:" , errorrate_c50))

