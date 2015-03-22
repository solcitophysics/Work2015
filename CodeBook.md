## Description of code run_analysis.R.

 ### The code assumes you have downloaded data  and that you are inside UCI HAR Dataset directory:

* Read dataset files from UCI HAR directory: "train" and "test" (X,Y and subject)

 ### Manipulating data

   * Merges test data and trainning data to X,Y and S
   * Read names
   * Indentifies the mean and std columns 
   * Extracts dta for indexes finded above
   * Assign name
   * Combine data to a single data frame 
   * Writing final data frame to a TXT file

