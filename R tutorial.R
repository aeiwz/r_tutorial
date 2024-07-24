setwd('C:/Users/theer/OneDrive/Github/r_tutorial')

X = c(1,2,3,4,5,6)
Y = c(6,5,4,3,2,1)
plot(X,Y)


# Step 1: Load the datasets package (optional, usually not necessary)
library(datasets)

# Step 2: Load the Iris dataset
data("iris")

# Step 3: View the first few rows of the dataset
head(iris)

# Step 4: Get a summary of the dataset
summary(iris)

# Step 5: Check the structure of the dataset
str(iris)

