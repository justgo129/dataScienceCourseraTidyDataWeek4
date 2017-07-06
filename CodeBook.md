Data from the UCI HAR 2012 Dataset, available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
was unzipped, with the README.txt file consulted in order to learn more about the dataset.
 
The “training” and “test” folders were extracted from the data available at the aforementioned link.  
Using the “rbind” command, the file called Xtest was appended to Xtraining thereby creating a “X” data frame within R.  
That called Ytest was appended to Ytraining in order to create a “Y” data frame within R.  
The rbind command created one dataset (i.e., one for X, one for Y) per the instructions for this exercise.  
Similarly, the subject_test file was appended to the subject_train file using R, creating a dataframe called “subject.”  Please
note that the original file X created in R was subsetted by second column using "X<-X[,2]" (without quotation marks) in order to
strip line number text from the file.

Noticing that the features_info.txt file (also available from the aforementioned zip file) contained 561 contents, the same number of columns in the X data frame.  In order to make the column names follow the conventions for “tidy” data mentioned in the lecture, the “gsub” command in R was used to (a) remove periods, hyphens, spaces, and underscores, (b) replace the names of the 561 columns with more descriptive ones (e.g., spelling out abbreviations).  This task was facilitated by there being multiple instances of various portions of column names (see the “features_info.txt” file available at the aforementioned URL), negating the need for a separate task of manually assigning a new name to each of the 561 columns. 
Column and row names for the Y dataset were populated using the “subject” dataframe.  
Features_info.txt also explains the methodology used in data collection and the rationale behind naming conventions.
The “apply” loop function was used to generate the required means across rows and columns and standard deviations for each column.
