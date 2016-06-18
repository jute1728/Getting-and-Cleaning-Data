# Code Book 

## Intoduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

This REPO contains a script to tidy up and clean the data made available
on an experiment to detect human activity using sensor readings from smartphones.

## Data source


The data linked to below represent data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone. A full description of the experiment the data and other background information is available here:

[Human Activity Recognition (HAR) Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

We will take as input the  publicly available data from the experiment that can be downloaded in zip format from here:

[HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)



Further information is contained in the following article.

[[1]](https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.




## Feature Selection 


The features selected for this database come from the accelerometer 
and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain 
signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
 Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity 
were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
 Also the magnitude of these three-dimensional signals were calculated using 
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBody AccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these
 signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Various variables were estimated from these signals. We are only interested in the following 2 variables.

- mean(): Mean value
- std(): Standard deviation- 



## Units

All variables have been scaled so that the readings lie in the rangle [-1,1].


## Cleaning and transformations


The data made available at the website was tidied and cleaned using an R script called run_analysis.R that is also available in the REPO. It performs the following.


1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Cleaned variable names

The names of the cleaned variables are slight variants on the names 
listed in the feature selection section. Changes: everything is lowercase, the separator is always a single full stop ('.'). The Whether 
the variable is a mean or a standard deviation is indicated by the last
part of the name.

E.g.

- tbodyacc.x.mean
- tbodyacc.x.std

indicate the mean value (resp. standard deviation) of the x-component of the tBodyAcc measurement.



## Running the script

The R script run_analysis.R  produces a tidy data file that is 
a summary of data in the  Human Activity Recognition Using Smartphones Data Set mentioned above.

This script must be run from a location containing a folder
called "data" that contains the data from the experiment 
([HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)).


The tidy data is written to a file called 'tidydata.txt'.
This can be read into R using the following commands.

```
 library(data.table)
 tidydata <- read.table("tidydata.txt", header = TRUE) 
 View(tidydata)
```
