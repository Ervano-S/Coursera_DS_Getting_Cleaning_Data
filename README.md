# Coursera_DS_Getting_Cleaning_Data

==================================================================
Cleaning the Dataset of Human Activity Recognition Using Smartphones Dataset
==================================================================
Ervano Nurriyadi Suparno
Final project of Coursera course "Getting and Cleaning Data"
==================================================================

This script is to summarize the data produced from the experiment "Human Activity Recognition Using Smartphones Dataset Version 1.0" by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory. 

The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': Shows information about the variables used on how the transformation take place.

- 'run_analysis.R': R script that transforms the raw data into tidy dataset combinibg the Training and test datset along with the labels and the subject. It also produces the summarized dataset for each subject and activity.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

In the script, the training and test datasets of X and Y are first merged into a single dataset. Then, X, Y and subject datasets are also merged to give a single table consisting all the measurements mapped to each subject and with the actity labels as well. On the last part of the script, all the required measurements (mean and standard deviation of the measurements) are summarized using the mean for each subject and activity.

