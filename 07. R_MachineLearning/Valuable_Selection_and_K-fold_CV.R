## Optimal Valuables Selection with AIC
# dataset
data = read.csv("autoparts.csv")
is.na(data)
data1 = data[data$prod_no=="90784-76001",c(2:11)]
data2 = data1[data1$c_thickness < 1000,]

# Multiple Linear Regression
model1 = lm(c_thickness~., data = data2)
summary(model)

# Forward Selection
step(model, direction = "forward")

# Backward Elimination
step(model, direction = "backward")

# both methods
step(model, direction = "both")

## K-fold Cross Validation
# split dataset
t_index = sample(1:nrow(data2),size=nrow(data2))
split_index = split(t_index, 1:10)
head(split_index)

# K-fold
mes = c()
for(i in 1:10)
{
  test = data2[split_index[[i]], ]
  train = data2[-split_index[[i]], ]
  
  model2 = lm(c_thickness~., data=train)
  m_pred = predict(model2, test)
  mes[i] = mean((test$c_thickness-m_pred)^2)
}
mean(mes)