# Getting-and-Cleaning-Data

This REPO contains a script to tidy up and clean the data made available
on an experiment to detect human activity using sensor readings from smartphones.
This is done by running the R script run_analysis.R.
The tidy data file is written to a data table file called tidydata.txt. For details see the CookBook.md document.

The REPO contains:


- run_analysis.R - An R script to produce the tidy data.

- tidydata.txt - The tidy data produced by the run_analysis.R. This can be read into R using the read.table command.

- CookBook.md - Detailed description of the run_analysis.R and 
a description of the tidy data



The scrtipt works as follows.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


For more information read the CookBook.md file.
