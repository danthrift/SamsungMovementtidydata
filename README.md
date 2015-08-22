Johns Hopkins Getting and Cleaning Data assignment.  8-22-2015

This file describes the basis of transforming the raw data into the tidydata set.  

The script included in the run_analysis.R file is run in R and includes various needed package library loads.

No attmept to create a hard drive based file system has been made, but rather the whole of the script can be run because it creates a virtual disk environment for R.  

Data is downloaded directly from the source here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

and then upzipped into the virtual drive.   This was done to make a cleaner demonstration for our class.   

THIS HAS ONLY BEEN TESTED ON A WINDOWS ENVIRNMENT using a basic R download and RStudio:

R version 3.0.3 (2014-03-06) -- "Warm Puppy"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)


***************Thank you for evaluating this.  I understand that you have completed this exercise yourself, and that is not easy.  You may experience variance to your own ideas, but there was a logic to my choices.***********

****************************************************************
****************************************************************

Script description:


1. Installation of the various needed package libraries for R.

install.packages("RCurl")
install.packages("plyr")
install.packages("dplyr")
install.packages("reshape2")
install.packages("data.table")

2. Loading the packages into the R environment

library("RCurl")
library("plyr")
library("dplyr")
library("reshape2")
library("data.table")

3.Setting up the virtual disk environment.  

  tf<-tempfile()
  td<-tempdir()
  
  
4. Download and upzipping the source files into the virtual disk.  
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",tf,mode='wb')
  
  files<-unzip(tf,exdir=td)
  
5. Importing the various source tables into RStudio  
  
  #//importing tables as dataframes
  activity_labels<-read.table(files[1])
  features<-read.table(files[2])
  #//features_info<-read.table(files[3])
  
  subject_test<-read.table(files[14])
  x_test<-read.table(files[15])
  y_test<-read.table(files[16])
  
  subject_train<-read.table(files[26])
  x_train<-read.table(files[27])
  y_train<-read.table(files[28])
  
  
  6. The source data is in two parts, test and training which is often done to files used for machine learning.    These files are joined back together to form a larger data set.  

Also, the subjects and activities data files are joined together here too:
  
  subjects<-rbind(subject_train,subject_test)
  fulldata<-rbind(x_train,x_test)
  activities<-rbind(y_train,y_test)
  
 

7.Changing the column names to something more human readable
  
  names(subjects)<- c('Subject')
  names(activities)<- c('Activity')
  
  


8. Since the features dataset contains the more human readable form of the column names in the main data source they are applied to that table here. 
  
  labelNames<-as.vector(features$V2)
  colnames(fulldata)<-labelNames
  
  

9.  The code that descibes the type of activity is numeric in the main source data, and so here it is changed to a more human readable form.  
  
  activities$Activity[activities$Activity==1]<-'WALKING'
  activities$Activity[activities$Activity==2]<-'WALKING_UPSTAIRS'
  activities$Activity[activities$Activity==3]<-'WALKING_DOWNSTAIRS'
  activities$Activity[activities$Activity==4]<-'SITTING'
  activities$Activity[activities$Activity==5]<-'STANDING'
  activities$Activity[activities$Activity==6]<-'LAYING'
  
 
 
10.  My computer ran itsefl out of memeory when I merged the data into one table because I used the row index as the common field.  Here I add a numeric field to the various data source tables to make them able to merge with far less resource
  
  subjects<-cbind('generated_uid3'=sprintf('%03d', 1:nrow(subjects)),subjects)
  activities<-cbind('generated_uid3'=sprintf('%03d', 1:nrow(activities)),activities)
  fulldata<-cbind('generated_uid3'=sprintf('%03d', 1:nrow(fulldata)),fulldata)
 
  
  11. Creating the large data file datasimple that has all of the data fields and also the Subject and the Activity fields added together.
  
  datasimpleX=merge(subjects,activities, by=c('generated_uid3'))
  
  datasimple=merge(datasimpleX,fulldata, by=c('generated_uid3'))
  
  

12.  Subsetting the columns that are related to mean and standard deviation measurement.  Very little was noted about whether these labels are cluttering or informative, but I found something to like about retaining all of them provide they had the word "mean" or "std" contained in the column name.   
  
  matched<-select(datasimple, contains('mean'),contains('std'),contains('Subject'),contains('Activity'),contains('id'))

13 Finally, the tidaydata subset emerges with the mean of the entries by Subject, and Activity in the rows.  
  
tidydata<-matched %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

