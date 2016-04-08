Instructions for project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
After dowloading the files manually or using download.file, 

##Read the test and training data in to R 
#######################################################
##Read training data in to R 
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
##Read test data in to R 
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
#######################################################
##create datasets in R
#######################################################
##Create x_data or observations data 
x_data <- rbind(x_train,x_test)
##create y data or activity data 
 y_data <- rbind(y_train,y_test)
##Rename the column with proper variable name
setnames(y_data,"V1","activity")
## create subject data
subject_data <- rbind(subject_train,subject_test)
##Rename the column with proper variable name
 setnames(subject_data,"V1","subject")
##Rename the column with proper variable name
setnames(subject_data,"V1","subject")
###################################################
##Merge training and test datasets
###################################################
all_data <- cbind(subject_data,y_data,x_data)
###################################################
##Extract only Mean and std measurments
##################################################
##Read fetaures data in to R
features <- read.table("features.txt")
##Rename to appropiate column names in features
names(features) <- c("featureNum","featureName")
mean_sd <- grep("mean\\(\\)|std\\(\\)",features[,2])
## subset only mean and sd for x_data
x_data <- x_data[,mean_sd]
##rename x_data with correct column names
names(x_data) <- features[mean_sd,2]
##Recreate the all_data after selecting only mean and sd
all_data <- cbind(subject_data,y_data,x_data)
################################################
## use descriptive activity names to name the acitivities in the dataset


