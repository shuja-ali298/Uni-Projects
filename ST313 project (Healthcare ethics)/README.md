# ST313: Ethics of Data Science – Group Project  

**Project Title:** *Causal Analysis of Structural Race Bias in Syphilis Treatment: An Ethical Perspective on Algorithmic Fairness*  
**Score Achieved:** 66.70 / 100  

---

## 📘 Project Overview  
This project explored the ethical implications of **algorithmic fairness in healthcare**, using a **simulated dataset of syphilis patients** to study how **structural race bias** can influence treatment allocation and outcomes. Inspired by historical injustices such as the *Tuskegee Syphilis Study*, we investigated whether modern predictive systems—trained on biased data—could reproduce similar disparities under the guise of objectivity.  

Our analysis combined **causal inference** and **fairness evaluation frameworks** to assess whether race affects both treatment probability and treatment success. We treated this as a stylised but ethically meaningful case study to show how predictive healthcare models can silently replicate or worsen systemic inequities.  

---

## 🔍 Methodology  
We used both **statistical modelling** and **ethical analysis** to interrogate bias:  

- **Causal Inference Methods**  
  - Do-calculus & causal DAG construction  
  - Propensity score inspection  
  - Average Treatment Effect (ATE), Conditional ATE (CATE), and Individual Treatment Effect (ITE)  
  - Inverse Probability of Treatment Weighting (IPTW)  

- **Fairness Evaluations**  
  - **Counterfactual fairness** (race-flipping interventions)  
  - **Group fairness metrics**: precision, TPR, FPR, calibration error  
  - **Intersectionality & accountability**: discussion of compounded disadvantages (e.g., race × SES) and the accountability vacuum in healthcare AI  

- **Ethical Framing & Recommendations**  
  - Linked findings to **historical accountability** (Tuskegee study)  
  - Examined the tension between **fairness as a technical property vs fairness as a moral obligation**  
  - Proposed **policy recommendations**:  
    - Regular **auditing & accountability structures**  
    - **Co-design with marginalised communities**  
    - **TWIX (Training With Explanations)** to align model behaviour with ethical reasoning  

---

## 📊 Key Findings  
- **Treatment effects were consistently positive** (ATE ≈ +26.7pp; IPTW ≈ +53.3pp), but **distribution varied by race**, raising concerns about uneven benefits.  
- **Race-flipping experiments revealed sensitivity**, with predictions changing solely due to race, proving models were not race-neutral.  
- **Fairness metrics varied across groups**: Asian patients saw highest TPR but also highest FPR (risk of overdiagnosis), while Black patients showed the greatest outcome disparity (risk of undertreatment).  
- **Accountability gaps** remain a central challenge: without explainability and institutional accountability, fairness metrics alone cannot prevent bias-driven harm.  

---

## 📌 Outcome  
Our project received **66.70/100**. While the technical implementation captured causal inference and fairness analysis effectively, greater depth in policy recommendations and intersectional simulation could have strengthened the submission.  

---

## 📂 Files  
- 📄 [ST313_Project.ipynb (code + analysis)](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST313%20project%20(Healthcare%20ethics)/43552_48626_47294_ST313_Project.ipynb)  
- 📘 [ST313_Project_Report.pdf (final write-up)](https://github.com/shuja-ali298/Uni-Projects/blob/main/ST313%20project%20(Healthcare%20ethics)/43552_48626_47294_ST313_Project.pdf)  
