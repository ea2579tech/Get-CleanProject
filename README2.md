
The following explains the flow of script: run_analysis.R

1. downloading the project's zip file and extracting the data
        (done outside of the scrip)
	the following extracted files are used in the script:
		X_test.txt, X_train.txt
		Y_test.txt, Y_train.txt
		subject_test.txt and subject_train.txt
		activity_labels.txt
		features.txt (used to generate col_names.txt) 
	other extracted files 
		Features_info.txt
		activity_labels.txt
		Readme.txt
2. selection of the column names used for required tidy data
        file features.txt was used to generate col_names.txt
		(done outside of the scrip)
	66 variable names were selected out of the 561 listed in features.txt file
	
3.	Read into R X_test.txt and X_train.txt to create 2 data tables 
	
4.	Extract desired columns using object from read in col_names.txt file
	
5.	Read into R subject and Y files and merge with test and train data tables respectively 
	 (cbind subject and Y as first 2 columns of each object)
	
6.	Now merge (rbind) the 2 data tables created above
	
7.	Add columns names to merged data table

8.	Replace numeric activity values with alpaha equivalent found in activity_labels.txt file
	
9	sort the merged data table by (Subject, Activity) for visual checking
	
10.	Use ddply (plyr package) to create a tidy data of variale means by (Subject, Activity)
	
	
	