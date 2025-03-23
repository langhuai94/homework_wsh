# HEADER --------------------------------------------
#
# Author:     Sihan Wang
# Copyright     Copyright 2025 - Name Surname
# Email:      1939747262@qq.com
#
# Date:     2025-03-23
#
# Script Name:    
#
# Script Description: homework3, exercise #1& #2
#
#
# SETUP ------------------------------------
cat("\014")                 # Clears the console
rm(list = ls())             # Remove all variables of the work space

######
# Exercise #1
######

x <- c(1:3) 
y <- c(4:6)
z <- c(7:9)
# str(x)

######
# Each column represents a vector
(A <- matrix(data = cbind(x,y,z), ncol = 3, byrow = FALSE))
# or: (A <- matrix(data = rbind(x,y,z), ncol = 3, byrow = TRUE))

# Change rownames into "a" "b" "c"
rownames(A) <- c('a','b','c')

A

######
# Each row represents a vector
(A <- matrix(data = cbind(x,y,z), ncol = 3, byrow = TRUE))
# or: (A <- matrix(data = rbind(x,y,z), ncol = 3, byrow = FALSE))

# Change colnames into "a" "b" "c"
colnames(A) <- c('a','b','c')

A

######
# Exercise #2
######

# Import the doubs data of ade4 package into the R environment
data(doubs,package='ade4')

# check data types and structure
# data type
class(doubs)
# or mode(doubs) or typeof(doubs)

# data structure
str(doubs)

save(doubs, file = "./ade4_doubs.RData")
# load("./ade4_doubs.RData")


