# Description of run_analysis.R code.

Below are outlined logical steps that script will perform.



Merges the training and the test sets to create one data set:
* `X` contains x train and test data.
* `Y` contains y train and test data.
* `subject` contains subject train and test data.


Extracts only the measurements on the mean and standard deviation for each measurement: 
* Relabel column headers in `X` based on the data from `features`.
* Load only measurements of mean and std to `X_final`.

Uses descriptive activity names to name the activities in the data set:
* Add another column with activity names to `Y`.


Appropriately labels the data set with descriptive variable names:
* Rename columns in `Y`.
* Rename column in `subject`.
* Create final data table `output` containing data from `X_final`, `Y` and `subject`.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
* Use `melt` function to transpose measurements columns into rows.
* Use `dcast` to aggregated the mean for each activity and subject.
* Save the results to txt.
