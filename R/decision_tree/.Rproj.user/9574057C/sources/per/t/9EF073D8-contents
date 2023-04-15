library(CHAID)

##모든 변수가 범주형이어야하므로 데이터 전처리 다시 해주기!
colnames(td)

#필요없는 변수 제외
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
str(data)
data <- data %>% mutate(y = ifelse(A11_1 >=1.5, 'mixed', 'rice')) #Y값 바이너리로 만들기
data <- data.frame(lapply(data,as.factor)) #factor로 변환

data <- data %>% select(-A11_1,-BA1_1) #y값과 문제있는 변수 제외

train <- createDataPartition(data$y, p=0.75, list =FALSE) #트레인 테스트 데이터 나누기
td <- data[train,] #트레인 데이터
vd <- data[-train,] #테스트 데이터
rm(train)


#의사결정나무 모델링 부분
ctrl <- chaid_control(minsplit =20, minbucket = 5)
tree3 <- chaid(y~., data = td, control = ctrl)

print(tree3)
plot(tree3) # 의사결정나무 그리기

summary(tree3)

treepred <- predict(tree3, vd) #예측 
confusionMatrix(treepred, vd$y) #정확도 확인.
