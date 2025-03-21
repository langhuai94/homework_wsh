# HEADER --------------------------------------------
#
# Author:     Sihan Wang
# Copyright     Copyright 2025 - Name Surname
# Email:      1939747262@qq.com
#
# Date:     2025-03-14
#
# Script Name:    C:/Users/lenovo/Desktop/R_works/R_scripts/pac_help.R
#
# Script Description: search, install and check the package 'tidyverse'
#
# SETUP ------------------------------------
cat("\014")                 # Clears the console
rm(list = ls())             # Remove all variables of the work space

#############################
#1.1 install the package directly or from github
#############################
install.packages('tidyverse')

library(devtools)
install_github("tidyverse/tidyverse")

#############################
#1.2 install 'tidyverse' after check whether 'tidyverse' is installed 
#############################

if (!require("tidyverse", quietly = TRUE)) {
  # uninstalled, then install the package
  install.packages("tidyverse", dependencies = TRUE)
  
  # check whether the installation succeed
  if (!require("tidyverse", quietly = TRUE)) {
    stop("Installation failed! Please check your network or mirror source settings.")
  } 
  else {
    message(paste0("package tidyverse installed successfully! ",
                   'package version: ',packageVersion('tidyverse')))
  }
} else {
  message(paste0(" package tidyverse has been installed. Version: ",packageVersion('tidyverse'),
          ". Skip this step."))
}

#############################
#2. load and check the package
#############################
library('tidyverse')

print(paste0('load package', pack_name,'successfully! version: ', packageVersion('tidyverse')))

?tidyverse() # view the R documentation for package 'tidyverse'

help(package='tidyverse') # view the help pages for package 'tidyverse'

# check whether there are vignettes of package 'tidyverse'
vignette('tidyverse')
browseVignettes(package='tidyverse')

demo(package='tidyverse') 
