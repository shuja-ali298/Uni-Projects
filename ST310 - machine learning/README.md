# ST310: Machine Learning

Coursework from **ST310: Machine Learning** (LSE).  
This folder includes three assignments: an **individual prediction challenge**, an **applied simulation + modelling PSET**, and a **group NBA classification project**.

---

## 📌 Assignments

### 1) Prediction Challenge (50% of final mark)
**Overview:** Three separate prediction tasks graded by **test accuracy** relative to the class:  
- **Large sample regression (40%)**  
- **High-dimensional regression (30%)**  
- **Classification with imbalanced test data (30%)** — test set ≈ 68% positives

**Submission rules (concise):**
- Work alone; submit **three CSVs** named `bigdata_<candidate>.csv`, `highdim_<candidate>.csv`, `classify_<candidate>.csv`
- CSV header must be `y`; rows correspond **exactly** to test order  
- Regression predictions numeric; classification predictions **0/1**  
- Marking metrics: regression → **√MSE**; classification → **misclassification rate**

**My results:**  
- **Large-sample regression:** 90/100 
- **High-dimensional regression:** 87/100 
- **Classification:** 92/100

**Files:**  
- 📄 Code & write-up: **prediction_challenge.Rmd**  
  - https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/prediction_challenge.Rmd

---

### 2) Problem Set 3: Simulation, GAMs & Trees (25% of final mark)
**Overview:**  
- I **simulated my own dataset on watches** (in R), with **purchase probability** as the **outcome** and mixed categorical/numeric **explanatory** variables.  
- Additive models: `gam_oracle` (CEF-informed interactions) and `gam_simple` (no interactions).  
- Tree-based models: **single tree**, **random forest**, **boosted trees**; tuned via cross-validation.  
- **Analysis & visualisation**: plots + metrics for interpretability.  
- **Generalisation**: compared in-distribution (ID) vs out-of-distribution (OOD).  
  - **Concept shift:** same predictors, different outcome mechanism.  
  - **Covariate shift:** different predictor distribution, same outcome mechanism.  
  - For **each** shift type I implemented **one weakening** and **one improving** scenario, with brief reasoning.

**Where to find it (stored as `pset3_48626`):**  
- 📄 R Markdown (code + write-up):  
  https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/pset3_48626.Rmd  
- 📑 Knitted HTML (download to view):  
  https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/pset3_48626.html

**My result:** 91/100

---

### 3) Group Project: NBA Player Classification (25% of final mark)
**Goal:** Classify NBA players into **Low / Average / Elite** scoring tiers (`pts_level`) using performance metrics (USG%, TS%, net rating, REB, AST, height/weight, etc.).

**Data:** Kaggle — NBA Players Dataset  
- https://www.kaggle.com/datasets/justinas/nba-players-data?resource=download

**Pipeline highlights:**  
- Cleaning: harmonised draft/college labels; median imputation for OREB%, DREB%, USG%, TS%, AST%; filtered outliers & gp < 5.  
- Train/test split + **5-fold CV**.  
- Models: baseline multinomial logit (`nnet`), **custom softmax (GD)**, **Elastic Net (glmnet)**, **Random Forest (ranger)**, **SVM (RBF)**.  
- Metrics: **accuracy**, **ROC AUC**, **sensitivity**, **specificity**, **Brier score**.  
- Result: **SVM ~0.96 acc / 0.993 AUC / best Brier**, **Elastic Net ~0.956 acc / 0.993 AUC** (most interpretable).

**Files:**  
- 📄 R Markdown (code + write-up):  
  https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/ST310%20project%20(1).Rmd  
- 📑 Knitted HTML (download to view):  
  https://github.com/shuja-ali298/Uni-Projects/blob/main/ST310%20-%20machine%20learning/ST310-project--1-.html

**My result:** 55/75

---

> *Note:* Some files are knitted HTML; GitHub won’t render them inline. Click **Download raw file** to view locally, or open the corresponding `.Rmd` for code and narrative.
