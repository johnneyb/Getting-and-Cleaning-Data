# Getting-and-Cleaning-Data
Getting and Cleaning Data Project.
==================================

This exercise was carried out as part of a Coursera course on Getting and Cleaning Data. I acknowledge the publication listed under reference [1] as a 
pre-requisite for using the data.

Background reading and viewing are listed at the end of this file.
The fourth item is of particular interest and is a good starting place if you
to make sense of the data used in this exercise.

1.	Original Raw Data.
======================

	The original raw data was collected from 30 different people (subjects) in carrying out six everyday activities. The activities were the act of 
sitting down, the act of standing up, walking, laying prone on a table,
walking up stairs and walking down stairs. Data was collected by wearable data collection equipment i.e. a smart phone.

2.	Original Data.
==================

    The original data came in nine different files. This data was split in the ratio 30%: 70% or 9:21 subjects classified as test:training respectively.
    
The subsequent test data files are listed here.
body_acc_x_test.txt
body_acc_y_test.txt
body_acc_z_test.txt
body_gyro_x_test.txt
body_gyro_y_test.txt
body_gyro_z_test.txt
total_acc_x_test.txt
total_acc_y_test.txt
total_acc_z_test.txt

The subsequent training data files are listed here.
body_acc_x_train.txt
body_acc_y_train.txt
body_acc_z_train.txt
body_gyro_x_train.txt
body_gyro_y_train.txt
body_gyro_z_train.txt
total_acc_x_train.txt
total_acc_y_train.txt
total_acc_z_train.txt

    There was no requirement for this coursework and no attempt was made to study these 18 files other than the work carried to confirm the statements in 'readme.txt' file supplied with the data. These 18 files were analysed to produce the initial analysis. They are not included as part of this repo.

3.	Output from the initial analysis.
=====================================

    The initial analysis of the the raw data (18 files listed above) produced 561 different measurements for each subject carrying out each activity. These measurements were stored in two files X_test.txt and X_train.txt for test and training data respectively. The subject data was contained in subjects_test.txt and subjects_train.txt respectively. The activity data was stored also in two files y_test.txt and y_train.txt respectively. The rows of the relevant files matched e.g. the first row of the subject_test.txt contained a label for the subject (a number between 1 and 30), the first row of the y_test.txt gave the activity (a number between 1 and 6) that subject carried out and X_test.txt gave the 561 different measurements of that subject carrying out that activity. 
This is also true for the 21 training subjects.
    
4.  The code book.
==================

	Please see the separate document.

5.  Wide or long format.
========================
    There is no requirment of this cooursework to be either in the long or wide format. I decided to format my data in the 'wide form' i.e.- the features "axis" is extending across the page.

    
6.  Checking my data results.
=============================
    I along with three other students posted snippets of the output data.
They all agreed.

7.   How to read the file anal_01.txt.

        The following commands will read the file into an R data frame.
    The file needs to be in the current working directory.
        
        anal_01    <-   data.frame()
        anal_01    <-   read.table("anal_01.txt")
        
8. Log of the R script run_analysis.R is stored in the file
    run_analysys.log and is included as part of this repo.


Backckground reading and viewing.
=================================

1.	http://link.springer.com/chapter/10.1007%2F978-3-642-35395-6_30
	This snapshot of how the original data was collected and analysed.
2.	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using +Smartphones
	A full description is available of how the data was obtained for this           exercise.
3.	https://www.youtube.com/watch?v=XOEN9W05_4A
	a short video of how the data was originally collected.
4.	https://www.youtube.com/watch?v=C7JQ7Rpwn2k
	This is about a 45 minute long talk given by David Zacks.
==============================================================

References:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
[2] David Hood's posting at at this web address:
https://class.coursera.org/getdata-031/forum/thread?thread_id=28
[3] David Hood's futther posting at this web address:
https://class.coursera.org/getdata-031/forum/thread?thread_id=113
[4] Hadley Whickham lengthy video. 
https://vimeo.com/33727555 
