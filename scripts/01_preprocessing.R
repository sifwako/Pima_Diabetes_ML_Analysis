# Purpose: Clean and preprocess the diabetes dataset

library(dplyr)
if (!dir.exists("output/figures")) dir.create("output/figures", recursive = TRUE)
# Load data
diab_data <- read.csv("data/diabetes.csv")

# Replace zero values in selected columns with median
zero_columns <- c("Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI")
diab_data <- diab_data %>%
  mutate(across(all_of(zero_columns), ~ ifelse(. == 0, median(.[. != 0], na.rm = TRUE), .)))

# Outlier treatment using IQR capping
diab_data <- diab_data %>%
  mutate(across(everything(), ~ {
    Q1 <- quantile(., 0.25, na.rm = TRUE)
    Q3 <- quantile(., 0.75, na.rm = TRUE)
    IQR <- Q3 - Q1
    pmin(pmax(., Q1 - 1.5 * IQR), Q3 + 1.5 * IQR)
  }))

# Save preprocessed data
write.csv(diab_data, "data/diabetes_clean.csv", row.names = FALSE)
