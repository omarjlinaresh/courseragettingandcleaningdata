library(dplyr)

file_name <- "getdata_projectfiles_UCIHARDataset.zip" 

#Downloading the file in case it doesn't exist
if (!file.exists(file_name)){
    file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_URL, file_name, method="curl")
}  

#Unzipping the folder
if (!file.exists("UCI HAR Dataset")) { 
    unzip(file_name) 
}

#assigning the data to variables
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#merges train and test sets
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)
data <- cbind(subject, X, y)

#Extracts only the measurements on the mean and standard deviation for each measurement.
definitive_data <- data %>% select(subject, code, contains("mean"), contains("std"), contains("Mean"))

# name the activities in the data set
definitive_data$code <- activity_labels[definitive_data$code, 2]

# labels the data set with descriptive variable names
names(definitive_data)[2] = "activity"
names(definitive_data)<-gsub("^t", "time", names(definitive_data))
names(definitive_data)<-gsub("^f", "frequency", names(definitive_data))
names(definitive_data)<-gsub("Acc", "accelerometer", names(definitive_data))
names(definitive_data)<-gsub("Gyro", "gyroscope", names(definitive_data))
names(definitive_data)<-gsub("BodyBody", "body", names(definitive_data))
names(definitive_data)<-gsub("Mag", "magnitude", names(definitive_data))
names(definitive_data)<-gsub("tBody", "timeBody", names(definitive_data))
names(definitive_data)<-gsub("-mean()", "mean", names(definitive_data), ignore.case = TRUE)
names(definitive_data)<-gsub("-std()", "std", names(definitive_data), ignore.case = TRUE)
names(definitive_data)<-gsub("-freq()", "frequency", names(definitive_data), ignore.case = TRUE)


#creates a second, independent tidy data set with the average of each variable for each activity and each subject 
definitive_data2 <- definitive_data %>% 
               group_by(activity, subject) %>%
               summarise_all(funs(mean)) %>%
               arrange(subject) #ordered by subject to make easier the reading of the table
write.table(definitive_data2, "tidydata.txt", row.name=FALSE)
                
