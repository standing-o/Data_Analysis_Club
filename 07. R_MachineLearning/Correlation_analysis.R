## Correlation analysis
# dataset
data <- read.csv("autoparts.csv", header = TRUE)
data1 <- data[data$prod_no == "90784-76001", c(2:11)]
data2 <- data1[data1$c_thickness < 1000, ]

# Correlation 
cor(data2$separation, data2$s_separation)

cor(data2)  # all of correlation

# simple expression
x <- cor(data2)
symnum(x)

plot(data2)
plot(x)