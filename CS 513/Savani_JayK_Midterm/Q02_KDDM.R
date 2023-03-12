### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207
rm(list=ls())

name<-file.choose()
x<-read.csv(name)
View(x)

#Question=2 Part=1 Summary
summary(x)

#Question=2 part=2 Missing values
which(is.na(x))

#Question=2 part=3 Replacing missing value with mode of the column
install.packages('modeest')
library(modeest)
for(i in 1:ncol(x)){
  x[is.na(x[,i]), i] <- mfv1(x[,i], na_rm = TRUE)
}
which(is.na(x))

#Question=2 part=4 Scatter plot
plot(x = x$Age,y = x$MonthlyIncome,
     xlab = "Age",
     ylab = "MonthlyIncome",
     main = "Age vs MonthlyIncome"
)

plot(x = x$Age,y = x$YearsAtCompany,
     xlab = "Age",
     ylab = "YearsAtCompany",
     main = "Age vs YearsAtCompany"
)

plot(x = x$MonthlyIncome,y = x$YearsAtCompany,
     xlab = "MonthlyIncome",
     ylab = "YearsAtCompany",
     main = "MonthlyIncome vs YearsAtCompany"
)

#Question=2 part=5 Box plot
boxplot(x = x$MonthlyIncome,y = x$YearsAtCompany,
        xlab = "MonthlyIncome",
        ylab = "YearsAtCompany",
        main = "MonthlyIncome vs YearsAtCompany"
)

