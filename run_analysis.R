library(dplyr)
library(readr)

#Reading all the X and Y training and test data
X_test <- read_table("X_test.txt", col_names = FALSE)
X_train <- read_table("X_train.txt", col_names = FALSE)
Y_test <- read_table("Y_test.txt", col_names = FALSE)
Y_train <- read_table("Y_train.txt", col_names = FALSE)

#Reading feature for column name and subject data
features <- read_table("features.txt", col_names = FALSE)
subject_test <- read_table("subject_test.txt", col_names = FALSE)
subject_train <- read_table("subject_train.txt", col_names = FALSE)

#Merging training and test data
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
subject <-rbind(subject_train, subject_test)

#Renaming column names
colnames(X) <- t(features)[2,]
colnames(Y) <- c("activity_label")
colnames(subject) <- c("subject")

#Reading activoty label mapping for Y data
labels <- read_table("activity_labels.txt", col_names = FALSE)
colnames(labels) = c("activity_label","activity")
Y_labeled <- left_join(Y, labels, by = "activity_label") 

#Add subject and activity labels to X dataset
all_data <- cbind(subject,X,Y_labeled)

#Select columns that contains the mean and standard deviation measurement to create dataset 1
tidy_dataset1 <- select(all_data, subject, activity, contains("mean") | contains("std"))

#Create dataset 2: average of each variable for each activity and each subject
grouped <- group_by(tidy_dataset1, subject, activity)
tidy_dataset2 <- summarise_if(grouped, is.numeric, mean, na.rm = TRUE)

#Writing datasets into .txt file
write.table(tidy_dataset1, file = "tidy_data1.txt", sep = " ", dec = ".", row.name = FALSE)
write.table(tidy_dataset2, file = "tidy_data2.txt", sep = " ", dec = ".", row.name = FALSE)