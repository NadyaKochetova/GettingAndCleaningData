#run_analysis.R
#Merges the training and the test sets to create one data set.
library(dplyr)
#read x_train data
x_train<-read.table(file="UCI HAR Dataset/train/X_train.txt")
#read subject train data e.g. subject id 
subject_train<-read.table(file="UCI HAR Dataset/train/subject_train.txt")
#read activity ids for x_train data
y_train<-read.table(file="UCI HAR Dataset/train/y_train.txt")

#read x_test data
x_test<-read.table(file="UCI HAR Dataset/test/X_test.txt")
#read subject train data e.g. subject id 
subject_test<-read.table(file="UCI HAR Dataset/test/subject_test.txt")
#read activity ids for x_train data
y_test<-read.table(file="UCI HAR Dataset/test/y_test.txt")

#read activity labels file. We will need it to describe activities e.g. Walking, Sleeping etc
act_labels <-read.table(file="UCI HAR Dataset/activity_labels.txt")
names(act_labels)<-c("activityId", "activityName")

#read activity labels file. We will need it to describe measurements
features <-read.table(file="UCI HAR Dataset/features.txt")
features <-features[,2]
# convert factor to character
features_char<-as.character(features)

# replace numeric training labels with well-names  e.g. Walking, Staying etc
#Uses descriptive activity names to name the activities in the data sets
#train_labels<-merge(y_train,act_labels)
#test_labels<-merge(y_test,act_labels)

#bind together main sets (x_train and x_test) with its labels and subjects
train<-cbind(subjectId=subject_train$V1, activityId=y_train$V1,x_train )
test<-cbind(subjectId=subject_test$V1, activityId=y_test$V1,x_test)


#now union the test and train sets 
merged<-rbind(train,test)
# add descriptions of the activities to enrich the data
merged<-merge(act_labels,merged,  by="activityId")
# clean up the merged dataset by removing redundant columns
merged<-merged[ , !(names(merged) %in% c("activityId", "activityName.y"))]
# rename activiyName.x column to activityName
names(merged)[1] <- "activityName"

#name the columns of the merged set 
names(merged)[3:563]<-features_char[1:561]

# extract only required columns plus subjectId and activityName
merged<-subset(merged, select = grep("mean\\(\\)|std\\(\\)|subjectId|activityName", names(merged),value=T))

#Appropriately labels the data set with descriptive variable names
names(merged) <- gsub("Acc", "Accelerator", names(merged))
names(merged) <- gsub("Mag", "Magnitude", names(merged))
names(merged) <- gsub("Gyro", "Gyroscope", names(merged))
names(merged) <- gsub("^t", "time", names(merged))
names(merged) <- gsub("^f", "frequency", names(merged))


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject (e.g. person).

tidy<-merged %>% group_by(subjectId, activityName) %>% summarise_each(funs(mean))
write.table(tidy, file = "tidy.txt", quote = FALSE,sep = ",",row.names = FALSE)


