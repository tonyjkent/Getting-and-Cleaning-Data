# Summary.txt 
# Variables
Summary.txt summarizes sensors data collected from people wearing a Sansung Glaxaxy S II smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration and gravity.
The gravitational force is assumed to have only low frequency components
, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from
the time and frequency domain. See 'features_info.txt' for more details. 


##Group Variables
Subject : This is an integer the identifies the person who was wearing the phone
ActivityName: This is the acticity the person was performing when the sensors were read. 
It can be Laying, Sitting, Standing, Walking, Walking Downstairs or Walking Upstairs
Activity Num: This an integer, corresponding to the ActiityName. 1=Walking, 2=Walking Upstairs, 3=Walking Downstairs
4=Sitting, 5=Standing, 6=Laying

##Sensor Variables
The remainder of the file consists of 79 variables.  Each variable is the average of the sensor readings for the subject
and activity, so each column name is prefixed with <b>"Average"</b>
The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time)
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

After the word Average, the second word in the column name is either <b>Time</b> or <b>Freq</b> indicate wheindicates
whether the column from the time domain or frequency domain.  Thus each column name starts with <b>AverageTime</b> or
<b>AverageFreq</b>

The next part of the column name describes the sensor measurement:

<b>BodyAcceleration</b> - Body Acceleration
<b>GravityAcceleration</b> - Gravity Acceleration
<b>BodyAccelerationJerk</b> - Rate of change of Body Acceleration 
<b>BodyGyroscope</b> - Body Gyroscope
<b>BodyGyroscopeJerk</b> - Rate of change of Body Gyroscope
<b>BodyAccelerationMagnitude</b> - Magnitude of Body Acceleration
<b>GravityAccelerationMagnitude</b> - Magnitude of Gravity Acceleration
<b>BodyAccelerationJerkMagnitude</b> - Magnitude of Rate of change of Body Acceleration 
<b>BodyGyroscopeMagnitude</b> - Magnitude of Body Gyroscope
<b>BodyGyroscopeJerkMagnitude</b> - Magnitude of Rate of change of Body Gyroscope

The next part of the column name is either "Mean" or "StandardDeviation" to indicate whether
the columns is measuring the mean or standard deviation of the sensor reading.

The final part of the column name is the axis being measured. It is either XAxis, YAxis, ZAxis.  


