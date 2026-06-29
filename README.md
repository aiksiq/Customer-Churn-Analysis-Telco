# 📉 Telco Customer Churn Analysis

> End-to-end data analysis project: exploring why customers leave a telecom company, quantifying the business impact, and providing data-driven recommendations to reduce churn.

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Status](https://img.shields.io/badge/status-in%20progress-yellow)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 📌 Problem Statement

A telecom company in California is losing customers every quarter. Leadership wants to know:

- **Who** is most likely to churn?
- **Why** are they leaving (which factors matter most)?
- **How much revenue** is being lost because of churn?
- **What actions** could reduce churn going forward?

This project answers these questions using exploratory data analysis, SQL, statistical hypothesis testing, and a simple predictive model — with the focus on translating findings into actionable business recommendations.

## 📊 Dataset

- **Source:** [Telco Customer Churn (Kaggle)](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- **Size:** 7,043 customers, 21 features
- **Target variable:** `Churn` (Yes/No)
- **Key features:** contract type, tenure, monthly charges, internet service, payment method, demographics

## 🗂️ Project Structure

```
telco-churn-analysis/
├── data/
│   ├── raw/                  # original dataset (not committed, see .gitignore)
│   └── processed/            # cleaned data used for analysis
├── notebooks/
│   ├── 01_eda.ipynb          # exploratory data analysis
│   ├── 02_stats.ipynb        # hypothesis testing
│   └── 03_model.ipynb        # predictive model
├── sql/
│   └── queries.sql           # SQL analysis (segmentation, window functions, CTEs)
├── reports/
│   ├── business_summary.md   # key findings & recommendations
│   └── figures/              # exported charts used in README/reports
├── dashboard/
│   └── app.py                # interactive Plotly/Streamlit dashboard
├── requirements.txt
└── README.md
```

## 🔍 Methodology

1. **Data Cleaning & EDA** — handled missing values, fixed data types, explored churn distribution across key segments.
2. **SQL Analysis** — loaded data into SQLite, wrote segmentation queries using CTEs and window functions to rank customer groups by churn risk and revenue impact.
3. **Hypothesis Testing** — used chi-square tests for categorical features and t-tests for numerical features to confirm which factors are statistically associated with churn.
4. **Predictive Modeling** — built a baseline Logistic Regression and a Random Forest model, evaluated with ROC-AUC and recall (prioritized over precision, since missing a churner is costlier than a false alarm).
5. **Business Translation** — converted statistical findings into revenue-at-risk estimates and concrete retention recommendations.

## 📈 Key Findings

*(to be filled in after running the analysis — short, numbered, with the most surprising/impactful insight first)*

1. Overall churn rate: **XX%**
2. Customers on month-to-month contracts churn at **X times** the rate of those on annual contracts
3. Fiber optic internet customers show the highest churn rate (**XX%**) — likely linked to service issues
4. Estimated monthly revenue at risk from churned customers: **$X,XXX**
5. ...

📄 Full write-up: [`reports/business_summary.md`](reports/business_summary.md)

## 💡 Recommendations

*(to be filled in — 3-5 concrete, prioritized actions)*

- ...
- ...
- ...

## 📊 Interactive Dashboard

🔗 [Live dashboard link] *(add once deployed via Streamlit Cloud / Render)*

## 🛠️ Tech Stack

`Python` `pandas` `SQLite` `SQL` `scipy` `scikit-learn` `Plotly` `Streamlit`

## 🚀 How to Reproduce

```bash
git clone https://github.com/<your-username>/telco-churn-analysis.git
cd telco-churn-analysis
pip install -r requirements.txt
jupyter notebook notebooks/01_eda.ipynb
```

## 📬 Contact

**[Your Name]** — [LinkedIn] · [Email] · [Portfolio]

---
*This project is part of my data analyst portfolio. Feedback and suggestions are welcome!*
