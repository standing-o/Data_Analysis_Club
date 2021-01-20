## Multiple Linear Regression with autoparts dataset

# Make Dataset
data = read.csv("autoparts.csv")
head(data, n=10)
dim(data)

# na
is.na(data)
sum(is.na(data))

# slicing
data1 = data[data$prod_no=="90784-76001",c(2:11)]
head(data1, n=10)
dim(data1)

boxplot(data1)  # visualize outliers
boxplot(data1$separation)
boxplot(data1$c_thickness)  # here!

data2 = data1[data1$c_thickness < 1000,]

# Multiple Linear Regression
model = lm(c_thickness ~ fix_time + a_speed, data = data2)

# conclusion
summary(model)

# visualization : Residuals vs Fitted, Q-Q plot, Scaled residuals, Residuals vs Leverage
plot(model)

# prediction of c_thickness with one data
sample1 = data.frame(fix_time=86.1, a_speed=0.610, b_speed=1.718, 
                     separation=241.9, s_separation=657.3, rate_terms=95, 
                     mpa=78.2, load_time=18.1,highpressure_time=74)
predict(model, newdata = sample1)

# prediction of c_thickness with two datas
sample2 = data.frame(fix_time=c(86.1,86.1), a_speed=c(0.610,0.603), b_speed=c(1.718,1.704),
                     separation=c(241.9,242.5), s_separation=c(657.3,657.3), rate_terms=c(95,95), 
                     mpa=c(78.2,77.9), load_time=c(18.1,18.2), highpressure_time=c(74,56))
predict(model, newdata = sample2)
predict(model, newdata = sample2, interval = "confidence") # confidence