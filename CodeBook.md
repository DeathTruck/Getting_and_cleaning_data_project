## Code Book for Getting and Cleaning Data Course Project
### Overview of run_analysis.R
The run_analysis.R code reads in cell phone data, merges test and training data, 
computes mean values on a subset of the variables, and outputs the data. The code first sets the 
working directory (This will need to be changed when reproducing results). The working directory should be where
the input files live. The code then loads proper packages.

#### Part 1. Merges the training and the test sets to create one data set. 
The script reads in the test data, merges the columns (cbind), reads the training data, merges the columns again, and then merges 
both the training and test data (rbind). 

#### Part 2. Extracts only the measurements on the mean and standard deviation for each measurement.
In this part the script first reads in the features.txt file. The features that end in mean or std() are found with grep. 
I did not inlcude the mean frequency and angle mean variables as these were derived variables (from other variables). The code can be easily 
changed if one wanted to include these in the analysis. The variable my_data is then created by subsetting the large dataframe.

#### Part 3. Uses descriptive activity names to name the activities in the data set.
Reads in activity_labels.txt, and assigns these descriptive lables to the dataframe. This is doing a short loop over each of the 6 activities, and
finding which rows contain each activity, and adding desciption to a new vector. This vector is then appended to the dataframe.

#### Part 4. Appropriately labels the data set with descriptive variable names.
This part of the code cleans up the variable names by getting rid of parentheses and dashes by using gsub. It then applies the variable names(var_names)
to the dataframe (my_data).

#### Part 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is done by using the aggregate function and applying the mean function to the my_data dataframe by activity and subject. Although the resulting
table is wide, the data is considered tidy because each variable forms a column, each observation forms a row, and each type of observational 
unit forms a table (as per Hadley Wickham's paper). The dataframe is then outputted to tidy_data.txt

## Local/Script variables
* x_test: X variables for test data
* y_test: y variables for training data
* subject_test: subject numbers that coincide with the test data
* new0: merged version of x, y, and subject test data
* x_train: X variables for test data
* y_train: y variables for training data
* subject_training: subject numbers that coincide with the training data
* new1: merged version of x, y, and subject training data
* all_data: merged version of test and training data
* yindex: index of y
* subindex: index of subjects
* features0: features being read in from the file.
* features: features with id removed (a vector)
* these_features: indices of features/variables of interest
* var_names: the names of variables/features, descriptive names (not V1, V2.... or X1, X2....)
* my_data: subsetted data for only the features/variables of interest.
* act_table: activity table as read in from the file.
* act_labs: activity labels.
* activity: vector that contains the descriptive names of the activities for each observation.
* here_index: the indices for each activity.
* tidy_data: the tidy dataframe that contains the means for each variable for each subject for each activity.

## Input variables
Descriptive variable names are added to the column variable names. These mostly constitute the cellphone variables, and were adapted from 
the features.txt. More detail on each variable can be found in features_info.txt. 
Here is a list of the resulting variable names used in the analysis and output (normalized, unitless):

 -tBodyAccmeanX            
 -tBodyAccmeanY            
 -tBodyAccmeanZ           
 -tBodyAccstdX             
 -tBodyAccstdY             
 -tBodyAccstdZ            
 -tGravityAccmeanX         
 -tGravityAccmeanY         
 -tGravityAccmeanZ        
 -tGravityAccstdX          
 -tGravityAccstdY          
 -tGravityAccstdZ         
 -tBodyAccJerkmeanX        
 -tBodyAccJerkmeanY        
 -tBodyAccJerkmeanZ       
 -tBodyAccJerkstdX         
 -tBodyAccJerkstdY         
 -tBodyAccJerkstdZ        
 -tBodyGyromeanX           
 -tBodyGyromeanY           
 -tBodyGyromeanZ          
 -tBodyGyrostdX            
 -tBodyGyrostdY            
 -tBodyGyrostdZ           
 -tBodyGyroJerkmeanX       
 -tBodyGyroJerkmeanY       
 -tBodyGyroJerkmeanZ      
 -tBodyGyroJerkstdX        
 -tBodyGyroJerkstdY      
 -tBodyGyroJerkstdZ       
 -tBodyAccMagmean          
 -tBodyAccMagstd           
 -tGravityAccMagmean      
 -tGravityAccMagstd        
 -tBodyAccJerkMagmean      
 -tBodyAccJerkMagstd      
 -tBodyGyroMagmean         
 -tBodyGyroMagstd          
 -tBodyGyroJerkMagmean     
 -tBodyGyroJerkMagstd      
 -fBodyAccmeanX            
 -fBodyAccmeanY           
 -fBodyAccmeanZ            
 -fBodyAccstdX             
 -fBodyAccstdY            
 -fBodyAccstdZ             
 -fBodyAccJerkmeanX        
 -fBodyAccJerkmeanY       
 -fBodyAccJerkmeanZ        
 -fBodyAccJerkstdX         
 -fBodyAccJerkstdY        
 -fBodyAccJerkstdZ         
 -fBodyGyromeanX           
 -fBodyGyromeanY          
 -fBodyGyromeanZ           
 -fBodyGyrostdX            
 -fBodyGyrostdY           
 -fBodyGyrostdZ            
 -fBodyAccMagmean          
 -fBodyAccMagstd          
 -fBodyBodyAccJerkMagmean  
 -fBodyBodyAccJerkMagstd   
 -fBodyBodyGyroMagmean    
 -fBodyBodyGyroMagstd    
 -fBodyBodyGyroJerkMagmean      
 -fBodyBodyGyroJerkMagstd 

The feature_info.txt contains additional information:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (pre    fix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter     with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAc    c-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.                                                     
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also t    he magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyG    yroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyG    yroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern.
