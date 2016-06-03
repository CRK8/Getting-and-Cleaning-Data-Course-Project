run_analysis<-function(){
      
      library(reshape2)
      library(plyr)
      library(dplyr)
      
      features<-read.table("./UCI HAR Dataset/features.txt",quote="\"", comment.char="")
      activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
      X_test<-read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"",col.names = features$V2,comment.char="")
      y_test<-read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"",comment.char="")
      subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
      X_train<-read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"",col.names = features$V2,comment.char="")
      y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
      subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
      
      #Uses descriptive activity names to name the activities in the data set
      test<-merge(y_test,activity_labels)
      train<-merge(y_train,activity_labels)
      
      test[,1]<-subject_test
      train[,1]<-subject_train

      #Appropriately labels the data set with descriptive variable names.
      colnames(test)<-c("subject","activity")
      colnames(train)<-c("subject","activity")
      
      #Extracts only the measurements on the mean and standard deviation for each measurement.
      cols<-grep("mean\\(|std\\(",features$V2)
      right<-length(cols)+2
      test[,3:right]<-X_test[,cols]
      train[,3:right]<-X_train[,cols]
      
      # Merges the training and the test sets to create one data set.
      merged<-rbind(test,train)

      #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      tidy<-ddply(merged,.(subject, activity),colwise(mean))
      write.table(tidy,"tidy.txt",row.name=FALSE)
}
