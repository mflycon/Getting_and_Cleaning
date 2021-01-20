# Loading libraries
library(utils)
library(data.table)

# DownLoading data and unzipping
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip", overwrite = T)
setwd("UCI HAR Dataset") # set wd in the unziped archive

# loading variables labels (= features)
variables <- read.table("features.txt")$V2  # variables are my list of features. It's column "V2" if we load features.txt as a table
variables <- sub("()", "@", variables, fixed = T) # and I remove the "()" which are confusing. Replacing with "@" to still spot the names easily


# Training set loading and arrangement
training_set <- setDT(read.table("train/X_train.txt")) # loading training set (as data.table object)
colnames(training_set) <- variables # and renaming columns with our "variables" vector

training_set$activity <- as.factor(read.table("train/y_train.txt")$V1) #  adding a variable "activity", with the data listed in y_train.txt
training_set$subject_id <- as.factor(read.table("train/subject_train.txt")$V1) # adding a variable with the subject_id, as listed in subject_train

variables_kept <- c("subject_id", "activity", variables[grep("Mean|mean|std", variables)]) # listing our variables to keep (including "subject_id" and "activity"). Using "Mean" also keep a few "angle(xxx), xxxMean" variables, that I did not understood completely if they were to be kept or not.
training_set <- training_set[, ..variables_kept] # subset to keep our selected variables only


# Test set loading and arrangement
test_set <- setDT(read.table("test/X_test.txt")) # loading test set (as data.table object)
colnames(test_set) <- variables # and renaming columns with our "variables" vector

test_set$activity <- as.factor(read.table("test/y_test.txt")$V1) # adding a variable "activity", with data listed in y_test.txt
test_set$subject_id <- as.factor(read.table("test/subject_test.txt")$V1) # adding a variable with the subject_id, as listed in the subject_train.txt file

test_set <- test_set[, ..variables_kept] # subset to keep our selected variables only (same ones as for training_set)


# Binding the two tables
data <- rbind(test_set, training_set) # just add one table after the other
rm(test_set, training_set) # Removing previous tables


# Labelling 
levels(data$activity) <- read.table("activity_labels.txt")$V2  # using "activity_labels" file to label my activity variable
data$activity # Seems to work


# Tidy set
data_tidy <- copy(data) # create a copy of my data
variables_to_change <- names(data_tidy[, -c("subject_id", "activity")]) # listing variables for which I'll average variable by id and activity. 
variables_kept_tidy <- c() # empty vector, where I'll put the names of newly created variables 

for (i in variables_to_change){ # for each variable to change
    data_tidy[, i <- as.numeric(i)] # make sure the variable is numeric
    data_tidy[, c(paste0(i,"_overall_mean")) := mean(get(i)), by = c("subject_id", "activity")]  # create a new "..._overall_mean" variable, with take the mean value by subject_id and activity
    variables_kept_tidy <- c(variables_kept_tidy, c(paste0(i,"_overall_mean"))) # add the name of the newly created variable in this list (so I can use it later)
}

variables_kept_tidy <- c(variables_kept_tidy, "subject_id", "activity") # I add subject_id and activity in this list of new variables

data_tidy <- data_tidy[, ..variables_kept_tidy] # I only keep these newly computed variables 

data_tidy <- data_tidy[, .SD[1], by = c("subject_id", "activity")] # and I finally only keep the first row by subject_id and activity (because all rows, by id and by activity, are now identical, so I shall remove these duplicates)



# saving
write.table(data_tidy, file = "../data_tidy.txt", row.names = F) # in parent folder







