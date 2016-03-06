# Samsung Galaxy S II Human Activity Recognition

**Human Activity Recognition Using Smartphones Dataset**

**Introduction**

The repository contains required material for Getting and Cleaning data final assignment at Coursera. 
It contains required result tidy dataset run_analysis.txt, R code in run_analysis.R and README.md as well as original .txt data files.

The purpose of the project is to demonstrate the ability to collect, work with, and clean a data set.
The objective is to prepare tidy data that can be used for later analysis.

**Dataset**

The datasets represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
More detailed information on how experiments were run as well as what type of data were collected, can be found in ./UCI HAR Dataset/README.txt.

**Implementation**

The submitted script run_analysis.R implements the following objective steps:

1. Load and unzip Dataset.zip files into a designated directory;

2. Assign descriptive activity names to the activities values in the data set;

3. Preparing each datasets (training and test), merge activities, subjects and numerical outcomes securing appropriate variables naming;

4. Merge prepared datasets (training and test) together;

5. Extract only the measurements on the mean and standard deviation for each measurement;

6. Output resultset into an independent tidy data set with the average of each variable for each activity and each subject run_analysis.txt.




