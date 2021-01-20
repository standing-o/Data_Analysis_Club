## Clustering Analysis

# dataset (iris)
head(iris)
iris1 <- iris[, 3:4]
head(iris1)

# Normalization
data.scaled <- scale(iris1)
head(data.scaled)

# K-means clustering
data.cluster <- kmeans(data.scaled, centers = 3)
data.cluster

# Visualization
plot(data.scaled, col = data.cluster$cluster)
points(data.cluster$centers, col = 1:3, pch = 8, cex = 2) # center point


# dataset (autoparts)
data1 <- read.csv("autoparts.csv", header = TRUE)
data2 <- data1[data1$prod_no=="45231-3B610", c(2:11)]

# flag column
data2$flag <- 1
data2$flag[data2$c_thickness > 32] <- 2
data2$flag[data2$c_thickness < 20] <- 3

table(data2$flag)

# Normalization
data2.scaled <- scale(data2[, 1:9])
head(data1.scaled)

# k-mean Clustering
data2.cluster <- kmeans(data2.scaled, centers = 3)
data2.cluster

# Visualization
plot(data2.scaled, col = data2.cluster$cluster)
points(data2.cluster$centers, col = 1:3, pch = 8, cex = 2) 

# Conclusion
table(real = data2$flag, pred = data2.cluster$cluster)
