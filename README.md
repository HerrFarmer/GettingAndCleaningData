# Getting and Cleaning Data


- Author: HerrFarmer
- URL: https://github.com/HerrFarmer/GettingAndCleaningData

The code in this repository is based on the Getting and Cleaning Data **course project**.

## Context:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

You should create one R script called run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Content
This repository contains the following files and folders:

- UCI HAR Dataset
- run_analysis.r
- CodeBook.md

The folder UCI HAR Dataset contains the raw data processed by the R script run_analysis. *Note that data in subfolder 'Inertial Signals' is not used.*

The R script first loads all the datasets into data frames and then starts to merge:

- Subject data for training and test.
- Label data for training and test (the activities).
- Data containing the measurements for training and test.

It then filters the main data set for variables containing 'mean' and 'std' measurements only:

- The data frame containing the measurements is filtered using a logical vector with the help of a regular expression to identify all columns needed.
- The same technique is applied to the data frame containing the feature descriptions. The resulting vector of valid feature names is then used to provide the column names for the data frame containing the measurements.

After the right columns have been identified, everything is put together:

- Merge activities with the activity labels
- Merge subjects with activities
- Merge subjects with the measurements

Once everything is combined, the data frame is transformed from a wide into a long form using the melt functionality. From there, new columns are added to break down the feature name (because in the raw dataset, the feature name describes multipe features).

The last step of the script is to create multiple groups and to summarize all values using the mean functionality. The new tidy dataset is saved as a text file: ActivityRecognitionUsingSmartPhones.txt.

## Usage

- Open the R script run_analysis.r. It contains function run_analysis.
- Make sure that in your workspace you have a folder named 'UCI HAR Dataset' containing the data.
- Run the function. It will produce the tidy data set as a text file.






