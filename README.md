## CLUSTERING AND CLASSIFICATION ON THE PIMA INDIANS DIABETES DATASET 

### Overview
This project uses the Pima Indians Diabetes Dataset to compare two machine learning techniques:
- **K-Means Clustering** for unsupervised analysis
- **K-Nearest Neighbors (KNN)** for supervised classification
The goal is to predict diabetes risk and understand how different ML approaches reveal patterns in medical diagnostic data.

### Dataset
- 768 samples, 8 features, 1 binary outcome (`Outcome`)
- Source: [Dataset Info](https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.names)

### Key Tasks
- Preprocessing: Replace invalid zeros, handle outliers  
- Data Exploration: Distribution, variance, correlations  
- Clustering: K-Means with Elbow & Silhouette methods  
- Classification: KNN with multiple `k` values and evaluation metrics

### Tools Used
- R  
- Packages: `dplyr`, `ggplot2`, `factoextra`, `caret`, `class`, `ggcorrplot`

### Outcome
This project demonstrates how unsupervised and supervised learning techniques can be used to extract medical insights and predict disease diagnosis using real-world health data.


