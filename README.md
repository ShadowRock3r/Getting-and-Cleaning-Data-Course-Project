# Getting-and-Cleaning-Data-Course-Project
============================================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The original dataset can be found in: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The assignment asks for:

1) a R script called run_analysis.R that does the following:
  -Merges the training and the test sets to create one data set.

  -Extracts only the measurements on the mean and standard deviation for each measurement. 

  -Uses descriptive activity names to name the activities in the data set

  -Appropriately labels the data set with descriptive variable names. 

  -From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each     activity and each subject.
  
2) a link to a Github repository with the script for performing the analysis;

3)a code book that describes the variables, the data, and any transformations or work  performed to clean up the data called CodeBook.md

4)This README.md file.

============================================
The assignment includes the following files:

-'README.txt'
  This file.

- 'run_analysis.R'
    The script has 3 sections:
     - EXTRACTION: Where the files are downloaded and the data sets are assigned to variables in the work environment
     - TRANSFORMATION: Where the data sets are properly labelled, then I first joined the test files and train files         separately before merge then in one data set. So the unused data set are deleted from the work environment, and        the mean and standard deviation columns were extracted. And finally the activity column is properly filled with        descriptive data.
     - LOADING: The resulting data set is stored in a object called tidyData and saved as tidydata.txt in the               project folder.
    
- 'codebook.Rmd'
    A RMarkdown script that creates a code book.
    https://github.com/rubenarslan/codebook
    
- 'codebook.html'
  The code book itself
  
- 'tidydata.txt'
  The tidy data set 