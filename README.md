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
file "tidy_data_grouped_per_activities_and_subjects.txt". If every goes well, it must be the same.
you can retrive it with the command:
tidy_data <- read.csv("tidy_data_grouped_per_activities_and_subjects.txt", sep="")

