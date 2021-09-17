###COLLECTING DATA###

#dowloand and unzip the data and store in the work directory
if (!file.exists("dataset.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip" )
  unzip("dataset.zip")
}

###LOADING DATA###

#loading the test data
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSet <- read.table("./UCI HAR Dataset/test/x_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#loading the train data
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSet <- read.table("./UCI HAR Dataset/train/x_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#loading the activity and feature labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
featuresLabels <- read.table("./UCI HAR Dataset/features.txt")

###JOINING DATA###
library(plyr)
library(dplyr)
library(data.table
        )

#adding the features labels to the datasets
colnames(testSet) <- featuresLabels$V2
colnames(trainSet) <- featuresLabels$V2
colnames(subjectTest) <- "subject"
colnames(subjectTrain) <- "subject"
colnames(trainLabels) <- "activity"
colnames(testLabels) <- "activity"
colnames(activityLabels) <- c("activity_code", "activity")
colnames(activityLabels) <- c("activity_code", "activity")

#adding subject ID and Activity Description 
testSet <- cbind(testSet, subjectTest, testLabels)
trainSet <- cbind(trainSet, subjectTrain, trainLabels)

#merging test and train dataset
merged <- rbind(testSet,trainSet)

#Cleaning the work environment
rm(featuresLabels, subjectTest,subjectTrain, testLabels, testSet, trainLabels, trainSet)

#Extracting the mean and standard deviation variables
meanStd <- grep('mean\\(|std', names(merged), value = TRUE)
dataSet <- select(merged, subject,activity,meanStd)


#correcting the activity variable
for(i in activityLabels$activity_code){
  dataSet[dataSet$activity == i, "activity"] = activityLabels[activityLabels$activity_code == i , "activity"]
}                                  

#Creating the tidy data with the mean of all variables by subject and activity
tidyData <- dataSet %>% 
                group_by(subject, activity) %>%
                  summarise(across(everything(), mean))

tidyData