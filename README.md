# Angle-Based Outlier Detection Ensemble for Big Data

**Author:** [Raghda Al-Taei](https://www.linkedin.com/in/raghda-merry-al-taei-030738120)
For more detailed information, check out the full paper on Springer:  
[Angle-Based Outlier Detection Ensemble for Big Data](https://link.springer.com/chapter/10.1007/978-3-030-33495-6_8)

## Overview
Outlier detection is crucial in various machine learning applications such as fraud detection, network anomaly detection, medical diagnosis, and data cleaning. However, traditional techniques often struggle with high-dimensional datasets especially with massive datasets due to the challenges posed by the curse of dimensionality. This repository presents an **Angle-Based Outlier Detection (ABOD) Ensemble Method** specifically designed for handling big data.

In this project, we extend the ABOD method with the following key improvements:
- **Dimensionality Reduction using Locality Sensitive Hashing (LSH):** To address the high computational cost of ABOD in big data, we integrate LSH to reduce dimensionality and improve efficiency.
- **Ensemble Technique:** To further improve accuracy, we implement an ensemble method that creates multiple subsets of the data. The results of these subsets are aggregated using a supervised combination method such as Support Vector Machine (SVM).

## Key Features
- **High-dimensional Outlier Detection:** Efficient handling of high-dimensional datasets with the ABOD algorithm.
- **Dimensionality Reduction:** Incorporation of LSH to manage big data efficiently.
- **Ensemble Learning:** Enhances the accuracy of outlier detection through ensemble techniques.
- **Supervised Aggregation:** Uses SVM to aggregate results from multiple subsets to boost detection accuracy.

## Applications
- Fraud Detection
- Network Anomaly Detection
- Medical Diagnosis
- Data Cleaning

## Datasets
This method has been tested on several real-world datasets, such as:
- Arrhythmia dataset
- Speech dataset
- Satimage-2 dataset
- Musk dataset

## Getting Started

### Prerequisites
- MATLAB or Octave installed.
- Real-world datasets (e.g., `arrhythmia.mat`) should be available or loaded into the environment.

### Installation
1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/outlier-detection-abod.git
    ```
2. Place your dataset in the working directory.

### Usage
The primary script for running the outlier detection ensemble method is `main.m`. To execute the outlier detection algorithm on your dataset, load the desired dataset and run the `main.m` file. You can customize the parameters like bagging percentage and number of random vectors based on your dataset and requirements.

```matlab
% Load the dataset and execute the main script
run('main.m')
