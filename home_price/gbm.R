GBM_model = gbm(SalePrice ~ .,data=train_data,n.trees=500,shrinkage=0.005 ,cv.folds=3)
train_data <- train_data[1:1200,]
test_data <- train_data[1201:1460,]
best.iter <- gbm.perf(GBM_model,method="cv")
train_pred <- predict.gbm(GBM_model,train_data,best.iter)
test_pred <- predict.gbm(GBM_model,test_data,best.iter)

l2_val = sqrt(sum((test_pred - test_data$SalePrice)^2)/length(test_pred))
