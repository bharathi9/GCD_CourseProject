## This file describes the steps taken to clean the Human Activity Recognition Using Smartphones dataset collected from the accelerometers on Samsung Galaxy S smartphone
### This is for the course project of Getting and Cleaning Data course on Coursera offered by Prof. Jeffrey Leek at Johns Hopkins University

###Data

The data for the project is available at 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Missing values

There is no mention of missing values anywhere. Since this data is the result of a controlled experiment, I am assuming there are no missing values in the data set. A quick check of the data also confirms this. 

### Required files

Before you start cleaning the data, please make sure that the following files are in your current working directory. They can be copied from the UCI HAR Dataset folder (when you extract the files from the downloaded zip file).

activity_labels.txt
features.txt
train/X_train.txt
train/y_train.txt
train/subject_train.txt
test/X_test.txt
test/y_train.txt
test/subject_test.txt
