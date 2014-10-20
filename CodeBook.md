Coursera
Getting and Cleaning Data
Course Project

**CODE BOOK**

This file describes:
1) the raw datasets on which the tidy data set is based on;
2) the steps taken to transform the raw data into the tidy data set;
3) the variables and data in the tidy data set

———————————————————

**Raw Data**


The data in the file tidydataset.txt is based on the raw data from several files from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The raw data is taken from the following files after unzipping the downloaded data:

**Descriptive Data**

- activity_labels.txt:  Contains the 6 activity IDs and the descriptions of the activities.

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

- features.txt:  Contains the names of the features. There are 561 features. Used as the initial variable names.

**Training Data**

- train/subject_train.txt:  Contains the 7352 observations of subject IDs in the training dataset

- train/X_train.txt:  Contains the 7352 observations for the 561 measurement variables in the training dataset

- train/y_train.txt:  Contains the 7352 activity IDs for the subjects in the training dataset

**Test Data**

- test/subject_test.txt:  Contains the 2947 observations of subject IDs in the test dataset

- test/X_test.txt:  Contains the 2947 observations for the 561 measurement variables in the test dataset

- test/y_test.txt:  Contains the 2947 activity IDs for the subjects in the test dataset

———————————————————

**Work Performed on the Raw Data**

Step 1: The descriptive, training and test data is read into R

Step 2: Merged the descriptive data and the training data to obtain the training dataset (“trainData”)

Step 3: Merged the descriptive data and the test data to obtain the test dataset (“testData”)

Step 4: Merged the training data and the test data to obtain a merged dataset (“mergedData”)

Step 5: Created a new data frame with only the measurements on the mean and standard deviation (“extractData”)
	
	Note that the only the variables with mean() and std() are retained. 

	Variables with “meanFreq” and “gravityMean” have not been included.

	This leaves 66 variables that remain.

Step 6: Replaced the activity IDs in the dataset with the description of the activities

Step 7: Replaced the variable names.

	Note: a function is defined that finds specific strings in a pattern list 
		and replaces them with more descriptive strings in a replacement list


Pattern => Replacement

Acc => Acceleration
Gyro => Gyroscope
Mag => Magnitude
mean => Mean
std => StandardDeviation
t => time
f => frequency
-X => OfX
-Y => OfY
-Z => OfZ


Step 8: Prepare to compute the summary dataset by “Melting” the wide-format dataset into a long-format (“meltedData”)

Step 9: “Cast” the long-format data into a wide-format dataset containing the average
	of each variable for each activity and each subject (“subjectActivityMeans”)

Step 10: Write the data to a file (“tidydataset.txt”)


———————————————————

** Tidy data set**

The resulting data set in tidydataset.txt contains 180 observations (30 subjects x 6 activities) by 68 variables (subject ID, activity and 66 mean and std averages)

The list of variables are:

1 subject
2 activity
3 timeBodyAccelerationMeanOfX
4 timeBodyAccelerationMeanOfY
5 timeBodyAccelerationMeanOfZ
6 timeBodyAccelerationStandardDeviationOfX
7 timeBodyAccelerationStandardDeviationOfY
8 timeBodyAccelerationStandardDeviationOfZ
9 timeGravityAccelerationMeanOfX
10 timeGravityAccelerationMeanOfY
11 timeGravityAccelerationMeanOfZ
12 timeGravityAccelerationStandardDeviationOfX
13 timeGravityAccelerationStandardDeviationOfY
14 timeGravityAccelerationStandardDeviationOfZ
15 timeBodyAccelerationJerkMeanOfX
16 timeBodyAccelerationJerkMeanOfY
17 timeBodyAccelerationJerkMeanOfZ
18 timeBodyAccelerationJerkStandardDeviationOfX
19 timeBodyAccelerationJerkStandardDeviationOfY
20 timeBodyAccelerationJerkStandardDeviationOfZ
21 timeBodyRawGyroscopeMeanOfX
22 timeBodyRawGyroscopeMeanOfY
23 timeBodyRawGyroscopeMeanOfZ
24 timeBodyRawGyroscopeStandardDeviationOfX
25 timeBodyRawGyroscopeStandardDeviationOfY
26 timeBodyRawGyroscopeStandardDeviationOfZ
27 timeBodyRawGyroscopeJerkMeanOfX
28 timeBodyRawGyroscopeJerkMeanOfY
29 timeBodyRawGyroscopeJerkMeanOfZ
30 timeBodyRawGyroscopeJerkStandardDeviationOfX
31 timeBodyRawGyroscopeJerkStandardDeviationOfY
32 timeBodyRawGyroscopeJerkStandardDeviationOfZ
33 timeBodyAccelerationMagnitudeMean
34 timeBodyAccelerationMagnitudeStandardDeviation
35 timeGravityAccelerationMagnitudeMean
36 timeGravityAccelerationMagnitudeStandardDeviation
37 timeBodyAccelerationJerkMagnitudeMean
38 timeBodyAccelerationJerkMagnitudeStandardDeviation
39 timeBodyRawGyroscopeMagnitudeMean
40 timeBodyRawGyroscopeMagnitudeStandardDeviation
41 timeBodyRawGyroscopeJerkMagnitudeMean
42 timeBodyRawGyroscopeJerkMagnitudeStandardDeviation
43 frequencyBodyAccelerationMeanOfX
44 frequencyBodyAccelerationMeanOfY
45 frequencyBodyAccelerationMeanOfZ
46 frequencyBodyAccelerationStandardDeviationOfX
47 frequencyBodyAccelerationStandardDeviationOfY
48 frequencyBodyAccelerationStandardDeviationOfZ
49 frequencyBodyAccelerationJerkMeanOfX
50 frequencyBodyAccelerationJerkMeanOfY
51 frequencyBodyAccelerationJerkMeanOfZ
52 frequencyBodyAccelerationJerkStandardDeviationOfX
53 frequencyBodyAccelerationJerkStandardDeviationOfY
54 frequencyBodyAccelerationJerkStandardDeviationOfZ
55 frequencyBodyRawGyroscopeMeanOfX
56 frequencyBodyRawGyroscopeMeanOfY
57 frequencyBodyRawGyroscopeMeanOfZ
58 frequencyBodyRawGyroscopeStandardDeviationOfX
59 frequencyBodyRawGyroscopeStandardDeviationOfY
60 frequencyBodyRawGyroscopeStandardDeviationOfZ
61 frequencyBodyAccelerationMagnitudeMean
62 frequencyBodyAccelerationMagnitudeStandardDeviation
63 frequencyBodyBodyAccelerationJerkMagnitudeMean
64 frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
65 frequencyBodyBodyRawGyroscopeMagnitudeMean
66 frequencyBodyBodyRawGyroscopeMagnitudeStandardDeviation
67 frequencyBodyBodyRawGyroscopeJerkMagnitudeMean
68 frequencyBodyBodyRawGyroscopeJerkMagnitudeStandardDeviation

**Description of variables** 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

time: time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise

frequency: a Fast Fourier Transform (FFT) was applied to some of these signals

Acceleration: The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Jerk: Body linear acceleration and angular velocity were derived in time to obtain Jerk signals . 

Magnitude: Magnitude of these three-dimensional signals were calculated using the Euclidean norm. 


