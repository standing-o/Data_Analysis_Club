# 1. Treemap
# Load Packages
install.packages("treemap")
library(treemap)

# Load dataset
data(GNI2014) 

# Explore dataset
str(GNI2014)
head(GNI2014)

# Visualization
# type : coloring method , bg.labels : background color of labels
treemap(GNI2014, index=c("continent","iso3"), vSize="population", 
        vColor="GNI", type="value", bg.labels="blue")



# 2. Bubble Chart
# Load Packages
install.packages("MASS")
library(MASS)

# Load dataset
data(UScrime) 

# Explore dataset
str(UScrime)
head(UScrime)

# Visualization
# fg : border color , bg : background color, lwd : border thickness
r <- sqrt(UScrime$Pop) # Reducing radius
symbols(UScrime$U2, UScrime$y, circles = r, inches = 0.4,
        fg = "red", bg = "yellow", lwd = 1.5,
        xlab="unemployment 35-39 males", ylab="crime rate",
        main="UScrime Data")
text(UScrime$U2, UScrime$y, 1:nrow(UScrime),
     cex=0.8, col="black")



# 3. Mosaic Plot
# Explore dataset
Titanic

# Visualization
# red : Survived = NO, blue : Survived = Yes
mosaicplot(Titanic, main = "Survival on the Titanic", 
           color = c("red","blue"), off = 2)