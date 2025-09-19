# DS202: Data Science for Social Scientists  

This repository contains my summative coursework and final exam for **DS202**.  
Each assignment involved applying R, tidyverse, and tidymodels to real-world datasets, demonstrating data wrangling, feature engineering, and modelling.  

---

## 📄 Summative 1 — UK Public Finances (W04)  
**File:** [32246_summative1.qmd](https://github.com/shuja-ali298/Uni-Projects/blob/main/DS202%3A%20Data%20Science%20for%20Social%20Scientists/32246_summative1.qmd)  
**Score:** *95/100*  

- **Task:** Predict **central government net borrowing** using UK public finance data.  
- **Approach:**  
  - Created `income_tax_receipts` from multiple tax sources.  
  - Split into **train (≤ May 2010)** vs **test (≥ June 2010)**.  
  - First model: linear regression on income tax receipts → **MAE ≈ 3994 (train), 8497 (test)**.  
  - Improved model: used **public sector net borrowing** as predictor → far better fit, **MAE ≈ 1254 (train), 1854 (test)**.  
- **Reflection:** Showed the importance of variable choice; results influenced by policy regime shifts (Labour vs Conservative fiscal policy post-2010).  

---

## 📊 Summative 2 — GDP & Public Finances (W08)  
**File:** [32246_summative2.html](https://github.com/shuja-ali298/Uni-Projects/blob/main/DS202%3A%20Data%20Science%20for%20Social%20Scientists/32246_summative2.html)  
**Score:** *70/100*  

- **Part 1 — GDP wrangling:** Cleaned UK quarterly GDP, computed % growth, and flagged **technical recessions** (e.g. 1992, 2009, 2020).  
- **Part 2 — Baseline model:** Logistic regression predicting whether **net investment ↑ ≥ 5%** year-on-year.  
  - Feature: **lagged net current expenditure %** of investment.  
  - Achieved **F1 = 0.80** and correct prediction for 2023 test year.  
- **Part 3 — Extended model:** Engineered **lagged income tax receipts per GDP** as predictor.  
  - Weaker results: skewed predictions, **F1 ≈ 0.65**, wrong 2023 prediction.  
- **Reflection:** Baseline outperformed — showing simpler engineered features sometimes generalise better than more “creative” ones.  

---

## 📝 Final Exam (24-hour remote)  
**File:** [32246_exam.html](https://github.com/shuja-ali298/Uni-Projects/blob/main/DS202%3A%20Data%20Science%20for%20Social%20Scientists/32246_exam.html)  
**Score:** *62/100*  

- **Part 1 — Supervised learning:**  
  - Critiqued decision tree for predicting diabetes status (imbalanced, unpruned, overfit).  
  - Suggested alternatives: weighted SVMs, regularised multinomial models, and pruning ensembles.  
  - Addressed **label poisoning** (robust training, anomaly detection, domain knowledge checks).  

- **Part 2 — Trial design:**  
  - Proposed **EDA → PCA → clustering (k-means/GMM)** to identify patient subgroups with shared characteristics for treatment response.  

- **Part 3 — Pharmaceutical reviews (NLP):**  
  - Research Q: **Which text features predict review usefulness?**  
  - Plan: pre-process reviews, engineer text length/readability features, run **TF-IDF + LDA topic modelling**, and correlate topics with usefulness.  

---

## ⚙️ Key Skills Demonstrated  
- Data wrangling (`dplyr`, `tidyr`, `janitor`)  
- Feature engineering (lagging, ratios, macro-economic indicators)  
- Predictive modelling (`tidymodels`, logistic/linear regression, decision trees)  
- Model evaluation (MAE, F1, ROC-AUC, calibration)  
- Dimensionality reduction & clustering (PCA, k-means)  
- Text mining & topic modelling (`quanteda`, `topicmodels`)  

---
