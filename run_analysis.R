#### The following code reads in cell phone data, merges test and training data
#### Computes mean values on a subset of the variables and outputs the data 
### Set the working directory (This will need to be changed when reproducing results)
setwd("/Users/buenning/data_science/data_cleaning/UCI")

#### load proper packages
library(dplyr)

##### Merge all the data (Part 1)
#### Get the test data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#### Merge the columns
new0 <- cbind(x_test, y_test, subject_test)

### get the training data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#### Merge the training data. And then merge train and test (all_data)
new1 <- cbind(x_train, y_train, subject_train)
all_data <- rbind(new0, new1)

# Save the y and subject variable indices
yindex <- 562
subindex <- 563

#### find the features that end in mean or std()..... (Part 2)
features0 <- read.table("features.txt")
features <- as.character(features0[,2])
these_features <- grep("mean\\(\\)|std()", features)
var_names <- features[these_features]                  #### save for part 4
these_features <- c(these_features, yindex, subindex)  #### add y and subject indices

#### sub sample the data
my_data <- all_data[,these_features]

#### Name activity (Part 3)
act_table <- read.table("activity_labels.txt")
act_labs <- as.character(act_table[,2])
activity <- as.character(my_data$V1.1)
#### loop through the 6 activities
for (i in 1:6) {
   here_index <- which(my_data$V1.1 == i)
   activity[here_index] <- act_labs[i]
}

### add activity vector to the data frame
my_data <- mutate(my_data, activity= activity)

#### name the variable names (Part 4)
var_names <- c(var_names, "y", "Subject", "Activity")
var_names<- gsub("\\(\\)", "", var_names) #### gets rid of parentheses
var_names<- gsub("-", "", var_names) #### gets rid of minus signs
names(my_data) <- var_names

### Calculate means for each subject, each variable and each activity
#### using aggregate and put in a tidy data frame (Part 5)
tidy_data <- aggregate(my_data, 
            by=list(subject = my_data$Subject, activity= my_data$Activity), FUN=mean)
# get rid of these last few columns
tidy_data <- select(tidy_data, -y, -Activity, -Subject)

#### output to a text file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)