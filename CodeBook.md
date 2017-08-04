# Overview

Data from the UCI HAR 2012 Dataset, available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
were unzipped, with the README.txt file consulted in order to learn more about the dataset.

Within the .zip file, the features.txt file contained the names of 561 variabes for feature vectors derived from
data obtained from activities performed either by an accelerometer or gyroscope 3-axial raw signals.  These
measurements were taken in the X, Y, and/or Z dimensions.  More information about these activities and the manner
in which the measurements were derived could be found in the features_info.txt file embedded within the
aforementioned zip file.  **These variables for feature vectors are what we simply call "variables" below"**.

The 561 variables of the feature vectors fall into six broader categories, spelled out in the *activity_labels* file.    The numeric
codes for these six broader activities could also be found in the *Ytraining* and *Ytest* files.  The numeric codes and their regular meanings (per the *activity_labels* file were as follows:
- 1 = WALKING
- 2 = WALKING_UPSTAIRS
- 3 = WALKING_DOWNSTAIRS
- 4 = SITTING
- 5 = STANDING
- 6 = LAYING
 
 # Process - see also run_analysis.R for the complete R code
The “training” and “test” folders were extracted from the data available at the aforementioned link.  
The command *rbind* was used to:
 - Append the *Xtest* file to *Xtraining*, creating a single file called *X*.
 - Append the *Ytest* file to *Ytraining*, creating a single file called *Y*.
 - Append the *subjecttest* file to *subjecttraining*, creating a single file called *subject*.
 
 # More notes about files
- The 561 names in features.txt match those in *X* except *X* contained 10299 values for each of the 561 values, whereas features.txt just contained the names of the variables.  The dimensions of *X* were therefore 10299 rows * 561 columns.
- The values of *Y* varied between 1 and 6, corresponding to the activities to which the feature vector variables can be mapped.  The dimensions of Y were 10299 rows * 1 column.  
- The values of *subject* varied between 1 and 30, corresponding to the 30 participants in the study.  The dimensions of *subject* were 

Nonetheless, 10299 values existed for each variable given that multiple participants partook in multiple activities multiple times.  

Since the assignment mandated the sole retention of columns dealing with the mean or standard deviation of an activity, the *X<-X[!is.na(names(X))]* command was used to delete all columns that measured other aspects of parameters.  This left X with a dimension of 10299 rows * 79 columns instead of 10299 rows * 561 columns.

Using the *gsub* command, the column names of file X were made "tidy" by:
- spelling out abbreviations (e.g., changing "std" to "standarddeviation", changing "X" to "Xdimension", "acc" to "acceleration", etc.)
- removing parentheses and hyphens
- having all column names lower-case (per the requirements of one of the class slides).  This led to the revision of the original variable names (from *X* and features.txt) to those shown below in Appendix 1 of this CodeBook.

In order to create the dataset mentioned in step #5 of the instructions: computation of the value of variable per activity per activity per subject, the activity (*Y*) and *subject* files were added to the existing *X* dataframe using *cbind*, thus creating a new data frame called *xysubject*.  *xysubject* now had dimension 10299 rows * 81 columns, with columns 80 and 81 being *Y* and *subject*, respectively.  The required computation was performed using the following command:

    variableactivitysubject <-aggregate(xysubject, by=list(Y, subject), FUN=mean, na.rm=TRUE)

As shown above, the file *activity_labels* contained a key, mapping each of the six numeric values of Y to the name of a general activity.  The exercise concluded when the information from *activity_labels* was merged into variableactivitysubject in order to provide meaningful information, retaining the same data frame name: *variableactivitysubject*. 

# Appendix 1: Names of variables employed in analysis (79) todo

-



