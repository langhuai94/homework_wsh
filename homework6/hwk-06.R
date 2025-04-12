# HEADER --------------------------------------------
#
# Author:     Sihan Wang
# Copyright     Copyright 2025 - Name Surname
# Email:      1939747262@qq.com
#
# Date:     2025-04-12
#
# Script Name:  hwk-06 填空题  
#
# Script Description:将RStudio与SQLite或SpatiaLite数据库连接起来，用于存储与读取下载的数据
#
#
# SETUP ------------------------------------
cat("\014")                 # Clears the console
rm(list = ls())             # Remove all variables of the work space

#########################
#(1) 利用dplyr包src_sqlite()创建空的SQLite
#########################
library(dplyr)
mydb <- src_sqlite('./dbname.sqlite', create = TRUE)

#########################
#(2) 利用copy_to()将csv文件上传到SQLite
#########################

env <- read.csv('./env.csv')
copy_to(mydb, env, temporary = FALSE, overwrite = TRUE)

#说明：前两个是要求填的空，后面是自己加的条件，数据并不是临时添加，确保重新用路径访问时env可查看

#########################
#(3) 连接数据库，将数据库中数据集读入R
#########################

mydb <- src_sqlite('./dbname.sqlite')
env <- tbl(mydb, 'env')
# env


dbDisconnect(my_db)
