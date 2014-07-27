getwd()
dir()

xtrain <- read.table("X_train.txt")
dim(xtrain)
str(xtrain)
head(xtrain)


ytrain <- read.table("y_train.txt")
dim(ytrain)
str(ytrain)
head(ytrain)

strain <- read.table("subject_train.txt")
dim(strain)
str(strain)
head(strain)

features<- read.table("features.txt",stringsAsFactors = FALSE)
str(features)

colnames(xtrain) <- features$V2
head(xtrain)
colnames(ytrain) <- c("activity")
head(ytrain)
colnames(strain) <- c("subject")
head(strain)

train <- cbind(strain,ytrain,xtrain)
dim(train)
str(train)
head(train)


TEST


xtest <- read.table("X_test.txt")
dim(xtest)
str(xtest)
head(xtest)


ytest <- read.table("y_test.txt")
dim(ytest)
str(ytest)
head(ytest)

stest <- read.table("subject_test.txt")
dim(stest)
str(stest)
head(stest)

colnames(xtest) <- features$V2
head(xtest)
colnames(ytest) <- c("activity")
head(ytest)
colnames(stest) <- c("subject")
head(stest)

test <- cbind(stest,ytest,xtest)
dim(test)
str(test)
head(test)

data <- rbind(train,test)
dim(data)

unique(data$subject)
table(train$subject)
table(test$subject)
table(data$subject)

meanstdcols <- grep("mean[^?Freq]|std",colnames(data),value=TRUE)

reqcolnames <- c(c("subject","activity"),meanstdcols)

meanstddata <- subset(data,select = reqcolnames)
dim(meanstddata)
head(meanstddata)
str(meanstddata)

actlab <- read.table("activity_labels.txt")
str(actlab)
dim(actlab)
head(actlab)
colnames(actlab) <- c("activity","activitylabel")

datalabel <- merge(actlab,meanstddata,all=TRUE)
names(datalabel)

columns <- colnames(datalabel)
removespaces <- function(x) {gsub(" ","",x)}
nospacecolumns <- lapply(columns,removespaces)
nospacecolumns

removepar <- function(x) {gsub("\\()","",x)}
noparcolumns <- lapply(nospacecolumns,removepar)
noparcolumns

removehyphen <- function(x) {gsub("-","",x)}
nohyphencolumns <- lapply(noparcolumns,removehyphen)
nohyphencolumns

changemean <- function(x) {gsub("mean","Mean",x)}
Meancolumns <- lapply(nohyphencolumns, changemean)
Meancolumns
changestd <- function(x) {gsub("std","StdDev",x)}
StdDevcolumns <- lapply(Meancolumns, changestd)
StdDevcolumns

changet <- function(x) {sub("^t","time",x)}
Timecolumns <- lapply(StdDevcolumns, changet)
Timecolumns

changef <- function(x) {sub("^f","freq",x)}
Freqcolumns <- lapply(Timecolumns, changef)
Freqcolumns

dim(datalabel)

colnames(datalabel) <- Freqcolumns
colnames(datalabel)

aggtest <- aggregate(datalabel,by = list(datalabel$subject,datalabel$activity),FUN = mean,na.rm = TRUE)
dim(aggtest)
names(aggtest)
head(aggtest)

meandata <- aggtest[,3:71]
dim(meandata)
names(meandata)
finaldata <- merge(actlab,meandata,by.x="activity",by.y="activity",all=TRUE)
dim(finaldata)

names(finaldata)
head(finaldata)
table(finaldata$activity)
table(finaldata$subject)
finaldata$activitylabel.y <- NULL
dim(finaldata)
names(finaldata)

write.table(finaldata,file = "FinalTidyData.txt",append=FALSE)
testdata <- read.table("FinalTidyData.txt",header = TRUE)
dim(testdata)
names(testdata)