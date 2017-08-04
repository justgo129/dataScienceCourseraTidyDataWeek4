The run_analysis.R file computes various fitness-related metrics, namely mean and standard deviation, for many users based on 561 activities (called "variables") described in the "UCI HAR dataset". The underlying data analyzed are available from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The data were transformed to be stored in a "tidy" format, and integrates information carried in various files within the aforementioned zip files concerning activities and participants (called "subjects").  Each of the 561 activities was associated with one or more of six activities and 1-30 subjects.  The CodeBook in this repo contains links to much more in-depth information about the data analyzed in run_analysis.R, including a discussion of all the  files utilized, variables employed, their dimensions, meanings, and processing steps.

run_analysis.R performs the following tasks: (1) uses R's *rbind* command to combine the training and testing data for both X and Y (two files resulting: X and Y) as well as for *subject*, (2) uses the *aggregate* function to assign the variables to the activities and subjects, (3) merges additional information about activities, and (4) removes variables not pertaining to mean or standard deviation.   All columnnames were made tidy through the removal of punctuation marks, homogenization of formatting (i.e., all lower-case), and replacement of abbreviations with full names.

*Please note that the project invokes the "dplyr" and "stringr" libraries.*


