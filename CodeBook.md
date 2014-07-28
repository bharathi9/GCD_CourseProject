## DATA DICTIONARY - Final data set created for the Course Project of Getting and Cleaning Data course on Coursera offered by Prof.Leek at Johns Hopkins university

Note: I do not understand the original data enough to elaborate on what exactly each column in this dataset represents. Please refer to the features_info.txt file in the original zip folder (link available in README.md file) for a more detailed description.

* activiy 
	activity performed by the subject (numeric)
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING
* activitylabel.x
	description of the activity performed by the subject
	LAYING
	SITTING
	STANDING
	WALKING
	WALKING_DOWNSTAIRS
	WALKING_UPSTAIRS
* subject	
	numeric id of the subject 
	values : 1 through 30

The remaining 66 columns give the averages of the values from the original data set aggregated by subject and activity.
Given below is a list of the column name from this data set and the column it corresponds to in the original data set. 
Please refer to the features_info.txt file in the original zip folder (link available in README.md file) for a more detailed description.

New tidy data	Original data
timeBodyAccMeanX	tBodyAcc-mean()-X
timeBodyAccMeanY	tBodyAcc-mean()-Y
timeBodyAccMeanZ	tBodyAcc-mean()-Z
timeBodyAccStdDevX	tBodyAcc-std()-X
timeBodyAccStdDevY	tBodyAcc-std()-Y
timeBodyAccStdDevZ	tBodyAcc-std()-Z
timeGravityAccMeanX	tGravityAcc-mean()-X
timeGravityAccMeanY	tGravityAcc-mean()-Y
timeGravityAccMeanZ	tGravityAcc-mean()-Z
timeGravityAccStdDevX	tGravityAcc-std()-X
timeGravityAccStdDevY	tGravityAcc-std()-Y
timeGravityAccStdDevZ	tGravityAcc-std()-Z
timeBodyAccJerkMeanX	tBodyAccJerk-mean()-X
timeBodyAccJerkMeanY	tBodyAccJerk-mean()-Y
timeBodyAccJerkMeanZ	tBodyAccJerk-mean()-Z
timeBodyAccJerkStdDevX	tBodyAccJerk-std()-X
timeBodyAccJerkStdDevY	tBodyAccJerk-std()-Y
timeBodyAccJerkStdDevZ	tBodyAccJerk-std()-Z
timeBodyGyroMeanX	tBodyGyro-mean()-X
timeBodyGyroMeanY	tBodyGyro-mean()-Y
timeBodyGyroMeanZ	tBodyGyro-mean()-Z
timeBodyGyroStdDevX	tBodyGyro-std()-X
timeBodyGyroStdDevY	tBodyGyro-std()-Y
timeBodyGyroStdDevZ	tBodyGyro-std()-Z
timeBodyGyroJerkMeanX	tBodyGyroJerk-mean()-X
timeBodyGyroJerkMeanY	tBodyGyroJerk-mean()-Y
timeBodyGyroJerkMeanZ	tBodyGyroJerk-mean()-Z
timeBodyGyroJerkStdDevX	tBodyGyroJerk-std()-X
timeBodyGyroJerkStdDevY	tBodyGyroJerk-std()-Y
timeBodyGyroJerkStdDevZ	tBodyGyroJerk-std()-Z
timeBodyAccMagMean	tBodyAccMag-mean()
timeBodyAccMagStdDev	tBodyAccMag-std()
timeGravityAccMagMean	tGravityAccMag-mean()
timeGravityAccMagStdDev	tGravityAccMag-std()
timeBodyAccJerkMagMean	tBodyAccJerkMag-mean()
timeBodyAccJerkMagStdDev	tBodyAccJerkMag-std()
timeBodyGyroMagMean	tBodyGyroMag-mean()
timeBodyGyroMagStdDev	tBodyGyroMag-std()
timeBodyGyroJerkMagMean	tBodyGyroJerkMag-mean()
timeBodyGyroJerkMagStdDev	tBodyGyroJerkMag-std()
freqBodyAccMeanX	fBodyAcc-mean()-X
freqBodyAccMeanY	fBodyAcc-mean()-Y
freqBodyAccMeanZ	fBodyAcc-mean()-Z
freqBodyAccStdDevX	fBodyAcc-std()-X
freqBodyAccStdDevY	fBodyAcc-std()-Y
freqBodyAccStdDevZ	fBodyAcc-std()-Z
freqBodyAccJerkMeanX	fBodyAccJerk-mean()-X
freqBodyAccJerkMeanY	fBodyAccJerk-mean()-Y
freqBodyAccJerkMeanZ	fBodyAccJerk-mean()-Z
freqBodyAccJerkStdDevX	fBodyAccJerk-std()-X
freqBodyAccJerkStdDevY	fBodyAccJerk-std()-Y
freqBodyAccJerkStdDevZ	fBodyAccJerk-std()-Z
freqBodyGyroMeanX	fBodyGyro-mean()-X
freqBodyGyroMeanY	fBodyGyro-mean()-Y
freqBodyGyroMeanZ	fBodyGyro-mean()-Z
freqBodyGyroStdDevX	fBodyGyro-std()-X
freqBodyGyroStdDevY	fBodyGyro-std()-Y
freqBodyGyroStdDevZ	fBodyGyro-std()-Z
freqBodyAccMagMean	fBodyAccMag-mean()
freqBodyAccMagStdDev	fBodyAccMag-std()
freqBodyBodyAccJerkMagMean	fBodyBodyAccJerkMag-mean()
freqBodyBodyAccJerkMagStdDev	fBodyBodyAccJerkMag-std()
freqBodyBodyGyroMagMean	fBodyBodyGyroMag-mean()
freqBodyBodyGyroMagStdDev	fBodyBodyGyroMag-std()
freqBodyBodyGyroJerkMagMean	fBodyBodyGyroJerkMag-mean()
freqBodyBodyGyroJerkMagStdDev	fBodyBodyGyroJerkMag-std()

