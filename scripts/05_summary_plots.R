# Purpose: Generate summary plots for report

library(ggplot2)
library(gridExtra)

# Load final data with clusters
diab_data <- read.csv("data/diabetes_ready.csv")

# Placeholder: reuse or enhance visuals for final report
# Outcome distribution, PCA clusters, cluster vs outcome

# Example: Cluster vs. Outcome bar plot
ggplot(diab_data, aes(x = Cluster, fill = factor(Outcome))) +
  geom_bar(position = "fill") +
  labs(title = "Cluster vs Outcome Summary", x = "Cluster", y = "Proportion", fill = "Outcome")
