# Description of run_analysis.R code.

Below are outlined logical steps that script will perform.



Merge the training and the test sets to create one data set:
* x_test.txt data is loaded to `test_x`.
* x_train.txt data is loaded to `train_x`.
* `test_x` and `train_x` are concatenated into one table: `X`. `test_x` and `train_x` are dropped.
* y_test.txt data is loaded to `test_y`.
* y_train.txt data is loaded to `train_y`.
* `test_y` and `train_y` are concatenated into one table: `Y`. `test_y` and `train_y` are dropped.
* subject_test.txt data is loaded to `test_subject`.
* subject_train.txt data is loaded to `train_subject`.
* `test_subject` and `train_subject` are concatenated into one table: `subject`. `test_subject` and `train_subject` are dropped.


Extracts only the measurements on the mean and standard deviation for each measurement: 
* features.txt data is loaded to `features.
* colnames() function is used to map column names in `X` into labels stored in `features`.
* list `features_mean_std` is loaded that only load labels that contain mean or std.
* list `features_mean_std` is used to only the measurements from `X` that contain mean or std and place the output `X_final`.
* `X`is then dropped.

Uses descriptive activity names to name the activities in the data set:
* activity_labels.txt data is loaded to `activity_labels`.
* new column in `Y` is added based on mapping the activity labels values from `activity_labels`.


Appropriately labels the data set with descriptive variable names:
* rename columns in `Y` into ActivityID and Activity.
* rename column in `subject` into Subject.
* create final table `output` containing data from `X_final`, `Y` and `subject`.
* drop tables `X_final`, `Y` and `subject`.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
* use `melt` function to transpose measurements columns into rows.
* use `dcast` to aggregated the mean for each activity and subject.
* save the results to txt.
