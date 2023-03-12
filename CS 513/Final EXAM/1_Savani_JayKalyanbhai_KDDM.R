### KNOWLEDGE DISCOVERY AND DATA MINING (CS 513-A) ###
# Course         : CS 513-A
# First Name     : Jay Kalyanbhai 
# Last Name      : Savani
# Id             : 20009207

#Clear Enviromental Variables in the DataSet
rm(list = ls())

#Remove NAs in the DataSet
name<-file.choose()
Final1 <- read.csv(name)
Final1 <- na.omit(Final1)

#Display First 30 Rows 
head(Final1, n = 30)

#Adding new columns in the DataSet
Final1['MonthlyIncomeCat'] <- NA
Final1['AgeCat'] <- NA
Final1['YearsAtCompanyCat'] <- NA

#Monthly Income Discretize in the DataSet
Final1$MonthlyIncomeCat <- ifelse(Final1$MonthlyIncome <= 2900, 
                                "income1", 
                                ifelse(Final1$MonthlyIncome > 8500, 
                                       "income4",
                                       ifelse(Final1$MonthlyIncome <= 5000, 
                                              "income2", 
                                              "income3")))

#YearsAtCompany Discretize in the DataSet
Final1$YearsAtCompanyCat <- ifelse(Final1$YearsAtCompany <= 6, "not-senior", "senior")

#Discretize Age in the DataSet
Final1$AgeCat <- ifelse(Final1$Age <= 37, "young", "mature")

#Display First 30 Rows
head(Final1, n = 30)

#Removing the Columns
Final1 <- subset(Final1,select = -c(Age, YearsAtCompany, MonthlyIncome))

#Setting up the Columns as per the DataSet
Final1 <- Final1[c("AgeCat", "JobSatisfaction", "MaritalStatus", 
               "MonthlyIncomeCat", "YearsAtCompanyCat", "Attrition")]

#Display First 30 Rows
head(Final1, n = 30)

#Saving the New Modified Dataset
write.csv(Final1,file = file.choose(new = T))

