## Simple linear regression with women height&weight dataset
model = lm(weight ~ height, data = women)

# conclusion
summary(model)

# visualization
plot(women $ height, women $ weight)
abline(model, col = "red")

# prediction of weight when height = 75
ans1 = data.frame(height = 75)
predict(model, ans1)

ans2 = data.frame(height = c(73,75))
predict(model, ans2)