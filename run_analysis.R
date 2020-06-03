## What does this script : ( warning, I changed the order of coursera)
## 1 - Merges the training and the test sets to create one data set.
## 2 - Appropriately labels the data set with descriptive variable names.
##         -->  Uses the file features.txt to name the colomn of the data.
## 3 - Extracts only the measurements on the mean and standard deviation for each measurement.
## 4 - Uses descriptive activity names to name the activities in the data set
## 5 - From the data set in step 4, creates a second, independent tidy data set with the average
##     of each variable for each activity and each subject.


## The data is already available on the folder "UCI HAR Dataset". It comes from:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###########################################################################################
## 1.Merges the training and the test sets to create one data set.
###########################################################################################

# train data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)    # features data
activity_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)

# test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE) #features data
activity_test  <- read.table("./UCI HAR Dataset/test/Y_test.txt" ,header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

# merge {train, test} data
data <- rbind(x_train, x_test)
activity_data <- rbind(activity_train, activity_test)
subject_data <- rbind(subject_train, subject_test)

# lets remove the variable we will not use anymore
rm(x_train, activity_train, subject_train, x_test, activity_test, subject_test)

#############################################################################################
## 2. Appropriately labels the data set with descriptive variable names.
#############################################################################################

# I take the feature's names from the file features.txt
data_features_names <- read.table("./UCI HAR Dataset/features.txt", head=FALSE)
# data_features_names looks like : 
#  V1   V2
#  1    feature_name_1
#  2    feature_name_2
#  ..   ...
# I would like to take the colomn V2 to use it to name the variable of the table data.
names(data)<- data_features_names$V2

# I name the other columns : subject (for subject_data) and activity (for activity_data)
names(subject_data)<-c("subject")
names(activity_data)<- c("activity")

# lets remove the variable we will not use anymore
rm(data_features_names)



##############################################################################################
## 3.Extracts only the measurements on the mean and standard deviation for each measurement
##############################################################################################
# The measurement on the mean are called XXX-mean()-YYY where XXX and YYY vary.
# The measurement on the standard deviation are called XXX-std()-YYY.
# So we have to select the names where we can grep the expression "mean()" or "std()"

data_mean_std <-data[,grep("(mean|std)\\(",names(data))]


# Now that I have extract only the features with mean and std, I will add the 2 others columns 
# of the 2 other tables to have only one interesting table.
data_mean_std <- cbind(subject_data,activity_data,data_mean_std)
# lets remove the variable we will not use anymore
rm(subject_data, activity_data)


##############################################################################################
## 4.Uses descriptive activity names to name the activities in the data set
##############################################################################################
# In the table, the activities are lables with numbers [1, 5]. The name of the activity that 
# that correspond is in the file "activity_labels.txt".
# We will use the name of the activity to replace the numbers.
activity_labels <-read.table("UCI HAR Dataset/activity_labels.txt",head=FALSE)

# activity_labels looks like:
# V1    V2
#  1    WALKING
#  2    ...
# we must match V1 with the number present in the column activity, and we replace it with the expression 
# of the column V2 of activity_labels
data_mean_std$activity <- activity_labels[match(data_mean_std$activity, activity_labels$V1), "V2"]
# lets remove the variable we will not use anymore
rm(activity_labels)

###############################################################################################
##5.From the data set in step 4, creates a second, independent tidy data set with the average
##     of each variable for each activity and each subject
##############################################################################################
library(plyr)
data_per_activities_and_subject <-ddply(data_mean_std, c("subject", "activity"), numcolwise(mean))

# uncomment the line bellow to save this data into a new file called "tidy_data_grouped_per_activities_and_subjects.txt"
# write.table(data_per_activities_and_subject , file="tidy_data_grouped_per_activities_and_subjects.txt", row.names = TRUE) 




