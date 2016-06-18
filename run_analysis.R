#######################################################
# run_analysis.R
#
# This R script file produces a tidy data file that is 
# a summary of data in the  
# Human Activity Recognition Using Smartphones Data Set.
#
# This script must be run from a location containing a folder
# called "data" that contains the data from the experiment.
#
#
# The script does the following
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.
#
# The tidy data set in written to a file called 'tidydata.txt'.
# This can be read into R using the following commands.
#
#  tidydata <- read.table("tidydata.txt", header = TRUE) 
#  View(tidydata)
#
#######################################################

#preamble

library(plyr)
library(dplyr)
library(data.table)


#######################################################
# 1. The following files in the data directory 
# describe the layout of the input data
#
#  - features.txt - the names of the measured features
#  - activity_labels.txt - the assigned activities (1-6)
#
# Read these into tables for use later.
#######################################################
features <- data.table(read.table("data/features.txt", 
                                  stringsAsFactors=FALSE))
setnames(features,c("Column","Label"))

activity_labels <- data.table(read.table("data/activity_labels.txt", 
                                  stringsAsFactors=FALSE))
setnames(activity_labels,c("Index","Name"))



#######################################################
# 2.
# Read the observations from subfolder "data/test".
# Each row of these tables corresponds to a test observation.
#    subject_test  - table of subjects
#    X_test        - table of measurements
#    y_test        - table of observed activities
#######################################################
subject_test <- data.table(read.table("data/test/subject_test.txt"
                                ,  colClasses=c("numeric")
                                ))


X_test <- data.table(read.table("data/test/X_test.txt",
                                stringsAsFactors=FALSE))


y_test <- data.table(read.table("data/test/y_test.txt"
                                , colClasses=c("factor") 
                                ))

#######################################################
# 2.
# Read the observations from subfolder "data/train".
# Each row of these tables corresponds to a training observation.
#    subject_train  - table of subjects
#    X_train        - table of measurements
#    y_train        - table of observed activities
#######################################################

subject_train <- data.table(read.table("data/train/subject_train.txt"
                                      ,  colClasses=c("numeric")
))


X_train <- data.table(read.table("data/train/X_train.txt",
                                stringsAsFactors=FALSE))



y_train <- data.table(read.table("data/train/y_train.txt"
                                , colClasses=c("factor") 
))

#######################################################
# 2.
# Now combine the observations.
# Each row of these tables corresponds to a test or training observation.
#    subject_all  - table of subjects
#    X_all        - table of measurements
#    y_all        - table of observed activities
#######################################################

# combine tables
subject_all <-bind_rows(subject_train,subject_test)
X_all <-bind_rows(X_train,X_test)
y_all <-bind_rows(y_train,y_test)


# give the columns names
# give labels to the 6 activities



setnames(subject_all, c("Subject"))
setnames(y_all,       c("Activity"))

y_all$Activity <- mapvalues(y_all$Activity
                              , from = activity_labels$Index
                              , to   = activity_labels$Name
)

# Decide which of the feature names contain the text
# "mean()" or "std()".
# These are the measurements that we have been asked to extract.



mychosen <- grep("(mean|std)\\(\\)", features$Label)

# Delete all but the chosen columns.

X_all     <- X_all[,mychosen]



# Give nice names to the remaining columns of X_all
# - We replace "-" by "."
# - Remove "()"
# - Make everything lowercase


features  <- features[mychosen,]

features$Label=tolower(features$Label)
features$Label=gsub("\\(\\)",""  , features$Label)
features$Label=gsub("-"     ,"." , features$Label)
features$Label=gsub("bodybody","body" , features$Label)

setnames(X_all, features$Label)


#
# Now glue all the columns together into a table called mytab1.


tidy_tab1 <- bind_cols(subject_all,  X_all, y_all)


#######################################################
# The requested table is mytab1, but with measurements 
# averaged per  each subject/activity combination.
#
# This is the tidy data frame that the project asks for.
# (it is in wide format)
#######################################################

tidy_tab2 <- aggregate(. ~ Subject+Activity, tidy_tab1 ,mean)

#######################################################
#
# Write the aggregated tidied data to a file called 
# 'tidydata.txt'
#
#######################################################

write.table(tidy_tab2,"tidydata.txt",col.names=TRUE)

