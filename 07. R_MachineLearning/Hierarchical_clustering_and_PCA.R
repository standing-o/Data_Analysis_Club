## Hierarchical clustering
# dataset (autoparts)

data <- read.csv("autoparts.csv", header = TRUE)
data1 <- data[data$prod_no=="45231-P3B750", -1]
data1$flag <- 1
data1$flag[data1$c_thickness > 32] <- 2
data1$flag[data1$c_thickness < 20] <- 3
table(data1$flag)

# Normalization
data1.scaled <- scale(data1[, 1:9])
head(data1.scaled)

# Hierarchical clustering
d <- dist(data1.scaled)
data1.cluster <- hclust(d)

# Visualization
plot(data1.cluster)

# Dimensionality Reduction with PCA
d <- dist(autoparts4[, 1:9]); d
fit <- cmdscale(d) # PCA
head(fit)
x <- fit[, 1]
y <- fit[, 2]

# Visualization
plot(x, y, xlab = "Coordinate 1", ylab = "Coordinate 2", type = "n")
text(x, y, labels = data1$flag, cex = 0.7, col = data1$flag)