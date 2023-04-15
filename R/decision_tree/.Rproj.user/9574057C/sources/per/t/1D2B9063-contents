colnames(td)

?C5.0Control #세부 설정 확인해 설정변경

c5_options <- C5.0Control(CF = 0.05, noGlobalPruning = FALSE, seed = 8)#세부 설정

tree1 <- C5.0(y~., data = td,control=c5_options, trials=35) #모델 학습
summary(tree1)

treepred <- predict(tree1, vd,type = 'class') #모델 예측
confusionMatrix(treepred,vd$y) #예측 결과 확인 Accuracy 부분 확인

plot(tree1) #의사결정나무 그리기


