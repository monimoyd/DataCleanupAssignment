# The script run_analysis.R does the following: 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
library(data.table)

# Load feature and activity labels
featureNames <- read.table("./UCI HAR Dataset/features.txt")[,2]
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load Test Data
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Load Training Data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)


# Combine Test and Training Data into single Total Data
xTotal <- rbind(xTrain, xTest)
yTotal <- rbind(yTrain, yTest)
subjectTotal <- rbind(subjectTrain, subjectTest)

# Changes columns for Total x Data to Feature Names
names(xTotal) = featureNames

# Consider only mean and Standard Deviation Features

meanStdFeatures <- grepl("mean|std", featureNames)

# From Total x Data filter only Mean and Standard Deviation Features

xTotal = xTotal[, meanStdFeatures]


yTotal[, 2] = activityLabels[yTotal[, 1]]


names(yTotal) = c("ActivityId", "ActivityLabel")
names(subjectTotal) = "Subject"


# Combines subjectTotal, yTotal, xTotal into totalData 

totalData <- cbind(as.data.table(subjectTotal), yTotal, xTotal)

idLabels = c("Subject", "ActivityId", "ActivityLabel")

dataLabels = setdiff(colnames(totalData), idLabels)

meltData = melt(totalData, id = idLabels, measure.vars = dataLabels)

# Use dcast function and mean as aggregator
tidyData = dcast(meltData, Subject + ActivityLabel ~ variable, mean)
write.table(tidyData, file="./TidyData.txt")

