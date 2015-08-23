## Install the respective library
 
install.packages("dplyr")

## Load the respective Library

library(dplyr) 

## Name the Columns for Activity, Subjects and Features
## Load the associated Meta Data from the directory setup in
## "c:/users/SM Lee/Documents/UCI HAR Dataset"

SubjColName  <- c("subjects")
ActColName   <- c("activities")

FeatNames    <- read.table('features.txt', stringsAsFactors = F)[,2]

MeanStdFeat  <- c(
  SubjColName,
  ActColName,
  FeatNames[grepl("mean()", FeatNames, fixed=TRUE)],
  FeatNames[grepl("std()", FeatNames, fixed=TRUE)]
)

ActNames     <- read.table('activity_labels.txt', stringsAsFactors = F)

## Step 1a: Load the Testing Data Sets for Activity, Subjects, and Features to be merged with Training Data Sets later step
## Step 4: Bind frames together, providing 'features' vector as the columns names - Testing Data Set
 
Subjects     <- read.table('./test/subject_test.txt', col.names=SubjColName)
Activities   <- read.table('./test/y_test.txt', col.names=ActColName)
Features     <- read.table('./test/X_test.txt', col.names=FeatNames, check.names = FALSE)

TestData     <- cbind(Subjects, Activities, Features)


## Step 1b: Load the Training Data Sets for Activity, Subjects, and Features to be merged with Testing Data Sets later step
## Step 4: Bind frames together, providing 'features' vector as the columns names - Training Data Set

Subjects     <- read.table('./train/subject_train.txt', col.names=SubjColName)
Activities   <- read.table('./train/y_train.txt', col.names=ActColName)
Features     <- read.table('./train/X_train.txt', col.names=FeatNames, check.names = FALSE)

TrainData <- cbind(Subjects, Activities, Features)


## Step 1:  Bind testing and training datasets from Step 1a and Step 1b.

CombineDataSet <- rbind(TrainData, TestData)

## Step 2:  Extracts only the measurements on the mean and standard deviation for each measurement

MeanStdDataSet <- CombineDataSet[, MeanStdFeat]

##  Get tidy data  
tidyData <- MeanStdDataSet %>% group_by(subjects, activities) %>% summarise_each(funs(mean))

## Step 3:   Labels the activities with descriptive variable names. 

getActivityName <- function(activityCode) {
  ActNames[activityCode, ][, 2]
}

tidyData$activities <- sapply(tidyData$activities, getActivityName)

## Step 5:   Write down the resulting data set into the file
write.table(tidyData, file='./tidy_data.txt', row.names=FALSE)

