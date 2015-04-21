---
title: "Getting and Cleaning Data Project 2015 April"
---
Description of data sources, retrieval time, data table, columns and activities performed

##Data Source
This data was retrieved on 2015Apr21 from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

The full description of this data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age  
bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration  and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been   video-recorded to label the data manually. The obtained dataset has been randomly  partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth   
low-pass filter into body acceleration and gravity. The gravitational forceis assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities   
with one of the participants can be seen in the following link [http://www.youtube.com/watch?v=XOEN9W05_4A]

Number of Instances | Number of Attributes | Characteristics | Daet Donated
------|------|------|------
10299|561|Multivariate, Time-Series, 2012-12-10

#Attribute Information  
For each record in the dataset it is provided:  
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.   
* Triaxial Angular velocity from the gyroscope.   
* A 561-feature vector with time and frequency domain variables.   
* Its activity label.   
* An identifier of the subject who carried out the experiment.
