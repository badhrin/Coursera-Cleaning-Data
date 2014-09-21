Coursera---Cleaning-Data
========================

Created for the Programming assignment of Getting &amp; Cleaning Data of Coursera

run_analysis.R
This describes what the run_analysis.R script does. This scrip has been created as part of the programming assignement for the Getting & cleaning Data course of Coursera

This script takes as input all the files that are in the folder downloaded in
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This zip file needs to be unzipped and will result in a folder 'UCI HAR Dataset'.

This 'UCI HAR Dataset' folder needs to be set as the Working Directory - this is necessary for this run_analysis.R script to run successfully (as it is based on the same directory structure & takes the files from this folder structure)

The run_analysis.R file has clear comments provided for each of the steps. The following are the major steps performed:
1. The 'test' & 'train' files are all collated into a single dataset
2. The columns of the dataset are renamed into meaningful names (read from the 'features' file)
3. Only the 'Mean' & 'Standard Deviation' related columns are retained in the dataset. Other columns are discarded
4. The values in the 'activity' column are updated to meaningful english values (read from the 'activity_labels' file)
5. A new dataset is created by aggregating all the information based on the Activity & Subject.
6. The new aggregated dataset is written into 'tidy_data_badhri.txt'. Note that the column separator is set to comma. So this file can even be considered as a CSV.

The Code Book


