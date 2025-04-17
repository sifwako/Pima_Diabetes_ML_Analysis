# Purpose: Apply K-Nearest Neighbors classification to predict diabetes

library(class)
library(caret)

# Load processed data
diab_data <- read.csv("data/diabetes_ready.csv")

# Train-test split (80/20)
set.seed(123)
split <- createDataPartition(diab_data$Outcome, p = 0.8, list = FALSE)
train_data <- diab_data[split, ]
test_data <- diab_data[-split, ]

# Features and labels
X_train <- train_data[, -ncol(train_data)]
X_test <- test_data[, -ncol(test_data)]
y_train <- train_data$Outcome
y_test <- test_data$Outcome

# Evaluate KNN for multiple k values
k_values <- c(3, 5, 7, 9, 11)
for (k in k_values) {
  pred_y <- knn(train = X_train, test = X_test, cl = y_train, k = k)
  cat("\nK =", k, "\n")
  print(confusionMatrix(as.factor(pred_y), as.factor(y_test)))
}
saveRDS(results, "output/confusion_matrices.rds")
