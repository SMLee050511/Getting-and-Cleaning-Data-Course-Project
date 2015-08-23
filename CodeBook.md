CodeBook.md
CodeBook
This code book describes the data and transformations.
The Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Transformations
The following are the transformations:
1.	Load the Testing Data Sets for Activity, Subjects, and Features to be merged with Training Data Sets at later step
•	X_train.txt is read into table Features
•	y_train.txt is read into table Activities
•	subject_train.txt is read into table Subjects
2.	Bind frames together, providing 'features' vector as the columns names - Testing Data Set
3.	Load the Training Data Sets for Activity, Subjects, and Features to be merged with Testing Data Sets at later step

•	X_test.txt is read into table Features
•	y_test.txt is read into table Activities
•	subject_test.txt is read into table Subjects
4.	Bind frames together, providing 'features' vector as the columns names - Training Data Se

5.	Bind testing and training datasets from 2 and 4 to create CombineDataSet.

6.	Extracts only the measurements on the mean and standard deviation for each measurement

7.	Labels the activities with descriptive variable names.
•	Acronyms in variable names such as ‘Acc’, ‘Gyro’, ‘Mag’, ’t’ and ‘f’ are replaced with descriptive labels such as ‘Accelerometer’, ‘Gyroscope’, ‘Magnitude’, ‘Time’ and ‘Frequency’.
8.	TidyData is created and written into Tidy_Data.txt
Output Data Set
The output data tidy_data.txt is a space delimited value file. The header line contains the names of the variables. It contains the mean and standard deviation values of the data contained in the input files

Variables description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag
