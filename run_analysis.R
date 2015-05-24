# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

run_analysis <- function() {

  # Required libraries
  library(dplyr)
  
  # Load the data sets    
  dfSubjectTrain =  read.table("./UCI HAR Dataset/train/subject_train.txt")
  dfSubjectTest =   read.table("./UCI HAR Dataset/test/subject_test.txt")
  dfTrainLabels =   read.table("./UCI HAR Dataset/train/Y_train.txt")
  dfTestLabels =    read.table("./UCI HAR Dataset/test/Y_test.txt")
  dfFeatures =      read.table("./UCI HAR Dataset/features.txt",  stringsAsFactors = FALSE)
  dfActivities =    read.table("./UCI HAR Dataset/activity_labels.txt")  
  dfTest =          read.table("./UCI HAR Dataset/test/X_test.txt")
  dfTrain =         read.table("./UCI HAR Dataset/train/X_train.txt")
  
  # Merge subject data and rename column
  dfSubject = rbind(dfSubjectTrain, dfSubjectTest)
  dfSubject = rename(dfSubject, subject = V1)
  
  # Merge label data (activity) and rename column
  dfLabel = rbind(dfTrainLabels, dfTestLabels)
  dfLabel = rename(dfLabel, activityNumber = V1)
  
  # Merge train and test data
  df = rbind(dfTrain, dfTest)
  
  # Filter columns (only for mean and std), create logical vector for subsetting
  validColumns = grepl("mean\\(|std\\(", dfFeatures$V2)
  df = df[,validColumns]
  
  # Get feature names, offset them with vector for valid feature names
  validFeatureColumns = dfFeatures$V2[ValidColumns]
  colnames(df) = validFeatureColumns
  
  # Combine everything
  dfLabel = merge(dfLabel, dfActivities, by.x = "activityNumber", by.y = "V1", all.x = TRUE)
  dfLabel = rename(dfLabel, activity = V2)
  dfSubject = cbind(dfSubject, dfLabel)    
  df = cbind(dfSubject, df)
  
  # Melt data frame
  df = melt(df,id=c("subject", "activityNumber", "activity"),variable.name="featureCode")  
  
  # Add feature columns, use helper function to access feature name
  grepFeature <- function (regex) {
    grepl(regex, df$featureCode)
  }
  
  # Two matrices are created. Matrix m1 provides the lookup values. Matrix m2 provides
  # TRUE/FALSE values as a result of the regular expression analysing the feature code
  # in the main data frame. A new column in the main data frame is created with a factor
  # variable using the dimensions of each feature. If no dimension is available, NA is used.  
  
  # Features with 2 categories
  n <- 2
  m1 <- matrix(seq(1, 2), nrow=n)
  m2 <- matrix(c(grepFeature("^t"), grepFeature("^f")), ncol=nrow(m1))
  df$featDomain <- factor(m2 %*% m1, labels=c("Time", "Freq"))
  m2 <- matrix(c(grepFeature("Acc"), grepFeature("Gyro")), ncol=nrow(m1))
  df$featInstrument <- factor(m2 %*% m1, labels=c("Accelerometer", "Gyroscope"))
  m2 <- matrix(c(grepFeature("BodyAcc"), grepFeature("GravityAcc")), ncol=nrow(m1))
  df$featAcceleration <- factor(m2 %*% m1, labels=c(NA, "Body", "Gravity"))
  m2 <- matrix(c(grepFeature("mean()"), grepFeature("std()")), ncol=nrow(m1))
  df$featVariable <- factor(m2 %*% m1, labels=c("Mean", "SD"))
  
  # Features with 1 category
  df$featJerk <- factor(grepFeature("Jerk"), labels=c(NA, "Jerk"))
  df$featMagnitude <- factor(grepFeature("Mag"), labels=c(NA, "Magnitude"))
  
  # Features with 3 categories
  n <- 3
  m1 <- matrix(seq(1, 3), nrow=n)
  m2 <- matrix(c(grepFeature("-X"), grepFeature("-Y"), grepFeature("-Z")), ncol=nrow(m1))
  df$featAxis <- factor(m2 %*% m1, labels=c(NA, "X", "Y", "Z"))  
  
  # Create groups  
  df = group_by(df, subject, activity, featDomain, featAcceleration, featInstrument, featJerk, featMagnitude, featVariable, featAxis)
  dfByGroups = summarize(df,count=n(), meanValue=mean(value))
  
  # Save as tidy data set in workspace
  write.table(dfByGroups, file="ActivityRecognitionUsingSmartPhones.txt",sep = ";", col.names = colnames(dfByGroups), row.name = FALSE)
  
  
}