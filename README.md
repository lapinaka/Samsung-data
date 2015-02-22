# Samsung-data
for class.coursera.org

This project includes: a tidy data set, script for performing the analysis
called run_analysis.R, a code book that describes the variables, the data,
and any transformations or work that I performed to clean up the data called
CodeBook.md.

Script "run_analysis.R"" does the following:

Step 1 - Merges the training and the test sets to create one data set:

I read the files: "X_train.txt", "X_test.txt" in R program, and then I created
a new variable "data1" by combining these objects using the rbind ()
I read the files: ""subject_train.txt", ""subject_test.txt" in R program, and then I created a new variable "data2" by combining these objects using the rbind ()
I read the files: "y_train.txt", "y_test.txt" in R program, and then I created
a new variable "data3" by combining these objects using the rbind ()
I created a database called "date" united "data1", "data2", "data3" using the
data.frame()

Step2 - Extracts only the measurements on the mean and standard deviation for each measurement:
I read the file "features.txt" in R program, and then I created
a new variable "featuresvector". Each column of the data set "data1" I assigned
the name corresponding to the "featuresvector".
Then I left only the columns containing the name of the word "mean" or "Mean"
or "std".

Step3 - Uses descriptive activity names to name the activities in the data set:
Using the recorde() I replaced the data from numbers to descriptive
activity names

Step4 - Appropriately labels the data set with descriptive variable names
I added the name of the column

Step5-From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject:
To solve this task, I used the ddply() from the package "plyr".

