JMI Gifford WAT CT v MRI: CodeBook.md
=============================

Tidy Data Files:
-------------
* [WAT_avgAllslx_master_file.csv](./WAT_avgAllslx_master_file.csv)

	+ 40 rows, 8 columns
	+ Each row contains either the cold or the warm data for one subject

* [WAT_avgAllslx_master_file_CA_v_TN.csv](./WAT_avgAllslx_master_file_CA_v_TN.csv)

	+ 19 rows, 11 columns
	+ Contains the cold and warm data for each subject on a single row


Variables stored in : [WAT_avgAllslx_master_file.csv](./WAT_avgAllslx_master_file.csv) and [WAT_avgAllslx_master_file_CA_v_TN.csv](./WAT_avgAllslx_master_file_CA_v_TN.csv)
-------------

Columns 1-3 are common between both tidy data files

* Column 1: "Subject" subject ID number

* Column 2: "Sex" subject sex. "M" or "F"

* Column 3: "BMI" subject BMI units: [kg/m^2]


Columns 4-8 in [WAT_avgAllslx_master_file.csv](./WAT_avgAllslx_master_file.csv) :

* Column 4: "Temp" temperature of the scan "CA": cold, and "TN": warm

* Column 5: "NumVoxels" the number of voxels in the binary WAT mask for each subject

* Column 6: "Volume_3" subject WAT volume calculated using the number in "NumVoxels" and the image voxel volume. Units: cubic centimeters [cm^3]

* Column 7: "HU_Avg" average CT Hounsfield Units [HU] in the WAT mask for each subject

* Column 8: "FSF_Avg" average MRI Fat-Signal Fraction [FSF] in the WAT mask for each subject


Columns 4-11 in [WAT_avgAllslx_master_file_CA_v_TN.csv](./WAT_avgAllslx_master_file_CA_v_TN.csv)

* Column 4: "CA_NumVoxels" the number of voxels in the binary WAT mask for the cold scan of each subject

* Column 5: "CA_Volume_cm3 " subject WAT volume calculated using "NumVoxels" from the cold scan and the image voxel volume. Units: cubic centimeters [cm^3]

* Column 6: "CA_HU_Avg" average cold CT Hounsfield Units (HU) in the WAT mask for each subject. Units: [HU]

* Column 7: "FSF_Avg" average cold MRI Fat-Signal Fraction (FSF) in the WAT mask for each subject. Units: [%]

* Column 8: "TN_NumVoxels" the number of voxels in the binary WAT mask from the warm scan of each subject

* Column 9: "TN_Volume_cm3" subject WAT volume calculated using "NumVoxels" from the warm scan and the image voxel volume. Units: cubic centimeters [cm^3]

* Column 10: "TN_HU_Avg" average warm CT Hounsfield Units (HU) in the WAT mask for each subject. Units: [HU]

* Column 11: "FSF_Avg" average warm MRI Fat-Signal Fraction (FSF) in the WAT mask for each subject. Units: [%]


