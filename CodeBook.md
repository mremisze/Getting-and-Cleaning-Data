Description of run_analysis.R code.

Requirements:
	- This code assumes that files (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are 	

	already downloaded and extracted.
	- reshape2 needs to be installed
 
1. Merges the training and the test sets to create one data set.
	 `X` contains x train and test data
	 `Y` contains y train and test data
	 `subject` contains subject train and test data

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	  relabel column headers in `X` based on the data from `features`
	  load only measurements of mean and std to `X_final`

3. Uses descriptive activity names to name the activities in the data set
* add another column with activity names to `Y`


4. Appropriately labels the data set with descriptive variable names. 
* rename columns in `Y`
* rename column in `subject`
* create final data table `output` containing data from `X_final`, `Y` and `subject`

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and 

each subject.
* use `melt` function to transpose measurements columns into rows
* use `dcast` to aggregated the mean for each activity and subject
* save the results to txt
