library(dplyr)

# read the train and test x and y data from file as train_x_y,test_x_y
train_x <- read.csv("./UCI HAR Dataset/train/X_train.txt",sep="",header = FALSE)

train_y <- read.csv("./UCI HAR Dataset/train/Y_train.txt",sep="",header = FALSE)

test_x <- read.csv("./UCI HAR Dataset/test/X_test.txt",sep="",header = FALSE)

test_y <- read.csv("./UCI HAR Dataset/test/Y_test.txt",sep="",header = FALSE)

# read the features names
cnames <- read.csv("./UCI HAR Dataset/features.txt",header = FALSE,sep="")

vnames <- unlist(as.vector(cnames[,2]))
vd_names <- c()

i <- 1
for(col_name in vnames) {
  m <- match(col_name, vd_names) 
  if (is.na(m)) {
    vd_names <- c(vd_names,col_name)
  } else {
    vd_names <- c(vd_names,paste(col_name,i))
    i <- i + 1
  }
}

#read the subject train and test

subject_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt",sep="",header = FALSE)

subject_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt",sep="",header = FALSE)

colnames(subject_train) <- c("subject")
colnames(subject_test) <- c("subject")

# read the labels and activity type and rename 
labels <- read.csv(file="./UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE)
colnames(labels) <- c("activity_num","activity_labels")
# rename colnames of train and test x y
colnames(train_y) <- c("label")
train_y<-left_join(train_y,labels,by=c("label" = "activity_num"))

colnames(test_y) <- c("label")
test_y<-left_join(test_y,labels,by=c("label" = "activity_num"))

colnames(train_x) <- vd_names

colnames(test_x) <- vd_names

# merge the x,y ,and the train and test ,var data is the tidy data now
# Done request 3 Uses descriptive activity names to name the activities in the data set
train <- cbind(train_x,train_y['activity_labels'])
train <- cbind(train,subject_train)
test <- cbind(test_x,test_y['activity_labels'])
test <- cbind(test,subject_test)

# Done request 1 merge the train and test data
data <- rbind(train,test)  

# Done request 2
# var mean_std is the only the measurements on the mean and standard deviation for each measurement
mean_std <- select(data, contains("mean()") | contains("std()"))

# var angle is tidy data set with the average of each variable for each activity and each subject
result <- data %>% group_by(activity_labels, subject) %>% summarise_all(mean)

write.table(result,file="result.txt",row.names = FALSE)
