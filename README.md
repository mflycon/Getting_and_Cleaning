Getting_and_Cleaning
Programming assignment of week 4

# Presentation

The dataset is based on : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Briefly : Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.

# Included files

run_analysis.R : script to clean the original dataset. Running this script will create two R objects : 
- "data" : Row data is divided between two sets, that we merged together. We only kept, for each recording events, the columns expressing mean and standard deviation of the other measurements. This the object "data".
- "data_tidy" : We subsequently averaged all these means or std measurements, to only keep one row by subject id and activity. This is the object "data_tidy".

CodeBook.md : gives additional info on the included variables.

data_tidy.csv : final output of run_analysis.R script (object "data_tidy" saved as .csv)
