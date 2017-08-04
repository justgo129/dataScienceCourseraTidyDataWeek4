# Peer-graded Assignment: Getting and Cleaning Data Course Project
# Filename: run_analysis.R 

# Load libraries:
setwd("C:\\Users\\justin.goldstein\\Documents\\tidydata")
library(stringr)
library(dplyr)

# read files into R:
X_train<-read.table("X_train.txt", sep="")
X_test<-read.table("X_test.txt", sep="")
Y_train<-read.table("y_train.txt", sep="")
Y_test<-read.table("y_test.txt", sep="")
subject_train<-read.table("subject_train.txt", stringsAsFactors=TRUE)
subject_test<-read.table("subject_test.txt", stringsAsFactors = TRUE)

#combine training and test data for X, Y, and subject
X <-
  rbind(X_train, X_test) %>%
  as.data.frame()
Y <-
  rbind(Y_train, Y_test) %>%
  as.data.frame()
subject <-
  rbind(subject_train, subject_test) %>%
  as.data.frame()


# Extract only fields containing "mean" and "stdev".
# We use "features.txt" since that carries the column names to apply
# to X.
# Read in all column names from column.txt

features<-read.table("features.txt", sep="", stringsAsFactors=TRUE)
colnames(X)<-features[,2]

#Extracts all the 79 candidate measurements (delete others)
names(X)<-grep("mean|std", names(X), val=TRUE)
X<-X[!is.na(names(X))]  # removed non "mean" or "std" columns

# Now, we handle Step 5: variable/activity/student:

 # (1) Create data frame with "tidy" names from which to perform
 #averaging/aggregation
XYsubject<-cbind(X, Y, subject)

 # (2) Perform analysis, using aggregation
XYsubject<-aggregate(XYsubject, by=list(XYsubject[,80], XYsubject[,81]), 
                    FUN=mean, na.rm=TRUE)
XYsubject<-XYsubject[,1:81]  # removes the final two unnecessary columns
                              # created during cbind
colnames(XYsubject)[c(1,2)] <- c("activity_number", "subject") # tidy names


 # (3) Create additional column having descriptive names for the activities
activity_labels<-read.table("activity_labels.txt", sep="")
XYsubject <- merge(XYsubject, activity_labels, 
                    by.x=c("activity_number"), by.y=c("V1")) 
XYsubject<-XYsubject[,c(2,82, 1, 3:81)]
tolower(colnames(XYsubject)[2] <- "activitylabel")

 # (4) Make "tidy" column names
colnames(XYsubject)<-gsub("freq", "frequency", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("std", "standardDeviation", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("-X$", "Xdimension", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("-Y$", "Ydimension", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("-Z$", "Zdimension", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("XYZ$", "XYZdimensions", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("^t", "Timeof", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("^f", "Frequencyof", colnames(XYsubject),
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("\\s", "\\S", .)
colnames(XYsubject)<-gsub("bodyacc-", "BodyAcceleration", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("gravityacc-", "GravityAcceleration", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("bodyaccjerk-", "BodyJerkMeasuredByaccelerometer", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("BodyGyro-", "BodyMeasuredbyGyroscope", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("BodyGyroJerk-", "BodyJerkMeasuredbyGyroscope", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("BodyAccMag", "BodyAccelerationMagnitude", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("GravityAccMag", "GravityAccelerationMagnitude", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("BodyAccJerkMag", "BodyJerkMagnitude", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("BodyGyroMag", "BodyMagnitudeMeasuredByAccelerometer", 
                           colnames(XYsubject), ignore.case=TRUE) 
colnames(XYsubject)<-gsub("BodyGyroJerkMag", 
                           "BodyJerkMagnitudeMeasuredByAccelerometer",
                           colnames(XYsubject),ignore.case=TRUE) 
colnames(XYsubject)<-gsub("bodybody", "Body", colnames(XYsubject), 
                           ignore.case=TRUE) 
colnames(XYsubject)<-gsub("\\()", "", colnames(XYsubject)) 
colnames(XYsubject)<-gsub("-", "", colnames(XYsubject))

colnames(XYsubject)<-tolower(colnames(XYsubject))  #one of the reqs of "tidy" 
                                           #data per last slide


 # (5) Write result of Step #5 to text file:
write.table(XYsubject, 
            "C:\\Users\\justin.goldstein\\Documents\\tidydata\\week4.txt", 
            row.name=FALSE,
            sep=",")
