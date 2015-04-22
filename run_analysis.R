library(plyr);library(dplyr);library(data.table);

#Fetch and extract data files
if(!file.exists("UCI.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile="UCI.zip")
  unzip("UCI.zip")
}

setwd("UCI HAR Dataset/")
# Read all relevant files in
  act_labels<-read.csv("activity_labels.txt",sep = " ", header=F)
  names(act_labels)<-c("act_id","act_desc")

  features<-read.csv("features.txt",sep=" ", header = F)
  names(features)<-c("feat_id","feat_desc")
  # Read Subject identification files

  subject_test<-read.table("test/subject_test.txt", sep=" ", header=F)
  names(subject_test)=c("subj_id")
  subject_train<-read.table("train/subject_train.txt", sep=" ", header=F)
  names(subject_train)=c("subj_id")

  #Read label files
  y_train<-read.table("train/y_train.txt",sep=" ", header=F)
  names(y_train)<-"act_id"
  y_test<-read.table("test/y_test.txt",sep=" ", header=F)
  names(y_test)<-"act_id"

  #Read x_test and x_train
  tmp <- read.table("train/X_train.txt", header = F, nrows = 5)
  classes <- sapply(tmp, class)
  x_train <- read.table("train/X_train.txt", header = F,colClasses=classes)

  tmp <- read.table("test/X_test.txt", header = F, nrows = 5)
  classes<-sapply(tmp,class)
  x_test<-read.table("test/X_test.txt",header=F,colClasses=classes)
  rm(tmp)


#1. Merges the training and the test sets to create one data set.
master<-rbind(x_train,x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
master=cbind(subject$subj_id,y$act_id,master)
names(master)[1]="subj_id"
names(master)[2]="act_id"
#Use tbl_df for better printing
master<-tbl_df(master)
#4. - label the dataset with descriptive variable names
names(master)[3:563]<-as.character(features$feat_desc)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Search for column names that contain "mean","std", "act_id" and "subj_id".
goodCols<-grepl("[Mm]ean|[Ss]td|subj_id|act_id",names(master))
#Subset master to only contain the columns we want
master<-master[,goodCols]

#3. Uses descriptive activity names to name the activities in the data set
#Merge with act_label. Column names act_id are the same in both so by.x/y isn't required
master<-merge(master,act_labels)

#4. Appropriately labels the data set with descriptive variable names.
#   Already completed

#5. From the data set in step 4, creates a second, independent tidy data set with
#    the average of each variable for each activity and each subject.
tidy<-ddply(master,.(subj_id,act_id),function(x)colMeans(x[,3:88]))

setwd("../")
write.table(tidy,file="tidy.txt",row.names=FALSE)
rm(list=ls())