# k-NN Algorithm
# dataset
data <- read.csv("autoparts.csv", header = TRUE)
data1 <- data[data$prod_no == "90784-76001", c(2:11)]
data2 <- data1[data1$c_thickness < 1000, ]

data2$y_faulty <- ifelse((data2$c_thickness < 20) | (data2$c_thickness > 32), 1, 0)
t <- sample(1:nrow(data2), size=nrow(data2)*0.7)

# split train, test dataset
train <- data2[t, ]    # 70%
test <- data2[-t, ]    # 30%
nrow(train) ; nrow(test) 
head(train)

# arguments
# train data matrix
xmat.train <- as.matrix(train[1:9])
head(xmat.train)
y_faulty.train <- train$y_faulty   

# test data matrix
xmat.test <-as.matrix(test[1:9])
head(xmat.test)

# prediction
library(class)
yhat_test <- knn(xmat.train, xmat.test, as.factor(y_faulty.train), k=3)
yhat_test

# prediction
table <- table(real = test$y_faulty, predict=yhat_test) ; table
(table[1,1] + table[2,2]) / sum(table)

# optimal k
library(e1071)
tune.out <- tune.knn(x=xmat.train, y=as.factor(y_faulty.train), k=1:10) ; tune.out

plot(tune.out)

# k = 5
yhat_test <- knn(xmat.train, xmat.test, as.factor(y_faulty.train), k=5)
table <- table(real = test$y_faulty, predict=yhat_test) ; table
(table[1,1] + table[2,2]) / sum(table)