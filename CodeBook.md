1. Get the data
  -Save the dataset and extract under the folder called UCI HAR Dataset

2. Read the data

  -features = features.txt
  -activityLabels = activity_labels.txt
  
  -subjectTest = subject_test.txt
  -xTest = X_test.txt
  -yTest = Y_test.txt
  
  -subjectTrain = subject_train.txt
  -xTrain = X_train.txt
  -yTrain = Y_train.txt
 
3. Merge the training and the test sets to create one data set

Merging the data using rbind() and cbind() functions: 

  -X = (xTrain & xTest) using rbind()
  -Y = (yTrain & yTest) using rbind()
  -SubjectXY = (subjectTrain & subjectTest) using rbind()
  
  -DataXY = (SubjectXY & Y & X) using cbind()
  
4. Extract only the measurements on the mean and the standard deviatino for each measurement
  
  -DataMeanStd = subsetting DataXY, selecting the columns "subject" and "code", and the measurements on the mean and standaard deviation for each measurement.
  
5. Use descriptive activity names to name the activities in the data set
 
  Replace the "code" column on DataMeanStd with activityLabels. 
  
6. Appropriately labels the data set with descriptive variable names
    
   -second column on DataMeanStd renamed to "activity"
   -"std()" replaced with "SD"
   -"mean()" replaced with "Mean"
   -starts with "t" replaced with "time
   -starts with "f" replaced with "frequency"
   -"Acc" replaced with "Accelerometer"
   -"BodyBody" replaced with "Body"
   -"Gyro" replaced with "Gyroscope"
   -"Mag" replaced with "Magnitude"
   -"tBody" replaced with "TimeBody"
   -"angle" replaced with "Angle"
   -"gravity" replaced with "Gravity"
   
7. Create a second, tidy Data set with average of each variable for each activity and each subject

  -TidyData = from DataMeanStd groupping by subject and activity, summarized taking the mean of each variable for each activity and subject.
  
  -Export TidyData to TidyData.txt file.
