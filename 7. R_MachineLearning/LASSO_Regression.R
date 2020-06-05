## LASSO Regression
# dataset
data = read.csv("autoparts.csv")
is.na(data)
data1 = data[data$prod_no=="90784-76001",c(2:11)]
data2 = data1[data1$c_thickness < 1000,]

# import packages
install.packages("glmnet")
library(glmnet)

# valuable vector
X = as.matrix(data2[1:9])
y = data2$c_thickness

# LASSO Regression
fit.lasso = glmnet(x = X, y = y, alpha=1, nlambda=100)
fit.lasso.cv = cv.glmnet(x = X, y = y, nfolds=10, alpha = 1, lambda = fit.lasso$lambda)
plot(fit.lasso.cv)

# optimal model
fit.lasso.param = fit.lasso.cv$lambda.min
fit.lasso.tune = glmnet(x = X, y = y, alpha = 1, lambda = fit.lasso.param)
coef(fit.lasso.tune) # coefficient