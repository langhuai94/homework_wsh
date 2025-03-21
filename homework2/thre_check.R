# HEADER --------------------------------------------
#
# Author:     Sihan Wang
# Copyright     Copyright 2025 - Name Surname
# Email:      1939747262@qq.com
#
# Date:     2025-03-15
#
# Script Name:    C:/Users/lenovo/Desktop/R_works/R_scripts/homework_W3/thre_check.R
#
# Script Description:Define a function, checking whether each value 
#                    in a random vector rnorm is greater than a specific threshold(35)
#
# SETUP ------------------------------------
cat("\014")                 # Clears the console
rm(list = ls())             # Remove all variables of the work space

check_threshold <- function(n = 10, mean = 35, sd = 10, threshold =35)
{
  norm_vector <- rnorm ( n, mean= mean, sd= sd)
  result <- lapply(norm_vector, function (x) 
                      paste0(round(x,2), " ", x > threshold))
  result <- unlist(result)
  print("Result: whether each value in rnorm is greater than the threshold 35")
  print(result)
}

check_threshold()
