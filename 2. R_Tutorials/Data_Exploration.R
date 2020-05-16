# 1. mtcars
head(mtcars)

# wt : weight of car
# mpg : miles per gallon
wt <- mtcars$wt
mpg <- mtcars$mpg

# Visualization of Data Distributions - Scatter Plot
plot(wt, mpg, main = "Car Weight-mpg", 
     xlab = "Car Weight", ylab = "Miles Per Gallon",             
     col="blue", pch = 16)                                  

# Multi Plotting - pairs()
var <- c("mpg", "disp", "drat", "wt")
data <- mtcars[,var]
pairs(data)



# 2. iris
head(iris)

# Visualization of Data Distributions - Scatter Plot
iris.2 <- iris[,3:4] 
point <- as.numeric(iris$Species)
color <- c("red","blue","black")
plot(iris.2, main = "Iris", pch = c(point), col = color[point])

# Correlation analysis
cor(iris[,1:4])
cor(iris$Sepal.Length, iris$Petal.Length)