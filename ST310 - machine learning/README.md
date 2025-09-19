# ST310: Machine Learning

This folder contains my coursework for **ST310: Machine Learning**, completed at the London School of Economics.  
It includes three individual assignments, one of which was a major **prediction challenge** worth 50% of the final grade.

---

## 📌 Assignments

### 1. Prediction Challenge (50% of final mark)
**Overview:**  
An individual project with three separate prediction tasks, each graded by test accuracy relative to the class:

- **Large sample regression (40%)**  
- **High-dimensional regression (30%)**  
- **Classification with imbalanced test data (30%)**

**Key requirements (concise):**
- Work completed individually (no collaboration, no AI tools).  
- Submit predictions as `.csv` files named `bigdata_48626.csv`, `highdim_48626.csv`, `classify_48626.csv`.  
- Predictions formatted correctly (`y` header; regression numeric; classification 0/1).  
- Accuracy measured on hidden test outcomes:
  - Regression → √MSE  
  - Classification → misclassification rate.  
- Final submission also included code + one-sentence model descriptions.

**My Results:**  
- 🟢 **Large sample regression:** 90/100
- 🟢 **High-dimensional regression:** 87/100
- 🟢 **Classification:** 92/100 

---

### 2. Problem Set 3: Simulation, GAMs, and Trees (25% of final mark)
**Overview:**  
- Simulated my own dataset on **watches**, with **purchase probability** as the outcome variable and a mix of categorical and numeric explanatory variables (e.g., brand type, dimensions, random features).  
- Fitted **GAMs**:
  - `gam_oracle` with interaction terms guided by the true CEF  
  - `gam_simple` without interactions  
- Fitted and tuned **tree-based models**: decision tree, random forest, and boosted trees.  
- Analysed and visualised model performance using **plots and metrics** for interpretability.  
- Evaluated **in-distribution (ID) vs out-of-distribution (OOD)** generalisation:  
  - **Concept shift:** changed outcome distribution while keeping predictors the same.  
  - **Covariate shift:** changed predictor distribution while keeping the outcome relationship the same.  
  - For each shift type, I implemented one scenario that **weakened model performance** and another that **improved model performance**, with intuitive explanations of the effects.  
- Full work is stored in:  
  - 📄 [pset3_48626.Rmd (code + write-up)](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/pset3_48626.Rmd)  
  - 📑 [pset3_48626.html (knitted report)](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/pset3_48626.html)

**My Result:** 91/100

