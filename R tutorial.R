setwd('C:/Users/theer/OneDrive/Github/r_tutorial')

print("Hello world")

X = 10
Y <- 10
Z = X + Y

print(Z)

int = 10L
int

typeof(int)


comp = 2 + 3i
comp
typeof(3i)



char = "Hello R!"

logi = TRUE
typeof(logi)

raw = charToRaw("Hello")
print(raw)

vector = c(1.5, 2.5, 3.5)




vector2 = c(1:3)
print(vector2)

text = c("A", "B", "C")
print(text)


list_a = list(1,2,3,4,"A",TRUE)

print(list_a)

(list_a)



fact = factor(c("A", "B", "C", "A", "C"))

fact


df = data.frame(numbers = c(1,2,3), letters = c("A", "B", "C"))
print(df)



metrix_ = matrix(1:9, nrow = 3)
print(metrix_)

print(metrix_[2,2])


dt = as.Date("2024-01-01")
dt
typeof(dt)


typeof(df)
class(df)


X = 30

if (X >= 31) {
  print("X is greater than 30")
} else if (X == 30) {
  print("X is equal to 30")
} else {
  print("X is less than 30")
}


for (i in 1:10) {
  print(i)
}

sum = 0
count = 1
while (count <= 5) {
  sum = sum + count
  count = count + 1
}

print(sum)


my_function = function(x, y) {
  result = x + y
  return(result)
}

my_function(3, 4)

test_func = my_function(4, 5)
print(test_func)



install.packages("dplyr")

library(dplyr)

data = read.csv("https://raw.githubusercontent.com/aeiwz/R_tutorial/main/src/data/sample_data.csv")


View(data)

data$group = c("A", "A", "A", "B", "B")
View(data)
write.csv(data, "Test.csv", row.names = FALSE)

sub_data = data[data$age > 25, ]
sub_data

filtered_data = filter(data, age <= 25)
filtered_data


selected_data = select(data, name, age)
selected_data
mutate_data = mutate(data, age_next_year = age + 1)
mutate_data

summary_data = summary(data, mean_age = mean(age))
summary_data



t_test = t.test(data$age ~ data$group)
t_test


df = data.frame(age = c(25,24,28,27,35,34,29,30), group = c("A","A","A","A","B","B","B","B"))
df
t_test = t.test(df$age ~ df$group)




install.packages('ggplot2')
install.packages('datasets')
install.packages('stats')

library(ggplot2)
library(datasets)
library(stats)

data(iris)

head(iris, 3)



pca_result = prcomp(iris[, 1:4], center = TRUE, scale. = TRUE)

summary(pca_result)


biplot(pca_result, main = "PCA Biplot of Iris Dataset")


pca_score = as.data.frame(pca_result$x)

pca_score$Species = iris$Species

ggplot(pca_score, aes(x = PC1, y = PC2, colour = Species)) + geom_point(size = 3) +
  labs(title = "PCA of Iris dataset",
       x = "PC1",
       y = "PC2") + theme_minimal()


