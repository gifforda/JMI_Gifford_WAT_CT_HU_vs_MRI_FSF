code
====

This folder contains all necessary RStudio and MATLAB code to reproduce results. Additionally, there is a script to download input and output data.

see also:
---------

### Index of files to download ( **DO NOT EDIT** )
~~~~
./code/download_data_index.csv
~~~~

### Python download and verification script
~~~~
./code/download_data_all.py
~~~~

### Steps to download and verify all data

* Python (command terminal opened in repository top-level folder)

~~~~
cd ./code
./download_data_all.py
~~~~

### Figure creation scripts (results written to `../figures/`)
~~~~
./code/WAT_Figure_1.m
./code/WAT_Figure_2a.R
./code/WAT_Figure_2b.R
./code/WAT_Figure_2c.R
./code/WAT_Figure_3a.R
./code/WAT_Figure_3b.R
./code/WAT_Figure_3c.R
./code/WAT_Figure_4.R
./code/WAT_Figure_5a.R
./code/WAT_Figure_5b.R
./code/WAT_Figure_5c.R
./code/WAT_Figure_5d.R
./code/WAT_Figure_6a.R
./code/WAT_Figure_6b.R
./code/WAT_Figure_6c.R
./code/WAT_Figure_6d.R
./code/WAT_Figures_Create_All.R
~~~~

### Steps to run scripts

* R (command terminal opened in repository top-level folder)

~~~~
cd	./code
./WAT_Figures_Create_All.R
~~~~

* RStudio
	+ Open `./code/WAT_Figures_Create_All.R` and click source
	+ Optionally open and source individual `.R` scripts for figure panel(s) after changing working directory to `code` folder, e.g.,

~~~~
path_to_repository <- "/edit/this/path/to/match/your/path"
setwd(paste0(path_to_repository,"/code",collapse=""))
~~~~

* MATLAB (opened in repository top-level folder)

~~~~
cd("./code")
WAT_Figure_1
~~~~
