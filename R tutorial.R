setwd('C:/Users/theer/OneDrive/Github/r_tutorial')

X = c(1,2,3,4,5,6)
Y = c(6,5,4,3,2,1)
plot(X,Y)


# Data Visualization in R



# Load necessary libraries
library(ggplot2)
library(datasets)  # Iris dataset is included in this package
library(stats)     # For PCA function



# Load the Iris dataset
data(iris)
head(iris)

## Perform PCA


# Perform PCA on the numeric columns of the Iris dataset
pca_result <- prcomp(iris[, 1:4], center = TRUE, scale. = TRUE)

# Display PCA result summary
summary(pca_result)

## PCA Biplot


# Biplot of PCA
biplot(pca_result, main = "PCA Biplot of Iris Dataset")


## Visualize PCA Results

### PCA Scores Plot

# Create a data frame with PCA scores and species for visualization
pca_scores <- as.data.frame(pca_result$x)
pca_scores$Species <- iris$Species

# Plot the first two principal components
ggplot(pca_scores, aes(x = PC1, y = PC2, color = Species)) +
  geom_point(size = 3) +
  labs(title = "PCA of Iris Dataset",
       x = "Principal Component 1",
       y = "Principal Component 2") +
  theme_minimal()


### Explained Variance


# Plot the variance explained by each principal component
explained_variance <- summary(pca_result)$sdev^2
explained_variance <- explained_variance / sum(explained_variance)

# Plot the cumulative variance explained
qplot(x = 1:length(explained_variance), y = cumsum(explained_variance), geom = "line") +
  labs(title = "Cumulative Explained Variance",
       x = "Number of Principal Components",
       y = "Cumulative Explained Variance") +
  theme_minimal()


