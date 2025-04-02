library(ade4)
library(caret)
library(vegan) #计算Shannon多样性指数的包

######
# Q2.1 doubs中鱼群数据，按样地计算Shannon指数并增加mpg列
######

data(doubs)
df_fish <- as.data.frame(doubs$fish) #每一行对应一个样地
df_fish$mpg <- diversity(df_fish[1:ncol(df_fish)], index = "shannon", base = exp(1))
head(df_fish)

######
# Q2.2 利用train()，训练随机森林（randomForest）模型
######

training_data <- mtcars
# class(training_data)
model_rf <- train(mpg ~ .,  data = training_data,  method = "rf")

######
# Q2.3 通过trainControl()，向train()添加重采样10-fold cross-validation，以优化参数
######

fitControl <- trainControl(method = "cv",  number = 10, repeats = 5)
model_rf <- train(mpg ~ ., data = training_data, method = "rf", trControl =fitControl)

######
# Q2.4 在train()中，增加中心化和标准化等数据预处理，提高模型精度
######

model_rf <- train(mpg ~ ., data = training_data,  method = "rf", 
                  preProcess = c('scale', 'center'),
                  trControl =fitControl)

######
# Q2.5 rf有mtry和tree两个参数，可以通过expand.grid()设置调优，并在train()添加
######

# tree:森林中包含的决策树的总个数
# mtry:每个决策树中变量的个数

grid <- expand.grid(.mtry=c(1:10))
model_rf <- train(mpg ~ ., data = training_data, method = "rf",
                  preProcess = c('scale', 'center'),
                  trControl =fitControl,
                  tuneGrid =  grid)



