# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. It comes with the coursera course.

The data to tidy is in the folder "UCI HAR Dataset" and comes with a documentation inside.

Please, check your plyr package is well installed, or install it by running this command:
> install.packages("plyr")

Then you can run the script "run_analysis.R".
It will create :
- data : dataset that contain all the data including training and testing data.
- data_mean_std : dataset that contains all the measurements of mean and standard deviations
- data_per_activities_and_subject : dataset with the average of each variable for each activity and each subject

Information : the last dataset (data_per_activities_and_subject) is already saved into the repository into the 
file "tidy_data_grouped_per_activities_and_subjects.txt". If everything goes well, it must be the same.

## What does the script run_analysis ?

(warning, I changed the order of coursera)
1. Merges the training and the test sets to create one data set.
2. Appropriately labels the data set with descriptive variable names.
         -->  Uses the file features.txt to name the colomn of the data.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average
     of each variable for each activity and each subject.


The data is already available on the folder "UCI HAR Dataset". It comes from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

