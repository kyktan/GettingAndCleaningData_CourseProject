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
	
	Note that only the variables subject, activity and those with mean and std() are retained. This leaves 88 variables.

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

The resulting data set in tidydataset.txt contains 180 observations (30 subjects x 6 activities) by 88 variables (subject ID, activity and 86 mean and std averages)

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
21 timeBodyGyroscopeMeanOfX
22 timeBodyGyroscopeMeanOfY
23 timeBodyGyroscopeMeanOfZ
24 timeBodyGyroscopeStandardDeviationOfX
25 timeBodyGyroscopeStandardDeviationOfY
26 timeBodyGyroscopeStandardDeviationOfZ
27 timeBodyGyroscopeJerkMeanOfX
28 timeBodyGyroscopeJerkMeanOfY
29 timeBodyGyroscopeJerkMeanOfZ
30 timeBodyGyroscopeJerkStandardDeviationOfX
31 timeBodyGyroscopeJerkStandardDeviationOfY
32 timeBodyGyroscopeJerkStandardDeviationOfZ
33 timeBodyAccelerationMagnitudeMean
34 timeBodyAccelerationMagnitudeStandardDeviation
35 timeGravityAccelerationMagnitudeMean
36 timeGravityAccelerationMagnitudeStandardDeviation
37 timeBodyAccelerationJerkMagnitudeMean
38 timeBodyAccelerationJerkMagnitudeStandardDeviation
39 timeBodyGyroscopeMagnitudeMean
40 timeBodyGyroscopeMagnitudeStandardDeviation
41 timeBodyGyroscopeJerkMagnitudeMean
42 timeBodyGyroscopeJerkMagnitudeStandardDeviation
43 frequencyBodyAccelerationMeanOfX
44 frequencyBodyAccelerationMeanOfY
45 frequencyBodyAccelerationMeanOfZ
46 frequencyBodyAccelerationStandardDeviationOfX
47 frequencyBodyAccelerationStandardDeviationOfY
48 frequencyBodyAccelerationStandardDeviationOfZ
49 frequencyBodyAccelerationMeanFrequencyOfX
50 frequencyBodyAccelerationMeanFrequencyOfY
51 frequencyBodyAccelerationMeanFrequencyOfZ
52 frequencyBodyAccelerationJerkMeanOfX
53 frequencyBodyAccelerationJerkMeanOfY
54 frequencyBodyAccelerationJerkMeanOfZ
55 frequencyBodyAccelerationJerkStandardDeviationOfX
56 frequencyBodyAccelerationJerkStandardDeviationOfY
57 frequencyBodyAccelerationJerkStandardDeviationOfZ
58 frequencyBodyAccelerationJerkMeanFrequencyOfX
59 frequencyBodyAccelerationJerkMeanFrequencyOfY
60 frequencyBodyAccelerationJerkMeanFrequencyOfZ
61 frequencyBodyGyroscopeMeanOfX
62 frequencyBodyGyroscopeMeanOfY
63 frequencyBodyGyroscopeMeanOfZ
64 frequencyBodyGyroscopeStandardDeviationOfX
65 frequencyBodyGyroscopeStandardDeviationOfY
66 frequencyBodyGyroscopeStandardDeviationOfZ
67 frequencyBodyGyroscopeMeanFrequencyOfX
68 frequencyBodyGyroscopeMeanFrequencyOfY
69 frequencyBodyGyroscopeMeanFrequencyOfZ
70 frequencyBodyAccelerationMagnitudeMean
71 frequencyBodyAccelerationMagnitudeStandardDeviation
72 frequencyBodyAccelerationMagnitudeMeanFrequency
73 frequencyBodyBodyAccelerationJerkMagnitudeMean
74 frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
75 frequencyBodyBodyAccelerationJerkMagnitudeMeanFrequency
76 frequencyBodyBodyGyroscopeMagnitudeMean
77 frequencyBodyBodyGyroscopeMagnitudeStandardDeviation
78 frequencyBodyBodyGyroscopeMagnitudeMeanFrequency
79 frequencyBodyBodyGyroscopeJerkMagnitudeMean
80 frequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation
81 frequencyBodyBodyGyroscopeJerkMagnitudeMeanFrequency
82 angletimeBodyAccelerationMeangravity
83 angletimeBodyAccelerationJerkMeangravityMean
84 angletimeBodyGyroscopeMeangravityMean
85 angletimeBodyGyroscopeJerkMeangravityMean
86 angleOfXgravityMean
87 angleOfYgravityMean
88 angleOfZgravityMean


**Description of variables** 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

time: time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise

frequency: a Fast Fourier Transform (FFT) was applied to some of these signals

Acceleration: The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Jerk: Body linear acceleration and angular velocity were derived in time to obtain Jerk signals . 

Magnitude: Magnitude of these three-dimensional signals were calculated using the Euclidean norm. 


