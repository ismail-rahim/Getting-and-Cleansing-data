Data and information of the project 
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The attached R script (run_analysis.R) performs the following to clean up the data:

	*1. Reads in R the following files containing (features, test & train data, subjects and activity labels)
		- /features.txt (extract to be used as meaningful column name)
		- /test/X_test.txt (test data set)
		- /test/Y_test.txt (mapping of activities to test data set)
		- /train/X_train.txt (train data set) 
		- /train/Y_train.txt (mapping of activities to train data set)
		- /test/subject_test.txt (mapping of subjects to test data set)
		- /train/subject_train.txt (mapping of subjects to train data set)
		- /activity_labels.txt (map description the type of activities)
		
	*2. Apply the name of features to be meaningful column names to the datasets. (The features will be used as variable names as it is meaningful and descriptive)

	*3. Rename columns (subject and activity) in both test and train datasets to be meaningful.

	*4. Column bind the subject, activity and the respective data sets.

	*5. Row bind the 2 datasets (test and train) to be one dataset.

	*6. Merge and map the activity code to actual names of the activities below:

		Activity code		Activity Description
				1 				WALKING
				2 				WALKING_UPSTAIRS
				3 				WALKING_DOWNSTAIRS
				4 				SITTING
				5 				STANDING
				6 				LAYING

	*7. Subset only measurements that involves mean and standard deviations (std).

	*8. The script creates 2nd dataset with the average of each measurement and grouped by activity, subject.

	*9. Write and output it to .csv files.



