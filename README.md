# Getting and Cleaning-Data
##Summary
This project summarizes the values recorded by sensors on a Samsung Galaxy S II smartphone worn by different test subjects performing differnent activities.   There are 30 different subjects performing 6 different activities: Laying, Sitting, Standing, Walking, Walking Downstairs, Walking Upstairs.   The results are the average of 79 variables for each subject and activity.  Therefore the summary contains 180 obserations (30 subjects * 6 activities) and 79 variables for each combination of subject and activity.

The results of the analysis are in the Summary.txt file.

An explanation of the data in Summary.txt is in the Code Book included in the repository

## run_analysis.R file
This R script loads the raw data and creates the Summary.txt file. This section describes the process for converting the raw data into the summary .
The raw data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  Detailed descriptions of the raw data are included in the zip file.  The script requires these files to be located in a subfolder under the working directory "./data/UCI HAR Dataset/"

### Libaries
The script requires the dplyr package to be installed.  

### loading the data
The raw dataset was into two subsets, Training Data and Test Data:  The test data was as follows.  The training data followed the same pattern.

* x_train.txt - 10299 sensor readings for 561 variables. Loaded into the traindata dataframe
* subject_train.txt - the subject number for each of the 10299 sensor readings.  Loaded into the trainsubjects dataframe
* y_train.txt - the number of the activity the subject was performing when each of the 10299 sensor readings was taken.  Loaded into the testactivitynum dataframe

In addition the following files were included in the raw data
* features.txt - the names of the 561 variables in the x_train.txt and x_test.txt files.  Loaded into columnheaders dataset  The names were cleaned up to remove "()" and "-" characters using the make.names function and stored columnheaders$cleannames
* activity_labels.txt - the name of each activity corresponding to the activity number in y_train.txt and y_test.txt

### Step 1 - Merged the Test and Training Data
1.  The traindata dataframe testdata dataframes were merged into the rawdata dataframe using the rbind statement.
2.  Column names were added from columnheaders$cleannames 
3.  The testactivitynum subjects and trainactivitynum dataframes were merged into the activitynum datafrane using the rbind statement (used in step2)
4.  The testsubjects and trainsubjects dataframes were merged into the subjects dataframe using the rbind statement (used in step 2)

The resulting rawdata dataframe containes 10299 oberservations (7352 training observations plus 2947 test obserations) of 561 sensor readings 

### Step 2 Extract only the Mean and Standard Deviation variables
We are only interested in the variables that measure the average or standard deviation of specific sensor variables. The dplyr select statement was used to select only those columns with "mean" or "std" in the name.  79 variables matched this criteria using the grep function.   The results were stored in a dataframe called data.

Columns for the subject number and activity number were added to the data by combinding the rawdata, activitynum,  subjects dataframes using the cbind statement.  

The resulting data dataframe contains 10299 observations of just  79 varaiables along with the Subject Number and Activity number of the observation.

### Step 3 Add Descriptive Activity Name
The descriptive Activity Name was added to the data dataframe by joining the activityname dataframe with the data dataframe using the merge statement.  The common key was the activity number column.

### Step 4 Make the Variable Names more descriptive
The variable names contained a lot of abbreviations.  Using sub and gsub statements the following abbreviations were expanded to make them more descriptive or more readable:

*  t - Time
*  f - Frequency
*  . - [removed dots]
*  mean - Mean
*  Gyro - Gyroscope
*  Mag - Magnitude
*  Acc - Acceleration
*  std - StandardDeviation
*  X - XAxis
*  Y - YAxis
*  Z - ZAxis

### Step 5 Summarize the Data

So far we have 10299 observations of 79 variables for different subjects performing different activities. We summarize these results by taking the average value of each variable for each subject and activity as follows:

1.  Group the data by Subject and Activity Name using the dplyr group_by function.
2.  Calculate the average of each variable for each group using the dplyr summarise_each function.
3.  Sort the results by subject then activity using the dlplyr arrange function.
4.  Append the word "Average" to the begining of each varaible name with the colnames function to indicate we are now measuring the average for the group.

The results were stored in the sumdata dataframe and then output to summary.txt
