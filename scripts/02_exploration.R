# Purpose: Perform EDA on the cleaned diabetes dataset

library(ggplot2)
library(dplyr)
library(ggcorrplot)

# Load preprocessed data
diab_data <- read.csv("data/diabetes_clean.csv")

# Outcome distribution
ggplot(diab_data, aes(x = factor(Outcome))) +
  geom_bar(fill = c("darkblue", "brown")) +
  labs(title = "Distribution of Diabetes Diagnosis", x = "Outcome", y = "Count")
ggsave("output/figures/class_distribution.png", p1)

# Variance analysis
variances <- apply(diab_data[,-9], 2, var)
variance_df <- data.frame(Variable = names(variances), Variance = variances)
ggplot(variance_df, aes(x = reorder(Variable, Variance), y = Variance)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Variance of Input Variables", x = "Variable", y = "Variance")
ggsave("output/figures/variance_plot.png", p2)

# Drop low-variance feature
diab_data <- diab_data[, -7]  # Remove DiabetesPedigreeFunction

# Correlation matrix
cor_matrix <- cor(diab_data[, -8])
png("output/figures/correlation_matrix.png", width = 800, height = 600)
ggcorrplot(cor_matrix, method = "square", lab = TRUE, type = "upper",
           colors = c("blue", "white", "brown"),
           title = "Correlation Matrix")

# Save updated data without the low variance column
write.csv(diab_data, "data/diabetes_ready.csv", row.names = FALSE)
