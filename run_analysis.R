# Set working directory
setwd("/Users/Ahmed")

# 1. Merging the training and the test sets to create one data set.

var1 <- read.table("UCI_HAR_Dataset/train/X_train.txt")
var2 <- read.table("UCI_HAR_Dataset/test/X_test.txt")

X <- rbind(var1, var2)

var3 <- read.table("UCI_HAR_Dataset/train/y_train.txt")
var4 <- read.table("UCI_HAR_Dataset/test/y_test.txt")

Y <- rbind(var3, var4)

var5 <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
var6 <- read.table("UCI_HAR_Dataset/test/subject_test.txt")

S <- rbind(var5, var6)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement.

## Read the features
features <- read.table("UCI_HAR_Dataset/features.txt")

## Grab mean and stddev features
features_mean_stddev <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, features_mean_stddev]

names(X) <- features[features_mean_stddev, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## Check the dataframe
X[1,]

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI_HAR_Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

names(S) <- "subject"
clean_data <- cbind(S , Y , X)
write.table(clean_data, "UCI_HAR_Dataset/clean_data_1.txt")

## Check the cleaned data
clean_data[1:5,1:5]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(clean_data)[2]

## Define the results
result = clean_data[1:(numSubjects*numActivities), ]

## For loop to create the data frame
row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        var <- clean_data[clean_data$subject==s & clean_data$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(var[, 3:numCols])
        row = row + 1
    }
}

## Write the text file
write.table(result, "UCI_HAR_Dataset/clean_data_2.txt")

## Check sample of the text file
result[1:2,1:5]
