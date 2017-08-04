The run_analysis.R file computes various fitness-related metrics, namely mean and standard deviation, for many users based on 561 activities described in the "UCI HAR dataset". The data are stored in a "tidy" format. The CodeBook in this repo contains links to more information about the data analyzed in run_analysis.R, including a discussion of all the key files utilized, variables employed, their dimensions, meanings, and processing steps.

run_analysis.R performs the following tasks: (1) uses R's "rbind" command to combine the training and testing data for both X and Y (two files resulting: X and Y) and subject (subject).  (2) performs "tidy" data operations using the "gsub" command to clean up the column names using the information in features.txt, which is a file that came in the zip file linked to below).  Means and standard deviations were trained  # todo clarify this

Finally, means were computed across all activities (i.e., one mean per each of 561 activity) and for each of the participants.

The underlying data analyzed are available from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
