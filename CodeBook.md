Getting_and_Cleaning
Programming assignment of week 4

This codebook summarizes content of the file "data_tidy.csv".

## Presentation

"data_tidy.csv" results from merging together the 2 sets ("test" set and "training" set) found in the original dataset ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

We also named columns according to the original dataset metadata.

## Important new modifications 

- All observations of the original dataset were merged together.
- Columns were labeled according to their original names BUT expression "()" was replaced with "@" for better readability. It indicates the type of estimated measurement (i.e. mean@ or std@)
- We only kept columns related to "mean@" or "std@" measures. 
- We added column `subject_id`, which identifies each individual with a number
- We added a column `activity`, which indicates the activity performed during data acquisition 
- We averaged all relevant measurements. "_overall_mean" was thus added to variables names, and consequently only one row was kept by subject_id and activity.

## Variables 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

We finally only kept variables mean@ and std@, which were estimated from these signals.

A few additional vectors obtained by averaging the signals, used on the angle() variable. See :

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean


Finally, we averaged all variables by subject_id and activity, replacing old "xxx"" variables with "xxx_overall_mean" variables.


### Complete list 

`subject_id`        Factor with 30 levels. Ex : "2","4","9","10"...        
`activity`         Factor with 6 levels "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING"  "STANDING"  "LAYING"

`tBodyAcc-mean@-X_overall_mean`                  
`tBodyAcc-mean@-Y_overall_mean`                  
`tBodyAcc-mean@-Z_overall_mean`                   
`tBodyAcc-std@-X_overall_mean`                   
`tBodyAcc-std@-Y_overall_mean`         
`tBodyAcc-std@-Z_overall_mean`            
`tGravityAcc-mean@-X_overall_mean`                
`tGravityAcc-mean@-Y_overall_mean`            
`tGravityAcc-mean@-Z_overall_mean`          
`tGravityAcc-std@-X_overall_mean`                
`tGravityAcc-std@-Y_overall_mean`   
`tGravityAcc-std@-Z_overall_mean`               
`tBodyAccJerk-mean@-X_overall_mean`               
`tBodyAccJerk-mean@-Y_overall_mean`   
`tBodyAccJerk-mean@-Z_overall_mean`         
`tBodyAccJerk-std@-X_overall_mean`               
`tBodyAccJerk-std@-Y_overall_mean`    
`tBodyAccJerk-std@-Z_overall_mean`
`tBodyGyro-mean@-X_overall_mean`                
`tBodyGyro-mean@-Y_overall_mean`     
`tBodyGyro-mean@-Z_overall_mean`     
`tBodyGyro-std@-X_overall_mean`                  
`tBodyGyro-std@-Y_overall_mean`           
`tBodyGyro-std@-Z_overall_mean`          
`tBodyGyroJerk-mean@-X_overall_mean`              
`tBodyGyroJerk-mean@-Y_overall_mean`  
`tBodyGyroJerk-mean@-Z_overall_mean`      
`tBodyGyroJerk-std@-X_overall_mean`               
`tBodyGyroJerk-std@-Y_overall_mean`    
`tBodyGyroJerk-std@-Z_overall_mean`        
`tBodyAccMag-mean@_overall_mean`                  
`tBodyAccMag-std@_overall_mean`      
`tGravityAccMag-mean@_overall_mean`     
`tGravityAccMag-std@_overall_mean`               
`tBodyAccJerkMag-mean@_overall_mean`     
`tBodyAccJerkMag-std@_overall_mean`     
`tBodyGyroMag-mean@_overall_mean`               
`tBodyGyroMag-std@_overall_mean`     
`tBodyGyroJerkMag-mean@_overall_mean`    
`tBodyGyroJerkMag-std@_overall_mean`              
`fBodyAcc-mean@-X_overall_mean`       
`fBodyAcc-mean@-Y_overall_mean`         
`fBodyAcc-mean@-Z_overall_mean`                  
`fBodyAcc-std@-X_overall_mean`      
`fBodyAcc-std@-Y_overall_mean`        
`fBodyAcc-std@-Z_overall_mean`                    
`fBodyAcc-meanFreq@-X_overall_mean`    
`fBodyAcc-meanFreq@-Y_overall_mean`     
`fBodyAcc-meanFreq@-Z_overall_mean`               
`fBodyAccJerk-mean@-X_overall_mean`       
`fBodyAccJerk-mean@-Y_overall_mean`      
`fBodyAccJerk-mean@-Z_overall_mean`                
`fBodyAccJerk-std@-X_overall_mean`       
`fBodyAccJerk-std@-Y_overall_mean`         
`fBodyAccJerk-std@-Z_overall_mean`                
`fBodyAccJerk-meanFreq@-X_overall_mean`        
`fBodyAccJerk-meanFreq@-Y_overall_mean`      
`fBodyAccJerk-meanFreq@-Z_overall_mean`           
`fBodyGyro-mean@-X_overall_mean`        
`fBodyGyro-mean@-Y_overall_mean`          
`fBodyGyro-mean@-Z_overall_mean`                   
`fBodyGyro-std@-X_overall_mean`          
`fBodyGyro-std@-Y_overall_mean`          
`fBodyGyro-std@-Z_overall_mean`                    
`fBodyGyro-meanFreq@-X_overall_mean`     
`fBodyGyro-meanFreq@-Y_overall_mean`   
`fBodyGyro-meanFreq@-Z_overall_mean`               
`fBodyAccMag-mean@_overall_mean`        
`fBodyAccMag-std@_overall_mean`          
`fBodyAccMag-meanFreq@_overall_mean`               
`fBodyBodyAccJerkMag-mean@_overall_mean`    
`fBodyBodyAccJerkMag-std@_overall_mean`     
`fBodyBodyAccJerkMag-meanFreq@_overall_mean`       
`fBodyBodyGyroMag-mean@_overall_mean`         
`fBodyBodyGyroMag-std@_overall_mean`           
`fBodyBodyGyroMag-meanFreq@_overall_mean`          
`fBodyBodyGyroJerkMag-mean@_overall_mean`   
`fBodyBodyGyroJerkMag-std@_overall_mean`     
`fBodyBodyGyroJerkMag-meanFreq@_overall_mean`    
`angle(tBodyAccMean,gravity)_overall_mean`     
`angle(tBodyAccJerkMean),gravityMean)_overall_mean`
`angle(tBodyGyroMean,gravityMean)_overall_mean`    
`angle(tBodyGyroJerkMean,gravityMean)_overall_mean`
`angle(X,gravityMean)_overall_mean`                
`angle(Y,gravityMean)_overall_mean`                
`angle(Z,gravityMean)_overall_mean` 