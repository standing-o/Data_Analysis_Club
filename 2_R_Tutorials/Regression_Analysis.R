# 1. Simple Regression Analysis
# Load Dataset
head(cars)
plot(dist~speed, data=cars)

# Simple regression model
model1 <- lm(dist~speed, cars)
model1

# weight $ bias
coef(model1)[1] # bias
coef(model1)[2] # Weight

# Visualization with Scatterplot
plot(dist~speed, data=cars)
abline(coef(model1))



# 2. Multiple Regression Analysis
# Load dataset
install.packages("car")
library(car)
head(Prestige)

# Explore dataset
data <- Prestige[,c(1:4)]
plot(data, pch = 16, col = "red")

# Multiple Regression Model
# Estimate : Coefficients
model2 <- lm(income ~ education + prestige + women, data = data)
summary(model2)



# 3. Logistic Regression (Softmax Regression)
# Explore dataset
head(iris)

# Logistic Regression Model
model3 <- glm(as.integer(Species) ~., data= iris)
summary(model3)

# Prediction
ex <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(ex) <- names(iris)[1:4]
pred <- predict(model3, ex) 
pred

test <- iris[,1:4]
pred <- predict(model3, test) 
pred
pred <- round(pred, 0) # find nearest integer
pred 

# Accuracy
pred == as.integer(iris[,5]) 
acc <- mean(pred == as.integer(iris[,5]))
acc

iris$Species
as.integer(iris$Species) 