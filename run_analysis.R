#Assignment: Getting and Cleaning Data Course Project

#listing required libraries
require(dplyr)

#1. Downloading .zip file into a designated directory on local machine
        #1.1. Creating designated directory
if(!file.exists("~/Desktop/R Programming Material/smartphonedata"))
{dir.create("~/Desktop/R Programming Material/smartphonedata")}
        #1.2. Creating a variable and assigning URL value
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        #1.3. Specifying a designated path on a local machine where the file is to be loaded
fileDest <- "~/Desktop/R Programming Material/smartphonedata/Dataset.zip"
        #1.4. Downloading the file, passing variables with assigned values as arguments to the function
download.file(fileURL, fileDest, method = "curl")
        #1.5. Unzipping the file, using same directory for a path
unzip(zipfile = "~/Desktop/R Programming Material/smartphonedata/Dataset.zip", exdir = "~/Desktop/R Programming Material/smartphonedata")

#2. Unzipped files were unwrapped in UCI HAR Dataset folder. According to README.txt, the dataset includes the following files:
        #- 'README.txt'
        #- 'features_info.txt': Shows information about the variables used on the feature vector.
        #- 'features.txt': List of all features.
        #- 'activity_labels.txt': Links the class labels with their activity name.
        #- 'train/X_train.txt': Training set.
        #- 'train/y_train.txt': Training labels.
        #- 'test/X_test.txt': Test set.
        #- 'test/y_test.txt': Test labels.

#3. Read files into a table.
        #3.1.'features.txt': List of all features
setwd('~/Desktop/R Programming Material/smartphonedata/UCI HAR Dataset/')
featureslist <- read.table("features.txt", quote = "\"")
        #3.2. Labels: 1. 'activity_labels.txt': Links the class labels with their activity name; 
#                     2. 'train/y_train.txt': Training labels;
#                     3. 'test/y_test.txt': Test labels.
activitylabels <- read.table("activity_labels.txt", quote = "\"")
trainlabels <- read.table("train/y_train.txt", quote = "\"")
testlabels <- read.table("test/y_test.txt", quote = "\"")
        #3.3. Subject train and test data: e.g.'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
subjecttest <- read.table("test/subject_test.txt", quote = "\"")
subjecttrain <- read.table("train/subject_train.txt", quote = "\"")
        #3.4. Training and test datasets
testset <- read.table("test/X_test.txt", quote = "\"")
trainset <- read.table("train/X_train.txt", quote = "\"")

#4.Preparing a training dataset
        #4.1. Assigning activity labels names to labels values.
colnames(activitylabels)<- c("V1","activity")
        #4.2. Merging trainlabels, subjecttrain and activitylabels
        #Avoiding lack of ambiguity in column names while merging, renaming:
subjecttrain <- rename(subjecttrain, subject=V1)
        #4.3. Column binding subjecttrain and trainlabels, assigning to train intermediate variable:
traininter <- cbind(trainlabels, subjecttrain)
train1 <- merge(traininter, activitylabels, by = ("V1"))
        #4.4. Retrieving descriptive column names for trainset from featureslist
colnames(trainset) <- featureslist[,2]
        #4.5. Column binding train1 and trainset, dropping off 1st column 'V1' to avoid ambiguity in column naming as well as redundancy (V1 indicates a rownum)
train2 <- cbind(train1,trainset)
train3 <- train2[,-1]
        #4.6. Extracting only columns of interest, i.e. those that contain mean and std
trainset1 <- select(train3, contains("subject"), contains("activity"), contains("mean"), contains("std"))

#5. Preparing a test dataset
        #5.1. To prepare test dataset, same steps and logic are used as for training dataset:
subjecttest <- rename(subjecttest, subject=V1)
testinter <- cbind(testlabels, subjecttest)
test1 <- merge(testinter, activitylabels, by = ("V1"))
colnames(testset) <- featureslist[,2]
test2 <- cbind(test1,testset)
test3 <- test2[,-1]
testset1 <- select(test3, contains("subject"), contains("activity"), contains("mean"), contains("std"))

#6. Row binding prepared training and test datasets
datasets <- rbind(trainset1, testset1)

#7. Creating an independent tidy data set with computed average of each variable for each activity and each subject
tidydataset <- (datasets %>% 
                        group_by(subject,activity) %>% 
                        summarise_each(funs(mean)))
#8. Loading computed result set as a table into a .txt file
write.table(tidydataset, "./run_analysis.txt", sep=" ", row.name=FALSE)

















