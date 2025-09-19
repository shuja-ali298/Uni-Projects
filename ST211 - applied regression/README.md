# ST211 — Applied Regression (Group Project)

**Grade:** 62/100  

**Repo links:**  
- 📄 Code: [`combined_code.R`](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST211%20-%20applied%20regression/combined_code.R)  
- 📕 Report: [`report.pdf`](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST211%20-%20applied%20regression/report.pdf)  

---

## Overview
We used the **Next Steps (LSYPE)** cohort to model two outcomes for young adults in England:  

1. **Debt level (W8QDEB2)**  
2. **Income**  

We also tested two substantive questions:  
- Does the **mother’s situation** influence their child’s later **debt**?  
- How much do **education-related variables** matter for **income** compared to other factors?  

---

## Data & Cleaning
- Source: Next Steps (England, births 1989–90).  
- Negative values were set to `NA`.  
- Removed variables with ≥30% missingness.  
- Merged categories for parsimony (e.g., employment status).  
- Created “main parent” constructs by combining mum/dad fields when one was missing.  

---

## Methods
- Extensive EDA with boxplots, scatterplots, and outlier checks.  
- Multiple **linear regressions**:  
  - Baseline with all predictors.  
  - Stepwise elimination to refine.  
  - **Income**: compared baseline, *with* education block, and *without* education block using adjusted R² and RSE.  
  - **Debt**: compared baseline vs. mother-related block.  
- Diagnostics: residual plots, influence statistics, **VIF** (no serious multicollinearity).  

---

## Key Findings

### Debt
- Significant predictors included:  
  - **Father’s highest qualification**  
  - **Independent school attendance**  
  - **Attitude to debt**  
  - **Mental health (GHQ-12, negative coefficient)**  
  - **Experienced discrimination (racism)**  
  - **Current tenure**  
- **Mother-related variables had little influence** on debt; adding them barely changed fit.  
- Adjusted R² was very low (**≈0.03**), suggesting debt is hard to predict.  

### Income
- Important drivers included **family socio-economic background**, **school experience**, **current qualifications/work**, and **demographics**.  
- Education block contributed only marginally:  
  - Baseline adj. R² ≈ 0.631  
  - With extra education vars ≈ 0.6313  
  - Without education block ≈ 0.616  
- Suggests many **non-education factors** carry the signal.  

---

## Limitations
- **Low explanatory power** for debt models and unstable estimates.  
- **Missing-not-at-random** patterns (e.g., absent fathers).  
- Lack of **geographic variables**.  
- Possible **response bias** on sensitive survey items (e.g., substance use).  

---

## Reproducibility
1. Place the raw file `data/W8QDEB2.csv` in `./data/`.  
2. Open [`combined_code.R`](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST211%20-%20applied%20regression/combined_code.R) in R (≥4.x).  
3. Install/load required libraries: `tidyverse`, `arm`, `car`, `gridExtra`.  
4. Run script end-to-end for cleaning, EDA, model fitting, diagnostics, and outlier analyses.  

---

## My Contributions
- Led cleaning and feature engineering (e.g., merging mum/dad variables, collapsing employment categories).  
- Built and compared model sets; ran diagnostics (VIF, influence, residuals).  
- Wrote up interpretation and policy-facing summary.  

---

## Takeaway
- **Income** is multi-factorial beyond education, with strong effects from socio-economic and demographic factors.  
- **Debt** is difficult to explain with parental or maternal characteristics, but shows links to **tenure, discrimination, attitudes, and mental health**.  
