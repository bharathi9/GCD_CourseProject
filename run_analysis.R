## get the current working directory
getwd()

## after you copy the required data files into this directory, make sure they are all present
dir()

## read the names of the 561 features variables
features<- read.table("features.txt",stringsAsFactors = FALSE)
str(features)

## Training Data

## read the training data (561 variables)
xtrain <- read.table("X_train.txt")
dim(xtrain)
str(xtrain)
head(xtrain)

## read the training activity labels (numeric)
ytrain <- read.table("y_train.txt")
dim(ytrain)
str(ytrain)
head(ytrain)

## read the training subject ids
strain <- read.table("subject_train.txt")
dim(strain)
str(strain)
head(strain)

## set the column names for the training data
colnames(xtrain) <- features$V2
head(xtrain)

## set the column name for the training activity data
colnames(ytrain) <- c("activity")
head(ytrain)

## set the column name for the training subject data
colnames(strain) <- c("subject")
head(strain)

## combine the subject data, activity data, and training data to form a single training dataset
train <- cbind(strain,ytrain,xtrain)
dim(train)
str(train)
head(train)


## Test data

## read the test data (561 variables)
xtest <- read.table("X_test.txt")
dim(xtest)
str(xtest)
head(xtest)

## read the test activity labels (numeric)
ytest <- read.table("y_test.txt")
dim(ytest)
str(ytest)
head(ytest)

## read the test subject ids
stest <- read.table("subject_test.txt")
dim(stest)
str(stest)
head(stest)

## set the column names for the test data
colnames(xtest) <- features$V2
head(xtest)


## set the column name for the test activity data
colnames(ytest) <- c("activity")
head(ytest)

## set the column name for the test subject data
colnames(stest) <- c("subject")
head(stest)


## combine the subject data, activity data, and training data to form a single test dataset
test <- cbind(stest,ytest,xtest)
dim(test)
str(test)
head(test)


## Combine the training and test datasets to form a single data set with data for all the 30 subjects
data <- rbind(train,test)
dim(data)
unique(data$subject)
table(train$subject)
table(test$subject)
table(data$subject)

## From this entire dataset, pull the columns that give mean and standard deviation values of measurements derived from the original data from the smartphone

## figure out which columns give the mean and standard deviation values
meanstdcols <- grep("mean[^?Freq]|std",colnames(data),value=TRUE)

## include subject and activity columns as well
reqcolnames <- c(c("subject","activity"),meanstdcols)

## get the subject, activity, mean, and standard deviation columns
meanstddata <- subset(data,select = reqcolnames)
dim(meanstddata)
head(meanstddata)
str(meanstddata)

## Read the activity label data
actlab <- read.table("activity_labels.txt")
str(actlab)
dim(actlab)
head(actlab)

## set the column names
colnames(actlab) <- c("activity","activitylabel")

## add the activity label column (description of the activity instead of a number)
datalabel <- merge(actlab,meanstddata,all=TRUE)
names(datalabel)

## Cleaning up the column names of the mean and standard deviation columns 
## Remove spaces
columns <- colnames(datalabel)
removespaces <- function(x) {gsub(" ","",x)}
nospacecolumns <- lapply(columns,removespaces)
nospacecolumns

## Remove paranthesis
removepar <- function(x) {gsub("\\()","",x)}
noparcolumns <- lapply(nospacecolumns,removepar)
noparcolumns

## Remove Hyphen
removehyphen <- function(x) {gsub("-","",x)}
nohyphencolumns <- lapply(noparcolumns,removehyphen)
nohyphencolumns

## Capitalize mean
changemean <- function(x) {gsub("mean","Mean",x)}
Meancolumns <- lapply(nohyphencolumns, changemean)
Meancolumns

## Capitalize StdDev
changestd <- function(x) {gsub("std","StdDev",x)}
StdDevcolumns <- lapply(Meancolumns, changestd)
StdDevcolumns

## Time instead of t
changet <- function(x) {sub("^t","time",x)}
Timecolumns <- lapply(StdDevcolumns, changet)
Timecolumns

## Freq instead of f
changef <- function(x) {sub("^f","freq",x)}
Freqcolumns <- lapply(Timecolumns, changef)
Freqcolumns

## Apply the modified column names to the data set
colnames(datalabel) <- Freqcolumns
colnames(datalabel)


## Calculate the mean of the mean and standard deviation values for each subject and activity
aggtest <- aggregate(datalabel,by = list(datalabel$subject,datalabel$activity),FUN = mean,na.rm = TRUE)
dim(aggtest)
names(aggtest)
head(aggtest)

## Cleaning up the columns, removing Group.1 and Group.2 introduced by the aggregate function
meandata <- aggtest[,3:71]
dim(meandata)
names(meandata)

## Adding the activity description again because it was disturbed by the aggregate function
finaldata <- merge(actlab,meandata,by.x="activity",by.y="activity",all=TRUE)
dim(finaldata)

## Cleaning up the column names in the final tidy data set
names(finaldata)
head(finaldata)
table(finaldata$activity)
table(finaldata$subject)
finaldata$activitylabel.y <- NULL
dim(finaldata)
names(finaldata)

## Write the final tidy data set which gives the mean values of the mean and standard deviation values by each subject and activity to a text file, so that it can be ##uploaded
write.table(finaldata,file = "FinalTidyData.txt",append=FALSE)

## Make sure that the data can be read again
testdata <- read.table("FinalTidyData.txt",header = TRUE)
dim(testdata)
names(testdata)