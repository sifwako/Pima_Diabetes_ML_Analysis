# Purpose: Apply K-Means clustering to identify groups in data

library(factoextra)
library(ggplot2)
library(dplyr)

# Load processed data
diab_data <- read.csv("data/diabetes_ready.csv")

# Standardize input variables
scaled_data <- scale(diab_data[, -8])

# Determine optimal number of clusters
fviz_nbclust(scaled_data, kmeans, method = "wss") +
  labs(title = "Elbow Method")
ggsave("output/figures/elbow_method.png", elbow_plot)

fviz_nbclust(scaled_data, kmeans, method = "silhouette") +
  labs(title = "Silhouette Analysis")
ggsave("output/figures/silhouette_analysis.png", sil_plot)

# Apply K-means clustering (k = 2)
set.seed(123)
kmeans_result <- kmeans(scaled_data, centers = 2, nstart = 25)
diab_data$Cluster <- as.factor(kmeans_result$cluster)

# PCA visualization
pca_result <- prcomp(scaled_data)
pca_data <- data.frame(pca_result$x[, 1:2], Cluster = diab_data$Cluster)
ggplot(pca_data, aes(PC1, PC2, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering (PCA)", x = "PC1", y = "PC2")
ggsave("output/figures/kmeans_pca.png", p3)

# Cluster vs Outcome
table(Cluster = diab_data$Cluster, Outcome = diab_data$Outcome)
ggplot(diab_data, aes(x = Cluster, fill = factor(Outcome))) +
  geom_bar(position = "fill") +
  labs(title = "Cluster vs. Outcome", x = "Cluster", y = "Proportion", fill = "Outcome")
ggsave("output/figures/cluster_vs_outcome.png", p4)
