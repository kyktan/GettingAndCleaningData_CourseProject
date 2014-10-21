# =========================================================
# Coursera
# Getting and Cleaning Data
# Course Project
# =========================================================

library(reshape2)

# ---------------------------------------------------------
# Read in the descriptive data for both train and test sets
# ---------------------------------------------------------

# Read in the file containing the 561 feature names
features <- read.table("./UCI HAR Dataset/features.txt")

# Read in the file containing the 6 activity numbers and descriptions
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                             col.names=c("activityId", "activityName"))

# ---------------------------------------------------------
# Read in the subject and feature data from the train data
# ---------------------------------------------------------

# Read in the file containing the subject IDs
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                           col.names=c("subject"))

# Read in the file containing the training dataset
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                      col.names=features$V2, check.names=FALSE)

# Read in the file containing the activity IDs for each row
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                      col.names=c("activity"))

# Merge the subject IDs, activity data and feature data together
trainData <- cbind(subjectTrain, ytrain, xtrain)

# ---------------------------------------------------------
# Read in the subject and feature data from the test data
# ---------------------------------------------------------

# Read in the file containing the subject IDs
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names=c("subject"))

# Read in the file containing the training dataset
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                     col.names=features$V2, check.names=FALSE)

# Read in the file containing the activity IDs for each row
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                     col.names=c("activity"))

# Merge the subject IDs, activity data and feature data together
testData <- cbind(subjectTest, ytest, xtest)

# ---------------------------------------------------------
# 1. Merges the training and test sets to create one data set
# ---------------------------------------------------------

# Add a new column to the train and test data to indicate data type 
# ie. train or test
trainData$dataType <- rep("train", nrow(trainData))
testData$dataType <- rep("test", nrow(testData))

# Then, merge the training and test data into one data set
mergedData <- rbind(trainData, testData)

# ---------------------------------------------------------
# 2. Extract only the measurements on the mean and standard deviation
# ---------------------------------------------------------

# Get the column numbers that contain mean() and std()
# The "meanFreq" and gravityMean" items have (intentionally) been left out
keepCols <- sort(c(grep("mean\\(\\)", names(trainData)), 
                   grep("std\\(\\)", names(trainData))))

# Extract out the columns containing mean and std
extractData <- mergedData[ , c(1, 2, keepCols)]

# ---------------------------------------------------------
# 3. Use descriptive activity names to name activities in the data set
# ---------------------------------------------------------

# Replace the activity IDs with the more descriptive activity names
extractData$activity <- activityLabels[match(extractData$activity, activityLabels$activityId), 
                                     c("activityName")]

# ---------------------------------------------------------
# 4. Approx. label the dataset with descriptive variable names
# ---------------------------------------------------------

# Features come from accelerometer (Acc) and gyroscope (Gyro)
# Acceleration signal separated into body (Body) and gravity (Gravity) acceleration
# AccJerk: linear acceleration
# GyroJerk: angular velocity
# Mag: magnitude of XYZ signals; Euclidean norm of 3-D signals
# t: time domain signal
# f: frequency domain signal

pattern <- c("Acc", "Gyro", "Mag", "^t", "^f", "-",
             "mean\\(\\)", "std\\(\\)", "X", "Y", "Z")

replacement <- c("Acceleration", "Gyroscope", "Magnitude", "time", "frequency", "",
                 "Mean", "StandardDeviation", "OfX", "OfY", "OfZ")

# Define a function to find and replace the variable names according to pattern
findAndReplace <- function(astring, pattset, replset) {
    if (length(pattset) != length(replset)) {
        print("Error. Pattern set and replacement set are not the same length!")
    } else {
        for (i in 1:length(pattset)) {
            astring <- gsub(pattset[i], replset[i], astring)
        }
        astring
    }
}

# Apply the renaming function above to the variable names
newVarNames <- sapply(names(extractData), findAndReplace, pattset=pattern, replset=replacement)
newVarNames <- unname(newVarNames)

# Rename the columns
colnames(extractData) <- newVarNames

# ---------------------------------------------------------
# 5. Create a second independent tidy data set with
#    average of each variable for each activity and each subject
# ---------------------------------------------------------

# Melt the dataframe to turn it from wide to long
meltedData <- melt(extractData, id=c("subject", "activity"))

# Cast the long dataset to get means for each variable for each subject-activity
subjectActivityMeans <- dcast(meltedData, subject + activity ~ variable, mean)

# Write the data to a file for uploading
write.table(subjectActivityMeans, file="tidydataset.txt", row.names=FALSE)

