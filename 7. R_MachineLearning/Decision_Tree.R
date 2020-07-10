## Decision Tree
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

# import packages
install.packages('tree')
library(tree)
model1 <- tree(factor(y_faulty) ~ fix_time + a_speed
               + b_speed + separation + s_separation
               + rate_terms + mpa + load_time + highpressure_time, data=train)

# visualization
plot(model1)
text(model1)

# Pruning
prune.model1 <- prune.tree(model1, method = 'misclass')
plot(prune.model1)

prune.model1 <- prune.tree(model1, best=9) # complex!
plot(prune.model1)
text(prune.model1)

prune.model1 <- prune.tree(model1, best=3) # simple
plot(prune.model1)
text(prune.model1)

# analysis accuracy
# not pruning
yhat1 <- predict(model1, test, type = "class")
table <- table(real=test$y_faulty, predict=yhat1);table
(table[1,1] + table[2,2]) / sum(table)

# pruning
yhat2 <- predict(prune.model1, test, type = "class")
table <- table(real=test$y_faulty, predict=yhat2) ; table
(table[1,1] + table[2,2]) / sum(table)

# continuous independent variable
model2 <- tree(c_thickness~ fix_time + a_speed + b_speed 
               + separation + s_separation + rate_terms 
               + mpa + load_time + highpressure_time, data=train)
plot(model2)
text(model2)