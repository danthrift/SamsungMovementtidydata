#Saving data/////save(dat,dat2, file="charmcirc.rda")
#///////////


#//////////////////////////////////////////////////
#////Loading data

install.packages("RCurl")
install.packages("plyr")
install.packages("dplyr")
install.packages("reshape2")
install.packages("data.table")

library("RCurl")
library("plyr")
library("dplyr")
library("reshape2")
library("data.table")

  tf<-tempfile()
  td<-tempdir()
  
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",tf,mode='wb')
  
  files<-unzip(tf,exdir=td)
  
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
  
  
  
  
  
  #///////////////////////////////////////
  #///appending training and testing data
  
  
  subjects<-rbind(subject_train,subject_test)
  fulldata<-rbind(x_train,x_test)
  activities<-rbind(y_train,y_test)
  
  #///////////////////////////////////////////////
  #////changing column names in both subjects and activities
  
  names(subjects)<- c('Subject')
  names(activities)<- c('Activity')
  
  
  #///////////////////////////////////////////////
  #////makes the features v2 column into column names for datafull:
  
  labelNames<-as.vector(features$V2)
  colnames(fulldata)<-labelNames
  
  
  #//////////////////////////////////////////////////////////////////////
  #//////loads a copy of activities with the appropriate text for the code map
  
  activities$Activity[activities$Activity==1]<-'WALKING'
  activities$Activity[activities$Activity==2]<-'WALKING_UPSTAIRS'
  activities$Activity[activities$Activity==3]<-'WALKING_DOWNSTAIRS'
  activities$Activity[activities$Activity==4]<-'SITTING'
  activities$Activity[activities$Activity==5]<-'STANDING'
  activities$Activity[activities$Activity==6]<-'LAYING'
  
  #///////////////Renames the V1 label to Activity
  
 
  
  
  
  
  
  
  
  
  
  #///////////////////////////////////////////////////////////////////////
  #/////Adds an id field to subjects, datafull, and activities to make merging easier
  
  #/////////subjects<-mutate(subjects, id=rownames(subjects))
  
  #////////////fulldata<-mutate(fulldata, id=rownames(datafull))
  
  #////////////activities<-mutate(activities, id=rownames(activities))
  
  subjects<-cbind('generated_uid3'=sprintf('%03d', 1:nrow(subjects)),subjects)
  activities<-cbind('generated_uid3'=sprintf('%03d', 1:nrow(activities)),activities)
  fulldata<-cbind('generated_uid3'=sprintf('%03d', 1:nrow(fulldata)),fulldata)
  #/////////////////////////////////////////////
  #/////merge all of these by id field into ---datasimple
  
  datasimpleX=merge(subjects,activities, by=c('generated_uid3'))
  
  datasimple=merge(datasimpleX,fulldata, by=c('generated_uid3'))
  
  
  #//////////////////////////////table is constructed///////////////////////
  
  #///////////////////////////////
  #//////Subsetting main table --datasimple---- for means and standard deviation
  
  matched<-select(datasimple, contains('mean'),contains('std'),contains('Subject'),contains('Activity'),contains('id'))
  
tidydata<-matched %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
