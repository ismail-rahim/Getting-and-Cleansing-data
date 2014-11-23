Data and information of the project 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The attached R script (run_analysis.R) performs the following to clean up the data:

    1. Merges the training and test sets to create one data set, namely


    2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.


    3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

walking

walkingupstairs

walkingdownstairs

sitting

standing

laying

    4. The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.



    5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.

