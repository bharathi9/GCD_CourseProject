## This file describes the steps taken to clean the Human Activity Recognition Using Smartphones dataset collected from the accelerometers on Samsung Galaxy S smartphone
### This is for the course project of Getting and Cleaning Data course on Coursera offered by Prof. Jeffrey Leek at Johns Hopkins University

###Data

The data for the project is available at 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Missing values

There is no mention of missing values anywhere. Since this data is the result of a controlled experiment [1], I am assuming there are no missing values in the data set. A quick check of the data also confirms this. 

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

The features_info.txt file describes how the 561 variables were obtained.
 
### Steps to clean the data and make it tidy

These steps give a high level overview of what needs to be done. The run_Analysis.R file has comments that help understand the finer details involved in cleaning the data and making it tidy.

* Read data from each of the seven files above. Check their dimensions, the types of each column read, whether there are any missing values etc.
* Add the column names obtained from the features file to the data in X_train and X_test files
* Add the required column names for the y_train, subject_train, y_test, and subject_test files
* Combine the subect, acitivity, and 561 variable data for train and test data. Since there is no key to link the data together in each of these files, it is assumed that row 1 across all the files belongs to one and same instance of the collected data and so on.
* Combine the training and test data to create one data set with data for all the 30 subjects
* Subset this data to include only the required mean and standard deviation columns. The meanFreq() variables are not included because they are weighted averages. Also the mean variables derived from the angle() variable are not included. Please refer to the features_info.txt file for a detailed description of these variables. 
* Add the activity label description (WALKING, SITTING, STANDING etc) to the data set.
* Clean up the column names to make them more R compatible. I did not expand or make them more descriptive because I myself do not understand exactly what each of them mean. 
Note: After modifying the column names, I did not change the dataset to make it either narrower or wider because I do not understand the data enough and also I do not have any context as to how this data will be further used. 
* Aggregate this data by subject and activity to determine the average of the mean and standard deviation values. 

The data set obtained in the final step includes the averages of the mean and standard deviation values for each subject for each activity. There are 30 subjects and 6 activities resulting in 180 average values for the data under each column. This data is uploaded as the FinalTidyData.txt file on the course project submission page.

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012