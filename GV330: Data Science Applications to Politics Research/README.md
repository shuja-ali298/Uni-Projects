# GV330: Data Science Applications to Politics Research – Replication Project  

**Assignment:** Replication of *Metrics Management and Bureaucratic Accountability* (Eckhouse, 2021)  
**Score Achieved:** 68/100  

---

## 📘 Project Overview  
This project replicated Eckhouse (2021), which investigated the impact of **metrics management systems (CompStat)** on police behaviour in the United States. CompStat, introduced in New York and later adopted nationwide, was intended to increase accountability through performance metrics.  

However, the study found that while CompStat:  
- **Increased minor (Part 2) arrests** (suggesting stat-padding behaviour),  
- **Increased data manipulation** (e.g., more rape cases marked as “unfounded”),  
- It **did not reduce serious crime (Part 1)**.  

This raised concerns that **metrics-driven policing** shifts incentives away from meaningful long-term crime reduction and toward gaming statistics.  

---

## 🔍 Replication Approach  
- Replicated core models and tables from the paper using the author’s dataset of **47 major U.S. cities (1990–2013)**, covering 1,081 city-year observations.  
- Implemented **fixed effects regressions** with city and year dummies.  
- Used the author’s **wild bootstrap resampling** for robust standard errors.  
- Nearly all coefficients, significance levels, and observations were successfully reproduced.  
- Minor deviations in **standard errors** (e.g., for demographic controls) led to small shifts in statistical significance, but results were broadly robust.  

---

## 💡 Methodological Improvements  
To extend the paper, I introduced:  

- **Generalised Additive Models (GAMs):**  
  - Replaced rigid year and population linear terms with smooth functions.  
  - Captured **non-linear dynamics** in city population and temporal effects.  
  - Substantially improved model fit (Adj. R² ↑ from ~0.60 to ~0.81; Deviance Explained ↑ to ~81.9%).  
  - Showed that CompStat remained significant but with more nuanced explanatory power.  

- **Recommendation:** Using GAMs (and staggered Difference-in-Differences approaches) provides a more flexible, realistic framework for studying **predictive policing** and its unintended consequences.  

---

## 📊 Key Results  
- Replication confirmed that CompStat adoption increased **minor arrests** and **rape case unfounding rates**, with **no effect on serious crime**.  
- GAM analysis revealed hidden **non-linear relationships** and improved predictive performance.  
- Demonstrated the importance of methodological flexibility when evaluating **metrics-based accountability systems**.  

---

## 📂 Files  
- 📄 [Replication Project Report (PDF)](https://github.com/shuja-ali298/Uni-Projects/blob/main/GV330%3A%20Data%20Science%20Applications%20to%20Politics%20Research/replication%20project.pdf)  
- 📘 [Replication Project Code (Rmd)](https://github.com/shuja-ali298/Uni-Projects/blob/main/GV330%3A%20Data%20Science%20Applications%20to%20Politics%20Research/48626_GV330.Rmd)  

---

## 📌 Skills Demonstrated  
- Reproducibility & code validation (R, wild bootstrapping).  
- Critical engagement with published political science research.  
- Application of **advanced ML methods (GAMs)** for improved model flexibility.  
- Linking **data science methods** to real-world policy implications (predictive policing).  
