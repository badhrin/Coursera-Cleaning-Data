
# Set the Working Directory to the UCI HAR Dataset directory (as downloaded without changing the folder structure) - this is a prerequisite
<<<<<<< HEAD
setwd("D:\\Learning\\Coursera\\Cleaning Data\\wdir\\ProjectAssgn\\UCI HAR Dataset")

# Load required packages. This requires these packages to be installed already
library(dplyr)

=======
>>>>>>> ClnData/master
# Each of the files in the TRAIN folder is loaded to a dataframe
sub_train <- read.table("train\\subject_train.txt")
y_train <- read.table("train\\y_train.txt")
x_train <- read.table("train\\X_train.txt")
# All the TRAIN dataframes are combined into a single dataframe.This is bringing together columns
tot_train <- cbind(sub_train,y_train,x_train)

# Each of the files in the TEST folder is loaded to a dataframe
sub_test <- read.table("test\\subject_test.txt")
y_test <- read.table("test\\y_test.txt")
x_test <- read.table("test\\X_test.txt")
# All the TEST dataframes are combined into a single dataframe. This is bringing together columns
tot_test <- cbind(sub_test,y_test,x_test)

# The TRAIN & TEST dataframes are combined into a single dataframe. This is bringing together rows.
# This completes STEP1 of the Programming Assignment(PA)
tot_all <- rbind(tot_train,tot_test)

# The FEATURES & ACTIVITY LABELS files are also loaded into their respective dataframes.
ftrs <- read.table("features.txt")
act_lbl <- read.table("activity_labels.txt")

# This is actually STEP 4 of the Programming Assignment, but is bieng done in advance.
# The columns for the tot_all dataframe are being renamed. Note that except for the first 2 columns that are being provided hard-coded names, the rest of the column names are derived from the FEATURES dataframe.
names(tot_all) <- c("subject","activity",as.vector(ftrs$V2))

# This completes STEP 2 of the Programming Assignment.
# Only columns with the words "mean" & "std" are being extracted to a new dataframe. Obviously the subject & activity columns are also included.
tot_mnstd <- select(tot_all,subject,activity,contains("mean"),contains("std"))

# This is intermediate step to achieve STEP3 of the Programming Assignment.
# This is done to facilitate the use of the inner_join in the next step. The inner_join seems to require the same column name. Hence this step. 
names(act_lbl)[1] <- "activity"

# This completes STEP 3 of the Programming Assignment.
# SUB-STEP 1 - Use inner_join function of DPLYR to create an additional column containing the activity description
# SUB-STEP 2 - Mutate the resulting dataframe to assign the additional column (V2) values to the 'activity' column
# SUB-STEP 3- Select all the columns except the additional column (V2)
tot_mnstd_desc <- inner_join(tot_mnstd,act_lbl,by="activity",type="inner") %>% mutate(activity=V2) %>% select(-V2)

# Note that STEP 4 of the Programming Assignment was completed earlier

# This completes STEP 5 of the Programming Assignment.
# SUB-STEP 1 - Use the aggregate function to group the dataframe by Subject & Activity and get the Mean of all other columns
# SUB-STEP 1 - This step was required because the aggregate function created 2 new columns, but performed the Mean over the existing subject & activity columns too. This resulted in the Activity column having NA. So the intent is to remove the older activity & subject columns.
# SUB-STEP 1 - This step is just to re-arrange the columns such that the Subject column comes before the Activity column.
td_data <- aggregate(tot_mnstd_desc,by=list(Subject=tot_mnstd_desc$subject,Activity=tot_mnstd_desc$activity),mean) %>% select(-activity,-subject) %>% select(Activity,Subject,3:length(names(tot_mnstd_desc)))

<<<<<<< HEAD
#Update columns to prefix it by 'mean'. Exclude the first 2 columns
names(td_data)[3:length(names(td_data))] <- paste("mean_",names(td_data)[3:length(names(td_data))],sep="")

=======
>>>>>>> ClnData/master
# This simply writes the data to the file. Making the separator as comma.
write.table(td_data,file="tidy_data_badhri.txt",row.names=FALSE,sep=",")

# There are probably better ways of achieving this. Please provide your comments in your evaluation to help me know more ways.