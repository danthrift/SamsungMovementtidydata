Codebook for project for Johns Hopkins Getting and Cleaning Data course.  


These are the various test subjects (people) anonymized by only using a numeric
[1] "Subject"                              

These are the types of activities the subjects underwent to get the reading from the phone sensors. 
[2]"Activity"                            
 
 
 

These are the various columns gleaned from the source data that have either the word "mean" or
the word "std" in their names.  

Since many phone sensors have e.g. X,Y, and Z readings i take these names to be describing movement sensed with 
those parameters.  

All of these readings are in decimal format, and the numbers within the tidydata set are the average of the total 
readings taken per person, per activity.  


 [3] "tBodyAcc-mean()-X"                    "tBodyAcc-mean()-Y"                   
 [5] "tBodyAcc-mean()-Z"                    "tGravityAcc-mean()-X"                
 [7] "tGravityAcc-mean()-Y"                 "tGravityAcc-mean()-Z"                
 [9] "tBodyAccJerk-mean()-X"                "tBodyAccJerk-mean()-Y"               
[11] "tBodyAccJerk-mean()-Z"                "tBodyGyro-mean()-X"                  
[13] "tBodyGyro-mean()-Y"                   "tBodyGyro-mean()-Z"                  
[15] "tBodyGyroJerk-mean()-X"               "tBodyGyroJerk-mean()-Y"              
[17] "tBodyGyroJerk-mean()-Z"               "tBodyAccMag-mean()"                  
[19] "tGravityAccMag-mean()"                "tBodyAccJerkMag-mean()"              
[21] "tBodyGyroMag-mean()"                  "tBodyGyroJerkMag-mean()"             
[23] "fBodyAcc-mean()-X"                    "fBodyAcc-mean()-Y"                   
[25] "fBodyAcc-mean()-Z"                    "fBodyAcc-meanFreq()-X"               
[27] "fBodyAcc-meanFreq()-Y"                "fBodyAcc-meanFreq()-Z"               
[29] "fBodyAccJerk-mean()-X"                "fBodyAccJerk-mean()-Y"               
[31] "fBodyAccJerk-mean()-Z"                "fBodyAccJerk-meanFreq()-X"           
[33] "fBodyAccJerk-meanFreq()-Y"            "fBodyAccJerk-meanFreq()-Z"           
[35] "fBodyGyro-mean()-X"                   "fBodyGyro-mean()-Y"                  
[37] "fBodyGyro-mean()-Z"                   "fBodyGyro-meanFreq()-X"              
[39] "fBodyGyro-meanFreq()-Y"               "fBodyGyro-meanFreq()-Z"              
[41] "fBodyAccMag-mean()"                   "fBodyAccMag-meanFreq()"              
[43] "fBodyBodyAccJerkMag-mean()"           "fBodyBodyAccJerkMag-meanFreq()"      
[45] "fBodyBodyGyroMag-mean()"              "fBodyBodyGyroMag-meanFreq()"         
[47] "fBodyBodyGyroJerkMag-mean()"          "fBodyBodyGyroJerkMag-meanFreq()"     
[49] "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)"
[51] "angle(tBodyGyroMean,gravityMean)"     "angle(tBodyGyroJerkMean,gravityMean)"
[53] "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                
[55] "angle(Z,gravityMean)"                 "tBodyAcc-std()-X"                    
[57] "tBodyAcc-std()-Y"                     "tBodyAcc-std()-Z"                    
[59] "tGravityAcc-std()-X"                  "tGravityAcc-std()-Y"                 
[61] "tGravityAcc-std()-Z"                  "tBodyAccJerk-std()-X"                
[63] "tBodyAccJerk-std()-Y"                 "tBodyAccJerk-std()-Z"                
[65] "tBodyGyro-std()-X"                    "tBodyGyro-std()-Y"                   
[67] "tBodyGyro-std()-Z"                    "tBodyGyroJerk-std()-X"               
[69] "tBodyGyroJerk-std()-Y"                "tBodyGyroJerk-std()-Z"               
[71] "tBodyAccMag-std()"                    "tGravityAccMag-std()"                
[73] "tBodyAccJerkMag-std()"                "tBodyGyroMag-std()"                  
[75] "tBodyGyroJerkMag-std()"               "fBodyAcc-std()-X"                    
[77] "fBodyAcc-std()-Y"                     "fBodyAcc-std()-Z"                    
[79] "fBodyAccJerk-std()-X"                 "fBodyAccJerk-std()-Y"                
[81] "fBodyAccJerk-std()-Z"                 "fBodyGyro-std()-X"                   
[83] "fBodyGyro-std()-Y"                    "fBodyGyro-std()-Z"                   
[85] "fBodyAccMag-std()"                    "fBodyBodyAccJerkMag-std()"           
[87] "fBodyBodyGyroMag-std()"               "fBodyBodyGyroJerkMag-std()"   

This variable was generated in order to more smoothly merge data with less system resource
[89] "generated_uid3"  