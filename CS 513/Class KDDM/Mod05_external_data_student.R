############################################## ###
#  Company    : Stevens 
#  Project    : R Bootcamp 
#  Purpose    : external data
#  First Name  : Khasha
#  Last Name  : Dehnad
#  Id			    : 12345
#  Date       :
#  Comments   :

rm(list=ls())
############################################## ###
##   Step:
## 
##       read.csv
##       file
##       close
##       write.csv
##       setdiff
##       getwd
##
##
##
##
##
################### ###

##       read.csv   ####

?read.csv()

Titanic<-
  
options(max.print=100000)
name <-file.choose()
Titanic_temp<-read.csv(name)

dsn<-
  read.csv(file="~/Downloads/Titanic_rows.csv",header = TRUE)

con<-file("C://location of your file/filename.csv",'r')
Titanic2 <- read.csv(con)
close(con)
View(Titanic2)

lung<-
name <-file.choose()
  read.csv(file="~/Downloads/Lung.csv", header = TRUE)


con<-read.csv(file="~/Downloads/Lung.csv", header = TRUE)

lung2 <- read.csv(con, 
                  header = TRUE,
                  colClasses=c("ID"="character","AREA"="factor",
                               "Gender_father"="NULL"))
close(con)


colcls=c("STATEFIPS"="integer"
         ,"STATE"="character"
         ,"zipcode"="integer"
         ,"agi_stub"="integer"
         , "N1"="double"
         ,"NUMDEP"="NULL"
)
name <-file.choose()
## class assignment read in the   income_by_zip_2013.csv file using the above column classes



# read csv file into R


dsn <- read.csv("http://www.location/dsn.csv",
                colClasses=c("id"="character"))



##       write.csv   ####
?write.csv()
write.csv(dsn,"C://destination folder/dsn.csv")
 



a<-c("a1","a2","a3","a4")
ax<-c("a1","a2")
setdiff(a,ax)

?rm
?setdiff()


getwd()
## do not execute the following line
#setwd("C:/AIMS/Stevens_/R- Bootcamp/wd")

rm(list=ls())    
