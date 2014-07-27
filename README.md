This repository contains R script for Getting and Cleaning Data Course Project .

Script assumes the following directory structure:
	features.txt, activity_labels in R working directory
	Test files in test subdirectory of R working directory
	Train files in train subdirectory of R working directory

How do the script works:
Read files with features and activity names 
Read test sample data
Define function Create_Data for merging X, y and subject id, adding feature names, extracting only features with means & std, adding sample label
Run Create_Data against test and train data
Merge train and test data using rbind
Writes data to a file
Next part creates second data frame using melt and dcast form reshape2, and saves result to a file 

Function Create_Data(subject,x,y,features,activity_labels,sample_label)
subject � data frame with subject id's
x � x data
y � y data (activity codes)
features � data frame with features name
activity_labels - data frame with activity codes & labels
sample_label � label added to a result file
Function:
adds proper names to x columns  using features data frame
names y and subject columns
Find which x col names contains mean or std and creates subset of with these columns
Merge data frames

Variables in result data file (first one)
activity_code � original code of activity
subject � subject ID
variables - from original data (names form feature_names file)
sample � sample id: Test � testing data, Train � train data
activity � activity name