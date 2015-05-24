# Codebook

This code book describes the tidy data set created as part of the Getting and Cleaning Data course project. The raw data is based on the Human Activity Recognition Using Smartphones dataset. The experiments to gather this data have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

**Note:** 
Information from the original data set has been consolidated. The tidy data set provides the average value of each variable for each activity and each subject.

## Variables used in the tidy data set

The R script transforms multiple data sets provided within the original data into one data set with the following variables:

Variable          | Variable Description
-----------------|------------
subject          | Subject ID who performed the activity (with a range from 1 to 30)
activity         | Activity Description (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
featDomain       | Time domain or frequency domain signals (Time or Freq)
featInstrument   | Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Acceleration signal (Body or Gravity)
featVariable     | Variable (Mean or STD)
featJerk         | Jerk signal
featMagnitude    | Magnitude of the signals calculated using the Euclidean norm
featAxis         | 3-axial signals in the X, Y and Z directions (X, Y, or Z)
count            | Count of data points used to compute the average value
meanValue        | Average of each variable for each activity and each subject


## Variable information

```
## Classes 'grouped_df', 'tbl_df', 'tbl' and 'data.frame':  2310 obs. of  11 variables:
##  $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ activity        : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ featDomain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featInstrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ featJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
##  $ featMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
##  $ featVariable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
##  $ featAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
##  $ count           : int  347 347 347 347 347 347 347 347 347 347 ...
##  $ meanValue       : num  -0.0209 -0.0881 0.0863 -0.6866 -0.451 ...
##  - attr(*, "vars")=List of 8
##   ..$ : symbol subject
##   ..$ : symbol activity
##   ..$ : symbol featDomain
##   ..$ : symbol featAcceleration
##   ..$ : symbol featInstrument
##   ..$ : symbol featJerk
##   ..$ : symbol featMagnitude
##   ..$ : symbol featVariable
##  - attr(*, "drop")= logi TRUE
```

## Tidy dataset output


```
##   subject activity featDomain featAcceleration featInstrument featJerk featMagnitude featVariable featAxis count   meanValue
##1        1  WALKING       Time               NA      Gyroscope       NA            NA         Mean        X   347 -0.02087641
##2        1  WALKING       Time               NA      Gyroscope       NA            NA         Mean        Y   347 -0.08807227
##3        1  WALKING       Time               NA      Gyroscope       NA            NA         Mean        Z   347  0.08626417
##4        1  WALKING       Time               NA      Gyroscope       NA            NA           SD        X   347 -0.68655572
##5        1  WALKING       Time               NA      Gyroscope       NA            NA           SD        Y   347 -0.45097981
##6        1  WALKING       Time               NA      Gyroscope       NA            NA           SD        Z   347 -0.59749614
##7        1  WALKING       Time               NA      Gyroscope       NA     Magnitude         Mean       NA   347 -0.47540479
##8        1  WALKING       Time               NA      Gyroscope       NA     Magnitude           SD       NA   347 -0.49983959
```






