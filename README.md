# Getting_and_cleaning_data_Project
Instructions for project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps carried out to complete this project:

Get the data and unzip for the run_analysis.r
For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:
•	activity_labels.txt
•	features.txt
•	test/subject_test.txt
•	test/X_test.txt
•	test/y_test.txt
•	train/subject_train.txt
•	train/X_train.txt
•	train/y_train.txt

Step 1: Load activity and subject datasets from "activity_labels.txt" and "features.txt".
Features.txt has the column names. Please look into the readme.txt unzipped from the download file.
We are asked to extract the mean and the standard deviation values and last few columns are labeled as *Mean and *Std. So we substitute rest of the column names which contains *mean* and *std* like, tBodyAcc-mean()-X as  tBodyAcc Mean –X from the features.txt.
Find the column numbers of the features table which matches the pattern Mean or Std in their names.
These are the required columns.

Step 2: Load the datasets
Data is given in test and train folders as X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt and subject_train.txt
While loading, subset only the necessary columns from the X_train.txt and X_test.txt.
Make train datasets, test datasets into separate tables by column binding.

Step 3: Merge datasets by row binding

Step 4: Factoring by subject and activity

Step 5: Get tidy dataset by melting the whole data into one long table and again cast it into tidy wide table with activity, subject and rest other X, Y, Z variables.

Step 6: Write into tidy.txt

