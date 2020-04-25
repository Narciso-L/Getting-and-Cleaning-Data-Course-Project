
# Author: Narciso López
# Date: 25-4-20
# Required packages: dplyr 
# install.packages("dplyr")


# Here are the data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Download zipped data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
    unzip(temp)
}

# Remove temp file
unlink(temp)

# Setting working directory
setwd("~/R-Projects/datasciencecoursera/GettingAndCleaningData/week4/UCI HAR Dataset")

# Listing files in folder
list.files(path="./", recursive = T)

# Reading features and activities
features <- read.table("./features.txt", header = FALSE)
activity_labels <- read.table("./activity_labels.txt", header = FALSE)

# Reading test data
subject_test <- read.table("./test/subject_test.txt", header = FALSE)
X_test <- read.table("./test/X_test.txt", header = FALSE)
Y_test <- read.table("./test/y_test.txt", header = FALSE)

# Reading train data
subject_train <- read.table("./train/subject_train.txt", header = FALSE)
X_train <- read.table("./train/X_train.txt", header = FALSE)
Y_train <- read.table("./train/y_train.txt", header = FALSE)

# Assign column names
colnames(features) <- c("featId", "functions")
colnames(activity_labels) <- c("actId","actName")
colnames(subject_test) <- "subjectId"
colnames(X_test) <- features$functions
colnames(Y_test) <- "actId"
colnames(subject_train) <- "subjectId"
colnames(X_train) <- features$functions
colnames(Y_train) <- "actId"



# You should create one R script called run_analysis.R that does the following.

# 1 - Merges the training and the test sets to create one data set.

# Merging subject train & test
subject <- rbind(subject_train, subject_test)

# Merging X train & test
test <- rbind(X_train, X_test)

# Merging Y train & test
train <- rbind(Y_train, Y_test)

# All the data from subject, train and test merged
mergedData <- cbind(subject, train, test)
# View(mergedData)



# 2- Extracts only the measurements on the mean and standard deviation for each measurement.

# Looking for matches with grepl in mergedData
tidyData <-mergedData[,grepl("mean|std|subjectId|actId",colnames(mergedData))]

# View(tidyData)



# 3- Uses descriptive activity names to name the activities in the data set

# View(activity_labels)

# Assigning actName to the activities in tidyData
tidyData[,2] <- activity_labels[tidyData[,2], 2]

# View(tidyData)



# 4- Appropriately labels the data set with descriptive variable names.

# Renaming column actId to activity
names(tidyData)[2] = "activity"

# Looking for variable names
names(tidyData)

# Renaming vars starting with t to Time
names(tidyData) <- gsub("^t", "Time", names(tidyData))

# Renaming vars starting with f to Frequency
names(tidyData) <- gsub("^f", "Frequency", names(tidyData))

# Renaming BodyBody to Body
names(tidyData) <- gsub("BodyBody", "Body", names(tidyData))

# Renaming Acc to Accelerometer
names(tidyData) <- gsub("Acc", "Accelerometer", names(tidyData))

# Renaming Gyro to Gyroscope
names(tidyData) <- gsub("Gyro", "Gyroscope", names(tidyData))

# Renaming Mag to Magnitude
names(tidyData) <- gsub("Mag", "Magnitude", names(tidyData))



# 5- From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

# Loading library dplyr
library(dplyr)

# View(tidyData)

# Grouping by subjectId and activity
tidyDataGrouped <- group_by(tidyData, subjectId, activity)
# View(tidyDataGrouped)

# Obtaining the average of each variable
tidyDataMean <- summarise_all(tidyDataGrouped, mean)
# View(tidyDataMean)

# Writing data to a file
write.table(tidyDataMean, file = "tidyData.txt",row.name=FALSE)

