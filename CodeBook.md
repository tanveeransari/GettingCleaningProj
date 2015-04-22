---
title: "Getting and Cleaning Data Project 2015 April"
---
Description of data sources, retrieval time, data table, columns and activities performed

##Data Source
This data was retrieved on 2015Apr21 from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

The full description of this data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age  
bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration  and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been   video-recorded to label the data manually. The obtained dataset has been randomly  partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth   
low-pass filter into body acceleration and gravity. The gravitational forceis assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities   
with one of the participants can be seen in the following link [http://www.youtube.com/watch?v=XOEN9W05_4A]

Number of Instances | Number of Attributes | Characteristics | Date Donated
------|------|------|------
10299|561|Multivariate, Time-Series| 2012-12-10

##Attribute Information  
For each record in the dataset it is provided:  
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.   
* Triaxial Angular velocity from the gyroscope.   
* A 561-feature vector with time and frequency domain variables.   
* Its activity label.   
* An identifier of the subject who carried out the experiment.

##Relevant Data Files
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt'        : List of all features. This is a list of feature names for all 561 features.

- 'activity_labels.txt' : Links the class labels with their activity name. Mapping of activity to description

- 'train/X_train.txt'   : Training set.Headerless matrix of one observation per row of each of 561 variables

- 'train/y_train.txt'   : Training labels. Activity Id per training observation,

- 'test/X_test.txt'     : Test set.
  
- 'test/y_test.txt'     : Test labels. Activity Id per test observation

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The files inside folder Inertial Signals were not used for this analysis

##Steps performed
 * Read all relevant files in
  + To speed up reading the dataset I first read in 5 rows to tmp, determine the colclasses  
    and use the colClasses when reading in the entire dataset
 * Merge test and train folder files 
     + merge datasets
     + merge labels 
     + merge subjects
  * Prepend subject_id and activity_id from subject and label files into dataset
  * Perform step 4 of assignment (Appropriately labels the data set with descriptive variable name)  
    To do this use the names read from the features.txt file as the names for the dataset
  *Perform Step 2: Extracts only the measurements on the mean and standard deviation for each measurement  
  grep the column names for mean,std, act_id and subj_id and extract just those columns from the dataset  
  * Perform Step 3 : Uses descriptive activity names to name the activities in the data set
   Use merge to assign activity labels to each row in dataset.
  * Step 4 was already done above
  * Perform Step 5 From the data set in step 4, creates a second, independent tidy data set with  
  the average of each variable for each activity and each subject.  
  This is accomplished using the ddply function from plyr
  * Write out the resulting dataset to a text file