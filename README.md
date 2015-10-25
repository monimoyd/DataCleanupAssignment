** Data Cleaning Assignment

This repository contains the R script (run_analysis.R) which does the following:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3.  Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
 
 ** How to use the code
 
 1. Check Out the R script file run_analysis.R from the repository. You can clone like below:
 
 git clone https://github.com/monimoyd/DataCleanupAssignment.git
 
 
 2. Download the data set from 
 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 
 Unzip the file in the same folder as you kept run_analysis.R
 
 3. Run the script using  source("run_analysis.R"), it will geneate a file TidyData.txt
 
 Make sure that packages reshape2 and data.read are installed
 
 
 
 
 
 
 
