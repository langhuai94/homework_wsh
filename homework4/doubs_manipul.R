# HEADER --------------------------------------------
#
# Author:     Sihan Wang
# Copyright     Copyright 2025 - Name Surname
# Email:      1939747262@qq.com
#
# Date:     2025-03-28
#
# Script Name:    C:/Users/lenovo/Desktop/R_works/R_scripts/homework_4/doubs_manipul.R
#
# Script Description:homework4
#
#
# SETUP ------------------------------------
cat("\014")                 # Clears the console
rm(list = ls())             # Remove all variables of the work space

library(ade4)
library(dplyr) # mutate函数在这个包里

######
# Q1
######

data(doubs, package = 'ade4')

# *题目要求只选择dfs, alt, oxy3列
# *但是如果需要计算mean_pH，那么pH列也应该选进来

env_rename <- doubs$env |> select(dfs, alt, oxy, pH) |> # 选取 dfs, alt, oxy 列
                           rename(c( distance = dfs, oxygen = oxy )) |> # 重命名 dfs 为 distance、oxy为 oxygen
                           filter(alt > 200) |> # 保留alt大于200m行
                           arrange(desc(alt)) |> # 按alt降序排序，升序是arrange(alt)
                           filter(!is.na(oxygen)) |> #去掉oxygen为NA的行
                           mutate(oxygen_category = ifelse(oxygen > 90, 'high', 'low') ) 
                           # 新增列oxygen_category, 以90为界，按是否大于90分为high/low两个类别

# head(env_rename, 5) #查看上述数据处理后的结果

# 按oxygen_category计算high low两个类别的平均alt和平均PH

env_result <- env_rename |> group_by(oxygen_category) |> # 将数据按oxygen_category分组
                            summarize(mean_alt = mean(alt, na.rm=TRUE),
                                      mean_pH = mean(pH, na.rm=TRUE))

# env_result # 查看结果，已经整理成题目要求的格式（此处数据格式为tibble，也可以整理成dataframe等）
#   oxygen_category mean_alt mean_pH
#   <chr>              <dbl>   <dbl>
# 1 high                561.    80.6
# 2 low                 421.    80.1

env_result_df <- as.data.frame(env_result)
env_result_df
# oxygen_category mean_alt  mean_pH
# 1            high 561.2222 80.61111
# 2             low 421.4444 80.11111

######
# Q2 填空
######

library(ggplot2)

# 利用ggplot2包，绘制x=alt与y=oxy之间的散点图

plot1 <- ggplot(data =  doubs$env) +
         geom_point(mapping = aes(alt, oxy))

plot1

# 在上述散点图中，将数据dfs距离调整颜色

plot2 <- ggplot(data =  doubs$env) +
         geom_point(mapping = aes(alt, oxy), col=doubs$env$dfs)

plot2



