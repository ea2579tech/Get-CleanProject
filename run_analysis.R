##temp <- tempfile()
##fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##download.file(fileUrl,destfile="zipfile",mode="wb
##unzip
xtest <- read.table("X_test.txt")    ## nrow(xtest)  ## 2947; ncol(xtest)  ## 561
xtrain <- read.table("X_train.txt")  ## nrow(xtrain) ## 7352; ncol(xtrain) ## 561
cnm <- read.table("col_names.txt")   ## column numbers & names of mean & std of measured variables 
cnm[,2] <- as.character(cnm[,2]) ## factor to string (other way "stringsAsFactors = FALSE" on read
##
## Requirement number 2
xtest <- xtest[,cnm[, 1]]    ## extract only columns that are mean & std of measurements
xtrain <- xtrain[,cnm[, 1]]
##
## add subject & y data to test and trai data sets
tst <- cbind(read.table("subject_test.txt"), read.table("y_test.txt"), xtest)
trn <- cbind(read.table("subject_train.txt"), read.table("y_train.txt"), xtrain)
##
### Requirement number1
tstr <- rbind(tst, trn)      ##nrow(tstr) ## 10299; 68 vars
tstr[,2] <- as.character(tstr[,2])

### Requirements number4 
names(tstr) <- c("Subject", "Activity", cnm[,2]) ## add column names to merged data frame
##
###Requirement number3
tstr$Activity[tstr$Activity==1] <- "WALKING"
tstr$Activity[tstr$Activity==2] <- "WALKING_UPSTAIRS"
tstr$Activity[tstr$Activity==3] <- "WALKING_DOWNSTAIRS"
tstr$Activity[tstr$Activity==4] <- "SITTING"
tstr$Activity[tstr$Activity==5] <- "STANDING"
tstr$Activity[tstr$Activity==6] <- "LAYING"
##
## sort the data (for visual checking)
pdata <- tstr[ with(tstr, order(Subject, Activity)),]
##
## Requirement number5: final tidy data
library(plyr)
tdata <- ddply(pdata, .(Subject, Activity), colwise(mean))
write.table(tdata, "tidy_data.txt")
