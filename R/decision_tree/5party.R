library(party) 

tree4 <- ctree(y~., data = td) #모델 학습
plot(tree4, cex =1) 

treepred <- predict(tree3, vd) #모델예측
confusionMatrix(treepred,vd$y) #정확도 확인

