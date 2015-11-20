library(plyr)
library(reshape2)

## Assuming the zip file is already been downloaded

## Step 1: Load Activity and subject datasets
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

features_mean_std <- grep(".*Mean.*|.*Std.*", features[,2]) ## integer vector


## Step 2: Load the datasets

## Load necessary(mean / std) training sets and other datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_mean_std] ##subsetting only needed columns
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_data <- cbind(subject_train, y_train, x_train)

## Load necessary(mean / std) test sets and other datasets
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_mean_std] ##subsetting only needed columns
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_data <- cbind(subject_test, y_test, x_test)

## Step 3: Merge datasets
data <- rbind(train_data, test_data)
names(data) <- c("subject", "activity", features[features_mean_std, 2])

## Step 4: Factoring subject and activity
data$activity <- factor(data$activity, levels = activity_labels[, 1], labels = activity_labels[, 2])
data$subject <- as.factor(data$subject)

## Step 5: Get tidy dataset with the average of each value with subject and activity
data_melt <- melt(data, id = c("subject", "activity"))
data_mean <- dcast(data_melt, formula = subject + activity ~ variable, mean)

## Step 6: Write in to tidy.txt
write.table(data_mean, "tidy.txt", row.names = FALSE, quote = FALSE)

##Complete
