library(rpart)

?rpart
?rpart.control

cartoption <- rpart.control(cp = 0.004) #설정값 변경

tree2 <- rpart(y~., data = td, method = 'class',control = cartoption) #모델 학습
summary(tree2)

plot(tree2) #나무 그리기
text(tree2,use.n =TRUE,cex = 0.5, col = 'blue') #플롯 위에 글씨 나타내기

treepred <- predict(tree2, vd, type='class') #테스트데이터로 예측
confusionMatrix(treepred, vd$y) #결과값 확인

