# Code Book

This code book describes the variables, the data, and any transformations or work that have been performed to clean up the data

## The script “run_analysis.R” works as the following:

##### Step 1: Merging the training and the test sets to create one data set.

"UCI_HAR_Dataset/train/X_train.txt” and “UCI_HAR_Dataset/test/X_test.txt” are merged together into a 10299 x 561 dataframe.

"UCI_HAR_Dataset/train/y_train.txt” and “UCI_HAR_Dataset/test/y_test.txt” are merged together into a 10299 x 1 dataframe with activity IDs.

"UCI_HAR_Dataset/train/subject_train.txt” and “UCI_HAR_Dataset/test/subject_test.txt” are merged together into a 10299 x 1 dataframe with subject IDs.

##### Step 2: Extracting only the measurements on the mean and standard deviation for each measurement. 

Data are read from “UCI_HAR_Dataset/features.txt”

Measurements on the mean and standard deviation are only extracted for each measurement

The results is 10299 x 66 dataframe

Only 66 of the attributes are measurements on the mean and standard deviation

##### Step 3: Uses descriptive activity names to name the activities in the data set

Read the data “UCI_HAR_Dataset/activity_labels.txt”

Use descriptive activity names to name the activities in the data set (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying)

##### Step 4: Appropriately labels the data set with descriptive variable names. 

All feature names and activity names are cleaned and converted to lower case

Underscores and brackets are removed

Dataframe containing features 10299 x 66 and dataframe containing activity labels and subject IDs are merged together into a 10299x68 dataframe saved as "UCI_HAR_Dataset/clean_data_1.txt"

The names of the attributes are similar to the following: (tbodyacc-mean-x, tbodyacc-mean-y, tbodyacc-mean-z, …, etc)

##### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Tidy data set with averages of each variable for each activity and each subject is created 180 x 68 dataframe and saved as “UCI_HAR_Dataset/clean_data_2.txt” 
