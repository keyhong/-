df <- read.csv('./test0.csv') #데이터 파일 읽기
str(df)

library(dplyr)
library(caret)
library(C50)
library(tree)
library(rpart)
library(party)
library(CHAID)

# 필요없는 변수 제거하는 부분
data <- df %>% select(-X,
                      -A10_0,
                      -A2_1,
                      -A4,
                      -A7,
                      -A8,
                      -BA1_2,
                      -BA5,
                      -F19,
                      -K2,
                      -SQ3N,
                      -SQ3_1N,
                      -eat_dr,
                      -eat_lh,
                      -home_dr,
                      -korean_food,
                      -satisfy2,
                      -SQ1.1) 
colnames(data)

#y값 설정.
data <- data %>% mutate(y = ifelse(A11_1 >=1.5, 'mixed', 'rice'))

#범주형 데이터 factor로 변환
data$SQ1 <- as.factor(data$SQ1)
data$SQ2_range <- as.factor(data$SQ2_range)
data$SQ7 <- as.factor(data$SQ7)
data$Dong <- as.factor(data$Dong)
data$A16 <- as.factor(data$A16)
data <- data %>% select(-A11_1)
data$y <- as.factor(data$y)

table(data$y)




#훈련데이터와 시험 데이터 나누기.
train <- createDataPartition(data$y, p=0.75, list =FALSE)
td <- data[train,]
vd <- data[-train,]
rm(train)

