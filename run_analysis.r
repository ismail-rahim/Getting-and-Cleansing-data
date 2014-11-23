## set working directory
setwd("D:/Coursera/03 Getting and Cleaning data/Project/UCI HAR Dataset")

## read the features
features_a <- read.table("./features.txt")
features_b <- features_a[,2]

 ##read test data
 testX_a <- read.table("./test/X_test.txt", sep="")
 testY_a <- read.table("./test/Y_test.txt", sep="")
 
 
 ##read train data
 trainX_a <- read.table("./train/X_train.txt", sep="")
 trainY_a <- read.table("./train/Y_train.txt", sep="")
 
 ##read the subjects
 subjectsTest_a <- read.table("./test/subject_test.txt")
 subjectsTrain_a <- read.table("./train/subject_train.txt")
 
 ## rename the features columns
 names(testX_a) <- features_b
 names(trainX_a) <- features_b
 
 ## rename the activity columns
 names(testY_a) <- "activity"
 names(trainY_a) <- "activity"
 
 ## rename the subject columns
 names(subjectsTest_a) <- "subject"
 names(subjectsTrain_a) <- "subject"
 
 ##Column Bind the subject, activity & dataset to form test dataset
 testSet_a <- cbind(subjectsTest_a,testY_a,testX_a)
 
 ##Column Bind the subject, activity & dataset to form train dataset
 trainSet_a <- cbind(subjectsTrain_a,trainY_a,trainX_a)
 
 ##read the activities
 activityType <- read.table("./activity_labels.txt",col.names = c("activity","activity_desc"))
 
 ## Row bind the test and train datasets
 ds_testNtrain_a <- rbind(testSet_a,trainSet_a)
 
 ## Merge the activities to the dataset
 ds_testNtrain_b<- merge(ds_testNtrain_a,activityType, by = "activity",sort=FALSE)
 
 ## Move the "activity_desc" column to the 1st column
 ds_testNtrain_c <- ds_testNtrain_b[,c(564,2:563)]
 
 ## List the mean attributes
 meanAttr <- grep("mean",names(ds_testNtrain_c),value=TRUE)
 
 ## List the mean attributes
 stdAttr <- grep("std",names(ds_testNtrain_c),value=TRUE)
 
 ## List the 1st three attributes (activity_desc, subject, activity)
 impAttr <- head(names(ds_testNtrain_c),3)
 
 ## Append the attributes
 selectedAttr <- append(impAttr,meanAttr)
 selectedAttr <- append(selectedAttr,stdAttr)
 
 ## Dataset containing mean and std attributes
 ds_testNtrain_d <- ds_testNtrain_c[,selectedAttr]
 
 ## write data to csv
 write.table(ds_testNtrain_d,"ds_testNtrain_d.txt", row.name= FALSE)

 ## 2nd Dataset with aggregated mean by activity and subject
 ds_testNtrain_e <- aggregate(ds_testNtrain_d,by=list(activity = ds_testNtrain_d$activity,subject=ds_testNtrain_d$subject),mean) 
 ds_tidy <- ds_testNtrain_e[,c(1,2,5:82)]
 
 ## write tidy data to csv
 write.table(ds_tidy,"ds_tidy.txt", row.name= FALSE)
 
 
 
 
 ##-----------Ignore below this line ---------------------------------
 ## Split the activity and subjects
 ## ds_testNtrain_e<-split(ds_testNtrain_d,list(ds_testNtrain_d$activity_desc,ds_testNtrain_d$subject))
 ## a <- lapply(ds_testNtrain_e, `[`, 4:82)
 