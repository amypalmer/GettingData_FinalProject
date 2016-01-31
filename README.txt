SummaryData.txt contains summarized data from the Human Activity Recognition Using Smartphones Dataset. 30 volunteers within an age bracket of 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually according to what activity the participant was engaged in at any given time point. The obtained dataset was originally randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

In SummaryData.txt, the test and training dataset have been re-combined to form one dataset with all the data. Furthermore, as each individual had multiple recordings for each of the six activities, their data for each of the six was averaged to obtain one datapoint per activity, per person. The dataset was further filtered by retaining only the mean and standard deviation measurement for each of the possible measurements. 

The dataset includes the following files:
=========================================

- ‘README.txt’

- ‘CodeBook.txt’: Explains and lists each of the variables in the final dataset

- ‘SummaryData.txt’: A text-file containing the labeled dataset

- ‘FinalProject.R’: commented R-code which transforms the original dataset into the summarized version