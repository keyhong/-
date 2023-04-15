df <- read.csv('./X_chungA_home.csv') #데이터 파일 읽기
str(df)

library(dplyr)
library(caret)
library(C50)
library(tree)
library(rpart)
library(party)
library(CHAID)


data <- df

colnames(data)

#y값 설정.
data <- data %>% mutate(y = ifelse(A11_1 >=1.5, 'mixed', 'rice'))

data <- data %>% select(-X,-A11_1) # 필요없는 변수 제거하는 부분
data <- data %>% select(-SQ2,-pay)

str(data)
#범주형 데이터 factor로 변환
data$package_look1 <- as.factor(data$package_look1)
data$package_yes2 <- as.factor(data$package_yes2)
data$home_lh <- as.factor(data$home_lh)
data$bk_regularly1 <- as.factor(data$bk_regularly1)
data$BA4 <- as.factor(data$BA4)
data$c6_10_1 <- as.factor(data$c6_10_1)
data$c6_3_1 <- as.factor(data$c6_3_1)
data$health1 <- as.factor(data$health1)
data$h1_9_1 <- as.factor(data$h1_9_1)
data$safery_grain1 <- as.factor(data$safery_grain1)
data$natural_helpful <- as.factor(data$natural_helpful)
data$A19 <- as.factor(data$A19)
data$effect_job1 <- as.factor(data$effect_job1)
data$effect_rice1 <- as.factor(data$effect_rice1)
data$five_nutrient1 <- as.factor(data$five_nutrient1)
data$h1_6_2 <- as.factor(data$h1_6_2)
data$solo_eat1 <- as.factor(data$solo_eat1)
data$satisfy1 <- as.factor(data$satisfy1)
data$diet1 <- as.factor(data$diet1)
data$rice_helpful1 <- as.factor(data$rice_helpful1)
data$eat_bk <- as.factor(data$eat_bk)
data$various_food1 <- as.factor(data$various_food1)
data$h1_13_1 <- as.factor(data$h1_13_1)
data$c6_4_2 <- as.factor(data$c6_4_2)
data$h1_2_2 <- as.factor(data$h1_2_2)
data$SQ7 <- as.factor(data$SQ7)
data$SQ1 <- as.factor(data$SQ1)
data$BA2 <- as.factor(data$BA2)
data$BA2_1 <- as.factor(data$BA2_1)

data$y <- as.factor(data$y)

table(data$y)

str(data)


#훈련데이터와 시험 데이터 나누기.
train <- createDataPartition(data$y, p=0.75, list =FALSE)
td <- data[train,]
vd <- data[-train,]
rm(train)

