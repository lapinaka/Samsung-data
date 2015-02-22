######################project###################
if(!file.exists("data")){dir.create("data")}
setwd("~/")
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./data/Dataset.zip",mode="wb", method="curl")
setwd("~/data")
unzip("Dataset.zip")

### 1

setwd("~/data/UCI HAR Dataset/train")
train<-read.table("X_train.txt")

setwd("~/data/UCI HAR Dataset/test")
test<-read.table("X_test.txt")

data1<-rbind(train,test)

setwd("~/data/UCI HAR Dataset/train")
subject_train<-read.table("subject_train.txt")

setwd("~/data/UCI HAR Dataset/test")
subject_test<-read.table("subject_test.txt")

data2<-rbind(subject_train,subject_test)

setwd("~/data/UCI HAR Dataset/train")
y_train<-read.table("y_train.txt")

setwd("~/data/UCI HAR Dataset/test")
y_test<-read.table("y_test.txt")

data3<-rbind(y_train,y_test)

###
data<-data.frame(data1,data2,data3)
data[1:2,562:563]

### 2
setwd("~/data/UCI HAR Dataset")
features<-read.table("features.txt")
featuresvector<-as.vector(features[,2])
names(data1)<-c(featuresvector)
meansd<-grepl("[Mm]ean\\(\\)|std\\(\\)",featuresvector)
feat<-featuresvector[meansd==TRUE]
data1<-data1[,feat]
###3
library(car)
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING
data3[1:5,]
act<-as.character(data3[,1])
data3<-recode(act," '1'= 'WALKING';'2'='WALKING_UPSTAIRS';'3'='WALKING_DOWNSTAIRS';
           '4'='SITTING';'5'='STANDING';'6'='LAYING'")
str(data3)

### 4
names(data2)<-"Subject"
dataset<-data.frame(data2,"Activity"= data3, data1)
dataset[1:3,1:5]

### 5

library(plyr)
tidy_data <- ddply(dataset, c('Subject','Activity'), numcolwise(mean))
dim(tidy_data)
tidy_data[1:3,1:5]
write.table(tidy_data,"tidy_data.txt", row.names = FALSE)
a<-read.table("tidy_data.txt", header = TRUE)
a[1:5,]
rm(list=ls())
