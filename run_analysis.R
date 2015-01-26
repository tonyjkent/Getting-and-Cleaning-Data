# Getting and cleaning data 010
# Course Project
# Tony Kent Jan 21, 2015
# 
##################################################################################
#"Your data files need to be in a data subfolder.  eg. ./data/UCI HAR Dataset")
##################################################################################
# load librarys
library(dplyr)

# Create folder to store the data files
#if (!file.exists("data")) {
#      dir.create("data")
#}


# Download and unzip the files to a subfolder called data
#fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL,destfile ="./data/Dataset.zip")
#unzip("./data/Dataset.zip",exdir="./data")


# load column headers and activity names

activityname<- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activityname)=c("ActivityNum","ActivityName")
columnheaders<-read.table("./data/UCI HAR Dataset/features.txt")
columnheaders$cleanname <- make.names(columnheaders[,2],unique=TRUE)


# load  data
traindata<-read.table("./data/UCI HAR Dataset/train/x_train.txt",row.names=NULL)
trainsubjects<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainactivitynum<-read.table("./data/UCI HAR Dataset/train/y_train.txt")

testdata<-read.table("./data/UCI HAR Dataset/test/x_test.txt",row.names=NULL)
testsubjects<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testactivitynum<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

# Step 1 merge training data into one dataframe
rawdata <- rbind(testdata,traindata)
colnames(rawdata)=columnheaders[,3]  ##apply cleaned column names
activitynum <-rbind(testactivitynum,trainactivitynum)
subjects <-rbind(testsubjects,trainsubjects)


# Step 2 extract only columns that are mean and standard deviation

data <- select(rawdata,c(grep("mean|std",colnames(rawdata))))
data=cbind(subjects,activitynum,data)
colnames(data)[1:2]=c("Subject","ActivityNum")

# Step 3 Add Descriptive Activity Name
data <- merge(data,activityname,all.x = TRUE)  # add the activity name to the data

Make 

#Step 4 change column headers to make them more descrptive
names=colnames(data)
changenames = function () {
      for (i in 1:ncol(data)) {
            if (substr(names[i],1,1)=="t") {names[i] <<- sub("t","Time",names[i],fixed=TRUE)
            }
            if (substr(names[i],1,1)=="f") {names[i] <<- sub("f","Freq",names[i],fixed=TRUE)
            }  
      
      } 
    names <<- gsub(".","",names,fixed="TRUE")  
    names <<- gsub("mean","Mean",names,fixed="TRUE")
    names <<- gsub("Gyro","Gyroscope",names,fixed="TRUE") 
    names <<- gsub("Mag","Magnitude",names,fixed="TRUE") 
    names <<- gsub("std","StandardDeviation",names,fixed="TRUE") 
    names <<- gsub("Acc","Acceleration",names,fixed="TRUE") 
    names <<- gsub("X","XAxis",names,fixed="TRUE") 
    names <<- gsub("Y","YAxis",names,fixed="TRUE") 
    names <<- gsub("Z","ZAxis",names,fixed="TRUE") 
    
} 
changenames()
colnames(data)=names

# Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
if (exists("sumdata")) {rm(sumdata)}

sumdata=data %>% group_by(Subject,ActivityName) %>% summarise_each(funs(mean))%>% arrange(Subject,ActivityName)
colnames(sumdata)[4:ncol(sumdata)]=paste("Average",colnames(sumdata)[4:ncol(sumdata)],sep="")
write.table(sumdata,file="./data/summary.txt",row.name=FALSE)
