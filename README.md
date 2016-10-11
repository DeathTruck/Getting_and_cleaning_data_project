# Getting_and_cleaning_data_project

### by Nik Buenning
This is the repo for the Getting and Cleaning Data course project. The repo contains the R script used for the analysis, a codebook that describes the R code, and an output file with the tidy dataset.

## Files
- runanalysis.R: The R script that is used to read in the data, perform the cleaning, and output the tidy data set.
- codebook.md: The codebook that describes the the data and the variables. The codebook also goes over the step-to-step process to clean up the data.
- tidy_data.txt: The output of the analysis containing a table of the mean values for each variable for each subject and activity.

## The Analysis
The analysis in runanalysis.R assumes the data has been downloaded and extracted. The first line of executed code sets the working directory, which will need to be changed 
when reproducing the results. The working directoy should be where the data files reside. The code continues on to read in the test and training data for both X variables (the cell phone data), y variables
(the activity/label), and the subject for the experiment. All data are then merged. The code then extracts only the varialbes that constitutue a mean
or standard deviation (note that angle means and frequency means are not included, as these are different derived variables). 
Variable names are added to the dataframes and activity descriptions are also added. Mean values are calculated for each variable for each subject and
for each activity. The resulting datframe is outputted to tidy_data.txt.

## The Data
The input files can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The exact files that are needed to run the code (after the zip file is unzipped):
- activity_labels.txt
- features.txt
- test/X_test.txt
- test/subject_test.txt
- test/y_test.txt
- train/X_train.txt
- train/subject_train.txt
- train/y_train.txt


A description of the data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

source:
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

