##This repository contains R script for Getting and Cleaning Data Course Project .

<b>Directory structure</b>
Script assumes the following directory structure:
<ol>
<li>features.txt, activity_labels in R working directory
<li>Test files in test subdirectory of R working directory
<li>Train files in train subdirectory of R working directory
</ol>

<b>How do the script works:</b>
<ol>
<li>Read files with features and activity names 
<li>Read test sample data
<li>Define function Create_Data for merging X, y and subject id, adding feature names, extracting only features with means & std, adding sample label
<li>Run Create_Data against test and train data
<li>Merge train and test data using rbind
<li>Writes data to a file
<li>Next part creates second data frame using melt and dcast form reshape2, and saves result to a file 
</ol>

<b>Function Create_Data(subject,x,y,features,activity_labels,sample_label)</b>
Parameters:
<ol>
<li>subject – data frame with subject id's
<li>x – x data
<li>y – y data (activity codes)
<li>features – data frame with features name
<li>activity_labels - data frame with activity codes & labels
<li>sample_label – label added to a result file
</ol>
Function:
<ol>
<li>adds proper names to x columns  using features data frame
<li>creates names y and subject columns
<li>Find which x col names contains mean or std and creates subset of with these columns
<li>Merge data frames
</ol>

<b>Variables in result data file (first one)</b>
<ol>
<li>activity_code – original code of activity
<li>subject – subject ID
<li>variables - from original data (names form feature_names file)
<li>sample – sample id: Test – testing data, Train – train data
<li>activity – activity name
</ol>