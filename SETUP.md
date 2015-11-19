JMI Gifford WAT CT v MRI
=============================

Requirements:
-------------
* R or RStudio - for figure creation and statistical analysis
	+ Required packages `ggplot2` and `plyr`, to install packages from the `R` prompt type

~~~~
install.packages("ggplot2")
install.packages("plyr")
~~~~

* MATLAB  - for figure creation

Optional:
-------------
* Python - for data file download and MD5 checksum verification if not using MATLAB

Tested Configuration:
---------------------
* Mac OS X 10.7.5 (Lion)
* R 3.1.0
* RStudio 0.98.1091
* MATLAB R2014a
* Python 2.7.10

Installation Options:
---------------------
* Click the `Download ZIP` button on the lower right hand side of the repository to download the code to your local machine
* OR clone the git repository to your local machine
* OR fork to your own GitHub repository and then clone the git repository to your local machine

Usage:
------
* See [./code/README.md](./code/README.md)
   
Example Files:
--------

* Raw Data File :  `S04_input.mat` : Input CT images, already converted to Hounsfield Units, and original complex MRI data.

* Registered Images and resulting WAT mask : `S04_output.mat` : The above dataset, MRI data has been reconstruced into Fat-signal fraction images and all images are registered. The final subcutaneous WAT mask is included in this file.

* Figure File : `Figure_4.png` : Figure_4 is reproduced from the above (and other) reconstructed image volumes.

Notes:
------
* To obtain files in `./data_input/`, `./data_output/`, scripts available in `./code/` should be executed to download and verify  MD5 hash values for all data files.
* Files in `./data_input/`, `./data_output/`, and `./figures/` (other than `README.md`) are ignored when performing `git commit`.
