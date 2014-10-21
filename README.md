GettingAndCleaningData_CourseProject
====================================

####Course project for Coursera MOOC 
####- Getting and Cleaning Data

The purpose of this project was to collect, work with, and clean a data set. 
The goal was to prepare tidy data that can be used for later analysis. 

#####Files in this repo

1. This *README.md* file that explains how all the scripts work and how they are connected;
2. An R script called *run_analysis.R* that can be run to perform the analysis;
3. A code book called *CodeBook.md* that describes the variables, the data, and transformations and work  performed to clean up the data. 

#####The R code

A single R script *run_analysis.R* contains code to perform all five required actions:

1. Merge the training and the test sets to create one data set

    - Use _read.table()_ to read in the descriptive, subject and feature data files
    - Use _cbind()_ to combine the respective files to obtain "complete" training and test datasets
    - Use _rbind()_ to combine the training and test datasets to obtain one large dataset

2. Extract only the measurements on the mean and standard deviation for each measurement

    - Use _grep()_ to identify the variables containing _mean()_ and _std()_
    - Subset only the columns that contain the required variables
    
3. Use descriptive activity names to name the activities in the data set

    - Use the activity names in the *activity_labels.txt* file to replace the variables names

4. Appropriately label the data set with descriptive variable names

    - Define a function that takes three arguments: 1) a string, 2) a list of patterns  and 3) a list of replacements, which will find and replace matching elements in the list of patterns with the respective elements in the list of replacements
    - Use _sapply()_ to apply the function on the variable names
    
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

    - Use _melt()_ from the *reshape2* package to "melt" the "wide" data to "long" format, based on the ID variables _subject_ and _activity_.
    _ Use _dcast()_, also from the _reshape2_ package, to "cast" the long-format data into a wide-format table summarising the data
    - The summarisation method selected is to average each variable along each activity and each subject
    
Note: If reshape2 is not already installed, it can be installed using the command *install.packages("reshape2")*.
