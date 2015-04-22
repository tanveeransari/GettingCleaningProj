# Getting and Cleaning Data Project

##Instructions  
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

---------
##Dependencies  
###Library Dependencies
plyr, dpylr,data.table


##Steps to perform analysis
 Run the source file "run_analysis.R"
 

##Steps performed by source file "run_analysis.R"
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