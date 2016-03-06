**CODE BOOK**
==========================================================================

The code book describes the variables, the data, transformations and work that was performed to clean up the data.

**DATA**

**The datasets represent data collected from the accelerometers from the Samsung Galaxy S smartphone.**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


**The dataset includes the following files (./UCI HAR Dataset):**

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

**The following files are available for the train and test data. Their descriptions are equivalent.**

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


**VARIABLES**

**Features list**

**'features.txt': List of all features.**

'data.frame':	561 obs. of  2 variables:

 $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
 
 $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...

**Labels**

**'activity_labels.txt':**

'data.frame':	6 obs. of  2 variables:

 $ V1: int  1 2 3 4 5 6
 
 $ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1
 
 **'train/y_train.txt': Training labels.**
 
 data.frame':	7352 obs. of  1 variable:
 
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
 
 **'test/y_test.txt': Test labels.**
 
 'data.frame':	2947 obs. of  1 variable:
 
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...
 
 **Subjects**
 
 **'test/subject_test.txt':**
 
 'data.frame':	2947 obs. of  1 variable:
 
 $ V1: int  2 2 2 2 2 2 2 2 2 2 ...
 
 **'train/subject_train.txt':**
 
 'data.frame':	7352 obs. of  1 variable:
 
 $ V1: int  1 1 1 1 1 1 1 1 1 1 ...
 
 **Numeric outcomes**
 
 **'test/X_test.txt': Test set.**
 
 'data.frame':	2947 obs. of  561 variables:
 
 $ V1  : num  0.257 0.286 0.275 0.27 0.275 ...
 
 $ V2  : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 
 .
 
 .
 
 .
 
 
 $ V98 : num  -0.997 -0.999 -0.999 -0.999 -1 ...
 
 $ V99 : num  -0.997 -0.999 -0.999 -0.999 -1 ...
 
 **'train/X_train.txt': Training set.**
 
 'data.frame':	7352 obs. of  561 variables:
 
 $ V1  : num  0.289 0.278 0.28 0.279 0.277 ...
 
 $ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 
 .
 
 .
 
 .
 
 $ V95 : num  0.991 0.989 0.989 0.993 0.986 ...
 
 $ V96 : num  -0.994 -0.991 -0.988 -0.993 -0.994 ...
 
 $ V97 : num  -1 -1 -1 -1 -1 ...
 
 $ V98 : num  -1 -1 -1 -1 -1 ...
 
 $ V99 : num  -1 -1 -1 -1 -1 ...
 
 **PERFORMED TRANSFORMATIONS to CLEAN UP DATA**
 
 `<Note: complete code resides in run_analysis.R, snippets below are from true code, however, used for demonstartion purposes.>`

1 Load and unzip Dataset.zip files into a designated directory;

`<download.file(fileURL, fileDest, method = "curl");
unzip(zipfile = "~/Desktop/R Programming Material/smartphonedata/Dataset.zip", exdir = "~/Desktop/R Programming Material/smartphonedata")>`


2 Assign descriptive activity names to the activities values in the data set;

`<colnames(trainset) <- featureslist[,2]>`

3 Preparing each datasets (training and test), merge activities, subjects and numerical outcomes securing appropriate variables naming;

`<train2 <- cbind(train1,trainset); train3 <- train2[,-1]>`

4 Extract only the measurements on the mean and standard deviation for each measurement;

`<testset1 <- select(test3, contains("subject"), contains("activity"), contains("mean"), contains("std"))>`

5 Merge prepared datasets (training and test) together;

`<datasets <- rbind(trainset1, testset1)>`

6 Compute average of each variable for each activity and each subject;

`<tidydataset <- (datasets %>% group_by(subject,activity) %>% summarise_each(funs(mean)))>`

7 Output resultset into an independent tidy data set with the average of each variable for each activity and each subject run_analysis.txt.

`<write.table(tidydataset, "./run_analysis.txt", sep=" ", row.name=FALSE)>`



