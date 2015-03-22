
# Read the files inside the directory train
setwd("train/")
subjectrain = read.table("subject_train.txt")
Xtrain = read.table("X_train.txt")
Ytrain = read.table("y_train.txt")
#setwd("Inertial_Signals")
#BAXtrain = read.table("body_acc_x_train.txt")
#BAYtrain = read.table("body_acc_y_train.txt")
#BAZtrain = read.table("body_acc_z_train.txt")
#BGXtrain = read.table("body_gyro_x_train.txt")
#BGYtrain = read.table("body_gyro_y_train.txt")
#BGZtrain = read.table("body_gyro_z_train.txt")
#TAXtrain = read.table("total_acc_x_train.txt")
#TAYtrain = read.table("total_acc_y_train.txt")
#TAZtrain = read.table("total_acc_z_train.txt")

setwd("../")
# Read the files inside the directory test
setwd("test/")
subjectest = read.table("subject_test.txt")
Xtest = read.table("X_test.txt")
Ytest = read.table("y_test.txt")

#setwd("Inertial_Signals")
#BAXtest = read.table("body_acc_x_test.txt")
#BAYtest = read.table("body_acc_y_test.txt")
#BAZtest = read.table("body_acc_z_test.txt")
#BGXtest = read.table("body_gyro_x_test.txt")
#BGYtest = read.table("body_gyro_y_test.txt")
#BGZtest = read.table("body_gyro_z_test.txt")
#TAXtest = read.table("total_acc_x_test.txt")
#TAYtest = read.table("total_acc_y_test.txt")
#TAZtest = read.table("total_acc_z_test.txt")
setwd("../")

#  Combine the three data sets (train, test, subject) by rows.
X <- rbind(Xtrain, Xtest)
Y <- rbind(Ytrain, Ytest)
S <- rbind(subjectrain, subjectest)

# Read the features vector
FTs <- read.table("features.txt")

# Assign column name and ID to features data set
names(FTs) <- c("ID", "Var_name")

# Find the index for all the names in column Var_name which contain mean o std
index_F <- grep("-mean\\(\\)|-std\\(\\)", FTs$Var_name) 

# Evaluate the variable X in the finded index 
  X <- X[, index_F] 
names(X) <- gsub("\\(|\\)", "", (FTs[index_F, 2]))

# Assign names to activity and subject
ACT <- read.table("activity_labels.txt")
names(ACT) <- c("ID_A", "A_name")
 Y[, 1] = ACT[Y[, 1], 2]
names(Y) <- "Activity"
names(S) <- "Subject"
  
# Combine by column to form the tidy data set  
TidyDS <- cbind(S, Y, X)

# Create a data frame from the table 
TidyDF<-as.data.frame(TidyDS)

#Write the data frame to a file  
write.table(TidyDF, file = "TidyDS.txt", row.names = FALSE)
  
  
  
  