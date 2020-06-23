
library(dplyr)

# read the train and test x and y data from file as train_x_y,test_x_y
train_x <- read.csv("./UCI HAR Dataset/train/X_train.txt",sep="",header = FALSE)

train_y <- read.csv("./UCI HAR Dataset/train/Y_train.txt",sep="",header = FALSE)

test_x <- read.csv("./UCI HAR Dataset/test/X_test.txt",sep="",header = FALSE)

test_y <- read.csv("./UCI HAR Dataset/test/Y_test.txt",sep="",header = FALSE)

# read the features names
cnames <- read.csv("./UCI HAR Dataset/features.txt",header = FALSE,sep="")

vnames <- unlist(as.vector(cnames[,2]))

# rename colnames of train and test x y
colnames(train_y) <- c("label")

colnames(test_y) <- c("label")

colnames(train_x) <- vnames

colnames(test_x) <- vnames

# merge the x,y ,and the train and test ,var data is the tidy data now
train <- cbind(train_x,train_y)
test <- cbind(test_x,test_y)
data <- rbind(train,test)

# var mean_std is the only the measurements on the mean and standard deviation for each measurement
mean_std <- select(data, contains("mean()") | contains("std()"))

# var angle is tidy data set with the average of each variable for each activity and each subject
angle <- select(data,contains("angle"))

write.table(angle,file="angle.txt",row.names = FALSE)