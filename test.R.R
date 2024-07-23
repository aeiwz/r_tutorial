# Install the necessary packages if you haven't already
install.packages(c("tidyverse", "ggplot2"))

# Load the libraries
library(tidyverse)
library(ggplot2)


# Replace 'your_dataset.csv' with the path to your actual dataset
df <- read.csv('group_1_data.csv')

# Remove rows with missing values
df_clean <- df %>% drop_na()

# Alternatively, if you want to remove missing values from specific columns only:
df_clean <- df %>% drop_na(Scores, Income)


data_ = sample_data[, c("name", "age", "scores")]
write_csv(data_, "./src/data/sample_data.csv")
# Convert columns to appropriate data types
df_clean <- df_clean %>%
  mutate(
    ID = as.integer(ID),
    Name = as.character(Name),
    Age = as.integer(Age),
    Height = as.numeric(Height),
    Weight = as.numeric(Weight),
    Gender = as.factor(Gender),
    Income = as.numeric(Income),
    Scores = as.numeric(Scores)
  )


ggplot(df_clean, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")


ggplot(df_clean, aes(x = Gender, y = Income, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Income Distribution by Gender", x = "Gender", y = "Income")


ggplot(df_clean, aes(x = Height, y = Weight)) +
  geom_point(aes(color = Gender)) +
  labs(title = "Height vs. Weight", x = "Height", y = "Weight")



# Create Age groups
df_clean <- df_clean %>%
  mutate(Age_Group = cut(Age, breaks = seq(15, 75, by = 10), right = FALSE, 
                         labels = paste(seq(15, 65, by = 10), seq(24, 74, by = 10), sep = "-")))

ggplot(df_clean, aes(x = Age_Group, y = Scores, fill = Age_Group)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  labs(title = "Average Scores by Age Group", x = "Age Group", y = "Average Scores")
