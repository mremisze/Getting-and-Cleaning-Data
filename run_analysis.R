#The following R script does the following:

#1. Merges the training and the test sets to create one data set.

library(reshape2)

 #measurement
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
X <- rbind(test_x, train_x)
rm(test_x,train_x)

 #activities
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
Y <- rbind(test_y, train_y)
rm(test_y,train_y)
 
#subject 
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subject<-rbind(test_subject, train_subject)

rm(test_subject,train_subject)


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 


features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
colnames(X)<-features$V2
features_mean_std <- grep("(mean|std)\\(", features[,2])

X_final= X[,features_mean_std]
rm(X)

#3.Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

Y[,2] = activity_labels[Y[,1]]

#4. Appropriately labels the data set with descriptive variable names. 

names(Y) = c("ActivityID", "Activity")
names(subject) = c("Subject")

output<-cbind(subject, Y, X_final)
rm(X_final,Y,subject,features)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

melt = melt(output,  c("Subject", "ActivityID", "Activity"))
tidy   = dcast(melt, Subject + Activity ~ variable, mean)
write.table(tidy, file = "./tidy_data.txt",row.name=FALSE)
