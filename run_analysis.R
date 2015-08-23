run_analysis    <- function(){
    library(dplyr)
    library(stringi)
    library(compare)
    
    x = stri_dup("-",75)
    sink("run_analysis.log")
# ==============================================================================
# Load the three files relating to the test data.
# Check for the presence of NAs.
# Convert numeric activity codes to descriptive names.
# Change column names in 'subjects and activity' files to more descriptive names.
#================================================================================

    test_subjects_01    <- data.frame()
    test_activity_01    <- data.frame()
    test_data_01        <- data.frame()

    test_subjects_01 <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/test/subject_test.txt")
    test_activity_01 <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/test/y_test.txt")
    test_data_01     <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/test/X_test.txt")
    
    print('Total number of NAs in all all three test files = ')
    print(sum(is.na(test_subjects_01))+sum(is.na(test_activity_01))+sum(is.na(test_data_01)))
    
    print('Test Subjects (Rows, Columns)  = ')
    print(dim(test_subjects_01))
    print(x)
    print('Test Activities (Rows, Columns)  = ')
    print(dim(test_activity_01))
    print(x)  
    print('Test Data (Rows, Columns)  = ')
    print(dim(test_data_01))
    print(x)
    print(x)

    test_activity_01$V1[test_activity_01$V1 == 1]    <- "Walking"
    test_activity_01$V1[test_activity_01$V1 == 2]    <- "Walking upstairs"
    test_activity_01$V1[test_activity_01$V1 == 3]    <- "Walking downstairs"
    test_activity_01$V1[test_activity_01$V1 == 4]    <- "Sitting"
    test_activity_01$V1[test_activity_01$V1 == 5]    <- "Standing"
    test_activity_01$V1[test_activity_01$V1 == 6]    <- "Laying"


    names(test_subjects_01)[1]<-paste("subject")
    names(test_activity_01)[1]<-paste("activity")

    test_data_02  <-   select(test_data_01, 1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552,555:561)
    #Replace the data in a field based on equal to some value
    
# ==============================================================================
# Load the three files relating to the train data.
# Check for the presence of NAs.
# Convert numeric activity codes to descriptive names.
# Change column names in 'subjects and activity' files to more descriptive names.
#================================================================================
    
    train_subjects_01    <- data.frame()
    train_activity_01    <- data.frame()
    train_data_01        <- data.frame()
    
    train_subjects_01 <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/train/subject_train.txt")
    train_activity_01 <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/train/y_train.txt")
    train_data_01     <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/train/X_train.txt")
    
    print('Total number of NAs in all all three training  files = ')
    print(sum(is.na(train_subjects_01))+sum(is.na(train_activity_01))+sum(is.na(train_data_01)))
    train_activity_01$V1[train_activity_01$V1 == 1]    <- "Walking"
    train_activity_01$V1[train_activity_01$V1 == 2]    <- "Walking upstairs"
    train_activity_01$V1[train_activity_01$V1 == 3]    <- "Walking downstairs"
    train_activity_01$V1[train_activity_01$V1 == 4]    <- "Sitting"
    train_activity_01$V1[train_activity_01$V1 == 5]    <- "Standing"
    train_activity_01$V1[train_activity_01$V1 == 6]    <- "Laying"
    
    names(train_subjects_01)[1]<-paste("subject")
    names(train_activity_01)[1]<-paste("activity")
 
    print('Train Subjects (Rows, Columns)  = ')
    print(dim(train_subjects_01))
    print(x)
    print('Train Activities (Rows, Columns)  = ')
    print(dim(train_activity_01))
    print(x)  
    print('Train Data (Rows, Columns)  = ')
    print(dim(train_data_01))
    print(x)
    print(x)
    
# ===========================================================================================
# Replace the column names with a better description.
# Select all columns in the test and training data files that contain 'mean', 'Mean' or 'std'
# Column bind all the test data together.
# Column bind all the training data together.
# Row bind the combined 'test' and 'training' data together.
# Save the merged data 'complete_01'.
#============================================================================================
    
    names(test_data_01)[1]   <-   paste("MEAN_OF_tBodyAcc-mean()-X")
    names(test_data_01)[2]   <-   paste("MEAN_OF_tBodyAcc-mean()-Y")
    names(test_data_01)[3]   <-   paste("MEAN_OF_tBodyAcc-mean()-Z")
    names(test_data_01)[4]   <-   paste("MEAN_OF_tBodyAcc-std()-X")
    names(test_data_01)[5]   <-   paste("MEAN_OF_tBodyAcc-std()-Y")
    names(test_data_01)[6]   <-   paste("MEAN_OF_tBodyAcc-std()-Z")
    names(test_data_01)[41]   <-   paste("MEAN_OF_tGravityAcc-mean()-X")
    names(test_data_01)[42]   <-   paste("MEAN_OF_tGravityAcc-mean()-Y")
    names(test_data_01)[43]   <-   paste("MEAN_OF_tGravityAcc-mean()-Z")
    names(test_data_01)[44]   <-   paste("MEAN_OF_tGravityAcc-std()-X")
    names(test_data_01)[45]   <-   paste("MEAN_OF_tGravityAcc-std()-Y")
    names(test_data_01)[46]   <-   paste("MEAN_OF_tGravityAcc-std()-Z")
    names(test_data_01)[81]   <-   paste("MEAN_OF_tBodyAccJerk-mean()-X")
    names(test_data_01)[82]   <-   paste("MEAN_OF_tBodyAccJerk-mean()-Y")
    names(test_data_01)[83]   <-   paste("MEAN_OF_tBodyAccJerk-mean()-Z")
    names(test_data_01)[84]   <-   paste("MEAN_OF_tBodyAccJerk-std()-X")
    names(test_data_01)[85]   <-   paste("MEAN_OF_tBodyAccJerk-std()-Y")
    names(test_data_01)[86]   <-   paste("MEAN_OF_tBodyAccJerk-std()-Z")
    names(test_data_01)[121]   <-   paste("MEAN_OF_tBodyGyro-mean()-X")
    names(test_data_01)[122]   <-   paste("MEAN_OF_tBodyGyro-mean()-Y")
    names(test_data_01)[123]   <-   paste("MEAN_OF_tBodyGyro-mean()-Z")
    names(test_data_01)[124]   <-   paste("MEAN_OF_tBodyGyro-std()-X")
    names(test_data_01)[125]   <-   paste("MEAN_OF_tBodyGyro-std()-Y")
    names(test_data_01)[126]   <-   paste("MEAN_OF_tBodyGyro-std()-Z")
    names(test_data_01)[161]   <-   paste("MEAN_OF_tBodyGyroJerk-mean()-X")
    names(test_data_01)[162]   <-   paste("MEAN_OF_tBodyGyroJerk-mean()-Y")
    names(test_data_01)[163]   <-   paste("MEAN_OF_tBodyGyroJerk-mean()-Z")
    names(test_data_01)[164]   <-   paste("MEAN_OF_tBodyGyroJerk-std()-X")
    names(test_data_01)[165]   <-   paste("MEAN_OF_tBodyGyroJerk-std()-Y")
    names(test_data_01)[166]   <-   paste("MEAN_OF_tBodyGyroJerk-std()-Z")
    names(test_data_01)[201]   <-   paste("MEAN_OF_tBodyAccMag-mean()")
    names(test_data_01)[202]   <-   paste("MEAN_OF_tBodyAccMag-std()")
    names(test_data_01)[214]   <-   paste("MEAN_OF_tGravityAccMag-mean()")
    names(test_data_01)[215]   <-   paste("MEAN_OF_tGravityAccMag-std()")
    names(test_data_01)[227]   <-   paste("MEAN_OF_tBodyAccJerkMag-mean()")
    names(test_data_01)[228]   <-   paste("MEAN_OF_tBodyAccJerkMag-std()")
    names(test_data_01)[240]   <-   paste("MEAN_OF_tBodyGyroMag-mean()")
    names(test_data_01)[241]   <-   paste("MEAN_OF_tBodyGyroMag-std()")
    names(test_data_01)[253]   <-   paste("MEAN_OF_tBodyGyroJerkMag-mean()")
    names(test_data_01)[254]   <-   paste("MEAN_OF_tBodyGyroJerkMag-std()")
    names(test_data_01)[266]   <-   paste("MEAN_OF_fBodyAcc-mean()-X")
    names(test_data_01)[267]   <-   paste("MEAN_OF_fBodyAcc-mean()-Y")
    names(test_data_01)[268]   <-   paste("MEAN_OF_fBodyAcc-mean()-Z")
    names(test_data_01)[269]   <-   paste("MEAN_OF_fBodyAcc-std()-X")
    names(test_data_01)[270]   <-   paste("MEAN_OF_fBodyAcc-std()-Y")
    names(test_data_01)[271]   <-   paste("MEAN_OF_fBodyAcc-std()-Z")
    names(test_data_01)[294]   <-   paste("MEAN_OF_fBodyAcc-meanFreq()-X")
    names(test_data_01)[295]   <-   paste("MEAN_OF_fBodyAcc-meanFreq()-Y")
    names(test_data_01)[296]   <-   paste("MEAN_OF_fBodyAcc-meanFreq()-Z")
    names(test_data_01)[345]   <-   paste("MEAN_OF_fBodyAccJerk-mean()-X")
    names(test_data_01)[346]   <-   paste("MEAN_OF_fBodyAccJerk-mean()-Y")
    names(test_data_01)[347]   <-   paste("MEAN_OF_fBodyAccJerk-mean()-Z")
    names(test_data_01)[348]   <-   paste("MEAN_OF_fBodyAccJerk-std()-X")
    names(test_data_01)[349]   <-   paste("MEAN_OF_fBodyAccJerk-std()-Y")
    names(test_data_01)[350]   <-   paste("MEAN_OF_fBodyAccJerk-std()-Z")
    names(test_data_01)[373]   <-   paste("MEAN_OF_fBodyAccJerk-meanFreq()-X")
    names(test_data_01)[374]   <-   paste("MEAN_OF_fBodyAccJerk-meanFreq()-Y")
    names(test_data_01)[375]   <-   paste("MEAN_OF_fBodyAccJerk-meanFreq()-Z")
    names(test_data_01)[424]   <-   paste("MEAN_OF_fBodyGyro-mean()-X")
    names(test_data_01)[425]   <-   paste("MEAN_OF_fBodyGyro-mean()-Y")
    names(test_data_01)[426]   <-   paste("MEAN_OF_fBodyGyro-mean()-Z")
    names(test_data_01)[427]   <-   paste("MEAN_OF_fBodyGyro-std()-X")
    names(test_data_01)[428]   <-   paste("MEAN_OF_fBodyGyro-std()-Y")
    names(test_data_01)[429]   <-   paste("MEAN_OF_fBodyGyro-std()-Z")
    names(test_data_01)[452]   <-   paste("MEAN_OF_fBodyGyro-meanFreq()-X")
    names(test_data_01)[453]   <-   paste("MEAN_OF_fBodyGyro-meanFreq()-Y")
    names(test_data_01)[454]   <-   paste("MEAN_OF_fBodyGyro-meanFreq()-Z")
    names(test_data_01)[503]   <-   paste("MEAN_OF_fBodyAccMag-mean()")
    names(test_data_01)[504]   <-   paste("MEAN_OF_fBodyAccMag-std()")
    names(test_data_01)[513]   <-   paste("MEAN_OF_fBodyAccMag-meanFreq()")
    names(test_data_01)[516]   <-   paste("MEAN_OF_fBodyBodyAccJerkMag-mean()")
    names(test_data_01)[517]   <-   paste("MEAN_OF_fBodyBodyAccJerkMag-std()")
    names(test_data_01)[526]   <-   paste("MEAN_OF_fBodyBodyAccJerkMag-meanFreq()")
    names(test_data_01)[529]   <-   paste("MEAN_OF_fBodyBodyGyroMag-mean()")
    names(test_data_01)[530]   <-   paste("MEAN_OF_fBodyBodyGyroMag-std()")
    names(test_data_01)[539]   <-   paste("MEAN_OF_fBodyBodyGyroMag-meanFreq()")
    names(test_data_01)[542]   <-   paste("MEAN_OF_fBodyBodyGyroJerkMag-mean()")
    names(test_data_01)[543]   <-   paste("MEAN_OF_fBodyBodyGyroJerkMag-std()")
    names(test_data_01)[552]   <-   paste("MEAN_OF_fBodyBodyGyroJerkMag-meanFreq()")
    names(test_data_01)[555]   <-   paste("MEAN_OF_angle(tBodyAccMean,gravity)")
    names(test_data_01)[556]   <-   paste("MEAN_OF_angle(tBodyAccJerkMean),gravityMean)")
    names(test_data_01)[557]   <-   paste("MEAN_OF_angle(tBodyGyroMean,gravityMean)")
    names(test_data_01)[558]   <-   paste("MEAN_OF_angle(tBodyGyroJerkMean,gravityMean)")
    names(test_data_01)[559]   <-   paste("MEAN_OF_angle(X,gravityMean)")
    names(test_data_01)[560]   <-   paste("MEAN_OF_angle(Y,gravityMean)")
    names(test_data_01)[561]   <-   paste("MEAN_OF_angle(Z,gravityMean)")
    
# ===================================================================================
    names(train_data_01)[1]   <-   paste("MEAN_OF_tBodyAcc-mean()-X")
    names(train_data_01)[2]   <-   paste("MEAN_OF_tBodyAcc-mean()-Y")
    names(train_data_01)[3]   <-   paste("MEAN_OF_tBodyAcc-mean()-Z")
    names(train_data_01)[4]   <-   paste("MEAN_OF_tBodyAcc-std()-X")
    names(train_data_01)[5]   <-   paste("MEAN_OF_tBodyAcc-std()-Y")
    names(train_data_01)[6]   <-   paste("MEAN_OF_tBodyAcc-std()-Z")
    names(train_data_01)[41]   <-   paste("MEAN_OF_tGravityAcc-mean()-X")
    names(train_data_01)[42]   <-   paste("MEAN_OF_tGravityAcc-mean()-Y")
    names(train_data_01)[43]   <-   paste("MEAN_OF_tGravityAcc-mean()-Z")
    names(train_data_01)[44]   <-   paste("MEAN_OF_tGravityAcc-std()-X")
    names(train_data_01)[45]   <-   paste("MEAN_OF_tGravityAcc-std()-Y")
    names(train_data_01)[46]   <-   paste("MEAN_OF_tGravityAcc-std()-Z")
    names(train_data_01)[81]   <-   paste("MEAN_OF_tBodyAccJerk-mean()-X")
    names(train_data_01)[82]   <-   paste("MEAN_OF_tBodyAccJerk-mean()-Y")
    names(train_data_01)[83]   <-   paste("MEAN_OF_tBodyAccJerk-mean()-Z")
    names(train_data_01)[84]   <-   paste("MEAN_OF_tBodyAccJerk-std()-X")
    names(train_data_01)[85]   <-   paste("MEAN_OF_tBodyAccJerk-std()-Y")
    names(train_data_01)[86]   <-   paste("MEAN_OF_tBodyAccJerk-std()-Z")
    names(train_data_01)[121]   <-   paste("MEAN_OF_tBodyGyro-mean()-X")
    names(train_data_01)[122]   <-   paste("MEAN_OF_tBodyGyro-mean()-Y")
    names(train_data_01)[123]   <-   paste("MEAN_OF_tBodyGyro-mean()-Z")
    names(train_data_01)[124]   <-   paste("MEAN_OF_tBodyGyro-std()-X")
    names(train_data_01)[125]   <-   paste("MEAN_OF_tBodyGyro-std()-Y")
    names(train_data_01)[126]   <-   paste("MEAN_OF_tBodyGyro-std()-Z")
    names(train_data_01)[161]   <-   paste("MEAN_OF_tBodyGyroJerk-mean()-X")
    names(train_data_01)[162]   <-   paste("MEAN_OF_tBodyGyroJerk-mean()-Y")
    names(train_data_01)[163]   <-   paste("MEAN_OF_tBodyGyroJerk-mean()-Z")
    names(train_data_01)[164]   <-   paste("MEAN_OF_tBodyGyroJerk-std()-X")
    names(train_data_01)[165]   <-   paste("MEAN_OF_tBodyGyroJerk-std()-Y")
    names(train_data_01)[166]   <-   paste("MEAN_OF_tBodyGyroJerk-std()-Z")
    names(train_data_01)[201]   <-   paste("MEAN_OF_tBodyAccMag-mean()")
    names(train_data_01)[202]   <-   paste("MEAN_OF_tBodyAccMag-std()")
    names(train_data_01)[214]   <-   paste("MEAN_OF_tGravityAccMag-mean()")
    names(train_data_01)[215]   <-   paste("MEAN_OF_tGravityAccMag-std()")
    names(train_data_01)[227]   <-   paste("MEAN_OF_tBodyAccJerkMag-mean()")
    names(train_data_01)[228]   <-   paste("MEAN_OF_tBodyAccJerkMag-std()")
    names(train_data_01)[240]   <-   paste("MEAN_OF_tBodyGyroMag-mean()")
    names(train_data_01)[241]   <-   paste("MEAN_OF_tBodyGyroMag-std()")
    names(train_data_01)[253]   <-   paste("MEAN_OF_tBodyGyroJerkMag-mean()")
    names(train_data_01)[254]   <-   paste("MEAN_OF_tBodyGyroJerkMag-std()")
    names(train_data_01)[266]   <-   paste("MEAN_OF_fBodyAcc-mean()-X")
    names(train_data_01)[267]   <-   paste("MEAN_OF_fBodyAcc-mean()-Y")
    names(train_data_01)[268]   <-   paste("MEAN_OF_fBodyAcc-mean()-Z")
    names(train_data_01)[269]   <-   paste("MEAN_OF_fBodyAcc-std()-X")
    names(train_data_01)[270]   <-   paste("MEAN_OF_fBodyAcc-std()-Y")
    names(train_data_01)[271]   <-   paste("MEAN_OF_fBodyAcc-std()-Z")
    names(train_data_01)[294]   <-   paste("MEAN_OF_fBodyAcc-meanFreq()-X")
    names(train_data_01)[295]   <-   paste("MEAN_OF_fBodyAcc-meanFreq()-Y")
    names(train_data_01)[296]   <-   paste("MEAN_OF_fBodyAcc-meanFreq()-Z")
    names(train_data_01)[345]   <-   paste("MEAN_OF_fBodyAccJerk-mean()-X")
    names(train_data_01)[346]   <-   paste("MEAN_OF_fBodyAccJerk-mean()-Y")
    names(train_data_01)[347]   <-   paste("MEAN_OF_fBodyAccJerk-mean()-Z")
    names(train_data_01)[348]   <-   paste("MEAN_OF_fBodyAccJerk-std()-X")
    names(train_data_01)[349]   <-   paste("MEAN_OF_fBodyAccJerk-std()-Y")
    names(train_data_01)[350]   <-   paste("MEAN_OF_fBodyAccJerk-std()-Z")
    names(train_data_01)[373]   <-   paste("MEAN_OF_fBodyAccJerk-meanFreq()-X")
    names(train_data_01)[374]   <-   paste("MEAN_OF_fBodyAccJerk-meanFreq()-Y")
    names(train_data_01)[375]   <-   paste("MEAN_OF_fBodyAccJerk-meanFreq()-Z")
    names(train_data_01)[424]   <-   paste("MEAN_OF_fBodyGyro-mean()-X")
    names(train_data_01)[425]   <-   paste("MEAN_OF_fBodyGyro-mean()-Y")
    names(train_data_01)[426]   <-   paste("MEAN_OF_fBodyGyro-mean()-Z")
    names(train_data_01)[427]   <-   paste("MEAN_OF_fBodyGyro-std()-X")
    names(train_data_01)[428]   <-   paste("MEAN_OF_fBodyGyro-std()-Y")
    names(train_data_01)[429]   <-   paste("MEAN_OF_fBodyGyro-std()-Z")
    names(train_data_01)[452]   <-   paste("MEAN_OF_fBodyGyro-meanFreq()-X")
    names(train_data_01)[453]   <-   paste("MEAN_OF_fBodyGyro-meanFreq()-Y")
    names(train_data_01)[454]   <-   paste("MEAN_OF_fBodyGyro-meanFreq()-Z")
    names(train_data_01)[503]   <-   paste("MEAN_OF_fBodyAccMag-mean()")
    names(train_data_01)[504]   <-   paste("MEAN_OF_fBodyAccMag-std()")
    names(train_data_01)[513]   <-   paste("MEAN_OF_fBodyAccMag-meanFreq()")
    names(train_data_01)[516]   <-   paste("MEAN_OF_fBodyBodyAccJerkMag-mean()")
    names(train_data_01)[517]   <-   paste("MEAN_OF_fBodyBodyAccJerkMag-std()")
    names(train_data_01)[526]   <-   paste("MEAN_OF_fBodyBodyAccJerkMag-meanFreq()")
    names(train_data_01)[529]   <-   paste("MEAN_OF_fBodyBodyGyroMag-mean()")
    names(train_data_01)[530]   <-   paste("MEAN_OF_fBodyBodyGyroMag-std()")
    names(train_data_01)[539]   <-   paste("MEAN_OF_fBodyBodyGyroMag-meanFreq()")
    names(train_data_01)[542]   <-   paste("MEAN_OF_fBodyBodyGyroJerkMag-mean()")
    names(train_data_01)[543]   <-   paste("MEAN_OF_fBodyBodyGyroJerkMag-std()")
    names(train_data_01)[552]   <-   paste("MEAN_OF_fBodyBodyGyroJerkMag-meanFreq()")
    names(train_data_01)[555]   <-   paste("MEAN_OF_angle(tBodyAccMean,gravity)")
    names(train_data_01)[556]   <-   paste("MEAN_OF_angle(tBodyAccJerkMean),gravityMean)")
    names(train_data_01)[557]   <-   paste("MEAN_OF_angle(tBodyGyroMean,gravityMean)")
    names(train_data_01)[558]   <-   paste("MEAN_OF_angle(tBodyGyroJerkMean,gravityMean)")
    names(train_data_01)[559]   <-   paste("MEAN_OF_angle(X,gravityMean)")
    names(train_data_01)[560]   <-   paste("MEAN_OF_angle(Y,gravityMean)")
    names(train_data_01)[561]   <-   paste("MEAN_OF_angle(Z,gravityMean)")  
# ==================================================================================
    
    test_data_02   <-   select(test_data_01, 1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552,555:561)
    train_data_02  <-   select(train_data_01, 1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552,555:561)
    
    test_03  <- cbind(test_subjects_01,       test_activity_01,  test_data_02)
    train_03  <- cbind(train_subjects_01,     train_activity_01, train_data_02)

    complete_01 <- data.frame()
 
    complete_01 <- rbind(test_03, train_03)
    

    View(complete_01)
    
    print('test_data_01 (Rows, Columns)  = ')
    print(dim(test_data_01))
    print(x)
    print('train_data_02 (Rows, Columns)  = ')
    print(dim(train_data_02))
    print(x)  
    print('test_03 (Rows, Columns)  = ')
    print(dim(test_03))
    print('train_03 (Rows, Columns)  = ')
    print(dim(train_03))
    print('Merged data (complete_01) (Rows, Columns)  = ')
    print(dim(complete_01))
    print(x)
    print(x)
    write.table(complete_01, "C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/complete_01.txt")
    
# ===========================================================================================
# Calculate the mean by activity and subject.
# Save the file in a fixed format.
# Column bind all the test data together.
# Check that the file can be read back in again using 'read.table'
#============================================================================================  

    anal_01 <- group_by(complete_01, activity, subject) %>% summarise_each(funs(mean))
    View(anal_01)

    write.table(anal_01, "C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/anal_01.txt")
    check_01  <- read.table("C:/Users/John/Documents/R_programming/Cleaning Data/UCI_HAR_Dataset/anal_01.txt")
    
    print('Final file: (anal_01.txt) (Rows, Columns)  = ')
    print(dim(anal_01))
    print('Final file read back in to check (Rows, Columns)  = ')
    print(dim(check_01)) 

    sink()
}
