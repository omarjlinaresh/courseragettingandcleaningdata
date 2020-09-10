# courseragettingandcleaningdata
title: "CodeBook"
output: html_document
---

The run_analysis.R script prepares tidy data that can be used for later analysis. It has been done following the steps that were required in the "Getting and cleaning data course".

### **First step**  
Downloads the file and extracts the main folder under the name "UCI HAR Dataset"

### **Second step**  
Assigns each data to different variables, using the **read.table()** function.  
   $\color{red}{\text{features}}$: This variable was created with *features.txt*.  
The features came from triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration triaxial Angular velocity from the gyroscope.  
   $\color{red}{\text{activity_labels}}$: This variable was created with *activity_labels.txt*.  
These are the activities performed when the measurements were taken and its corresponding labels.  
   $\color{red}{\text{subject_test}}$: This variable was created with *test/subject_test.txt*.   
These are the identifiers of the part of the 30 subjects who carried out the experiment who were volunteers within an age bracket of 19-48 years that were used in the test data.  
   $\color{red}{\text{X_test}}$: This variable was created with *test/X_test.txt*.   
These are the recorded features used for test data.  
   $\color{red}{\text{y_test}}$: This variable was created with *test/y_test.txt*.   
These are the recorded activities labels used for test data.  
   $\color{red}{\text{subject_train}}$: This variable was created with *train/subject_train.txt*.   
These are the identifiers of the part of the 30 subjects who carried out the experiment who were volunteers within an age bracket of 19-48 years that were used in the train data.  
   $\color{red}{\text{X_train}}$: This variable was created with *train/X_train.txt*.   
These are the recorded features used for train data.  
   $\color{red}{\text{y_train}}$: This variable was created with *train/y_train.txt*.   
These are the recorded activities labels used for train data. 

### **Third step**  
Merges the training and the test sets to create one data set.  
$\color{red}{\text{X}}$: It's created by merging X_test and X_train using **rbind**.  
$\color{red}{\text{y}}$: It's created by merging y_test and y_train using **rbind**.  
$\color{red}{\text{subject}}$: It's created by merging subject_test and subject_train using **rbind**.  
$\color{red}{\text{data}}$: It's created by merging X, y and subject using **cbind**.  

### **Forth step**  
Extracts only the measurements on the mean and standard deviation for each measurement.  
$\color{red}{\text{final_data}}$ was created selecting from **data** only the variables *subject*, *code* and the ones that contained the *means* and *standard deviation* measurments using the  **select** function.  

### **Fifth step**  
Uses descriptive activity names to name the activities in the data set.
The *numbers* in code column of **final_data** were replaced with its corresponding *activity* taken from the second column of the *activity_labels* variable using **[ ]** tool.  

### **Sixth step**  
Labels the data set with descriptive variable names.  

*  The *code* column of *final_data* was replaced by **activity**  

*  The *t* characters at the begining of the columns' names were replaced by **time**  

*  The *f* characters at the begining of the columns' names were replaced by **frequency**  

*  The *Acc* of the columns' names were replaced by **accelerometer**  

*  The *Gyro* of the columns' names were replaced by **gyroscope**  

*  The *BodyBody* of the columns' names were replaced by **body**  

*  The *Mag* of the columns' names were replaced by **magnitude**  

*  The *tBody* of the columns' names were replaced by **timeBody**  

*  The *-mean()* of the columns' names were replaced by **mean**  

*  The *-std()* of the columns' names were replaced by **std**  

*  The *-freq()* of the columns' names were replaced by **frequency**  

All the replacements but the first one were done using **gsub()** function.  


### **Seventh step**  
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. It also arranges it by subject to make it easier to read.
It was done by first applying the **group_by()** function to the *final_data* data set with *activity* and *subject* as parameters and then taking the means of each variable and each activity and sumarizing it with the **sumarise_all()** function. After that it was used the **arrange** function with *subject* as a parameter to ordered it by subject.  
