
#Read files with features and activity names 
features <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/features.txt", quote="\"")
activity_labels <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/activity_labels.txt", quote="\"")
colnames(activity_labels)=c("code","activity")

#Read test sample 
subject_test <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/test/subject_test.txt", quote="\"")
X_test <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/test/X_test.txt", quote="\"")
y_test <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/test/y_test.txt", quote="\"")

#Read train sample
subject_train <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/train/subject_train.txt", quote="\"")
X_train <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/train/X_train.txt", quote="\"")
y_train <- read.table("~/R/Coursera/Getting and Cleaning Data/Project/train/y_train.txt", quote="\"")



#Define function for mergin X, y and subject id, adding feature names, 
#extracting only features with means & std, adding sample label
Create_Data<-function(subject,x,y,features,activity_labels,sample_label)
{
  colnames(x)=features[,2]
  colnames(y)="activity_code"
  colnames(subject)="subject"
  IsMean=grepl("mean()",features[,2],fixed=TRUE)
  IsSD=grepl("std()",features[,2],fixed=TRUE)
  IsMeanOrSD=IsMean | IsSD
  x=x[,IsMeanOrSD]
  Data=cbind(subject,y,x)
  Data$Sample=sample_label
  Data=merge(Data,activity_labels,by.x=2,by.y=1)
  Data
}
#run the function for test and train
DataTest=Create_Data(subject_test,X_test,y_test,features,activity_labels,"Test")
DataTrain=Create_Data(subject_train,X_train,y_train,features,activity_labels,"Train")
#View(DataTest)
#View(DataTrain)

#merge data
Data=rbind(DataTrain,DataTest)

#save it to a file
write.csv(Data,"data.csv")

#Now second file
library("reshape2", lib.loc="~/R/win-library/3.1")
#Remove some not needed variables
DataForMelt=Data[,c(2:68,70)]

#melitng
DataMelt=melt(DataForMelt,id=c("subject","activity"))
#csating
DataAg=dcast(DataMelt,activity+subject~variable,mean)
#save result to a file
write.csv(DataAg,"averages.csv")


