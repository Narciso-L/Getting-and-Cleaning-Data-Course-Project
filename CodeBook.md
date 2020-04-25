
---
Title: "CodeBook"
Author: "Narciso Lopez"
Date: "25/4/2020"
---

## The dataset used:

- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files used from input dataset

- "README.txt"
- "./features.txt": list of all functions.
- "./activity_labels.txt": id of the activity with their activity name.
- "./test/subject_test.txt": subject id
- "./test/X_test.txt": test set.
- "./test/y_test.txt": test labels.
- "./train/subject_train.txt": subject id
- "./train/X_train.txt": training set.
- "./train/y_train.txt": training labels.


## Variables created in the analysis

- "temp": temporary variable to store the zip file.
- "features": stores id and the functions of the measurements.
- "activity_labels": stores id and activity labels.
- "subject_test": contains test data from subjects.
- "X_test": contains features of activities from test data.
- "Y_test": contains id of activities.
- "subject_train": contains train data from subjects.
- "X_train": contains features of activities from train data.
- "Y_train": contains id of activities.
- "subject": stores binded subject train & test data.
- "test": stores binded X train & test data.
- "train": stores binded Y train & test data.
- "mergedData": stores the data from subject, train and test merged.
- "tidyData": stores the measurements on the mean and standard deviation for each measurement.
- "tidyDataGrouped": stores and groups by subjectId and activity from tidyData.
- "tidyDataMean": stores the average of the tidyDataGrouped variables.
