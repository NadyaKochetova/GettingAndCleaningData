# GettingAndCleaningData
This is a submission for the Coursera Getting and Cleaning Data Assignment. As a part of submission the following files are provided:
* run_analysis.R file (pleasee see its purpose  below)
* Tidy.txt - a final data set genarated by run_analysis.R script. Note there was no clear definition on how the final dataset should look like. The attached tidy.txt file complies with the following principles:
  * a) each variable is in one column
  * b) different oservations of the variables are in different columns e.g. subjectId, activityName
* CodeBook.md describes the variables, the data and any transformation that has been performed to clean up the data. 

To get a final dataset please following the steps:
* Download Coursera's materials from below and unzip the files. It could be done programmatically but is out of scope of this assignment. 
* Set your working directory using setwd() command to a folder with unzipped data.
* Execute run_analysis.R script
* If no errors occurs, a final dataset tidy.txt should be generated in the working directory.


**Original requirement from Coursera:**

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
