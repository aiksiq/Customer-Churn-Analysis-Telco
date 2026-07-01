# 📉 Telco Customer Churn Analysis

This project analyzes customer churn in a telecom company using Python, SQL, and a simple predictive model. The main workflow is documented in the notebook data_proccess.ipynb and covers data cleaning, exploratory analysis, SQL-based segmentation, statistical testing, and churn prediction.

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Status](https://img.shields.io/badge/status-completed-green)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 📌 Project Goal

The goal is to understand which customers are most likely to leave and which factors are most strongly associated with churn. The analysis also estimates the revenue at risk from churned customers and highlights business actions that could improve retention.

## 📊 Dataset

- Source: Telco Customer Churn dataset from Kaggle
- Customers analyzed: 7,043
- Target variable: Churn (Yes/No)
- Main features: Contract, tenure, MonthlyCharges, InternetService, PaymentMethod, PaperlessBilling, TotalCharges

## 🗂️ Project Structure

```text
telco-churn-analysis/
├── data/
│   ├── raw/                    # original dataset
│   └── processed/              # cleaned data used in the notebook
├── data_proccess.ipynb        # main analysis notebook
├── sql/
│   └── queries.sql             # SQL queries used for churn analysis
├── reports/
│   ├── business_summary.md     # summary of findings
│   └── figures/                # charts generated during analysis
├── dashboard/
│   └── app.py                  # simple Streamlit dashboard
├── requirements.txt
└── README.md
```

## 🔍 What is done in the notebook

1. Data cleaning and preprocessing
   - converted TotalCharges to numeric
   - filled missing values for new customers with zero
   - saved the cleaned dataset to data/processed/telco_clean.csv

2. Exploratory data analysis
   - visualized churn distribution
   - compared churn by contract, internet service, payment method, tenure, and monthly charges

3. SQL analysis
   - loaded the cleaned dataset into PostgreSQL using SQLAlchemy and pg8000
   - ran queries to analyze churn by contract, tenure segments, payment methods, and revenue at risk

4. Statistical testing
   - used chi-square tests for categorical features
   - used t-tests for numerical features such as tenure and MonthlyCharges

5. Predictive modeling
   - trained a logistic regression model
   - evaluated it with ROC-AUC and classification metrics

## 📈 Key Findings

- Overall churn rate: 26.54%
- Highest churn rate by contract: Month-to-month customers at 42.71%
- Highest churn rate by internet service: Fiber optic customers at 41.89%
- Highest churn rate by payment method: Electronic check users at 45.29%
- Churned customers had a much shorter average tenure: 17.98 months vs 37.57 months for retained customers
- Estimated monthly revenue at risk from churned customers: $139,130.85
- The logistic regression model achieved ROC-AUC: 0.841

## 💡 Business Takeaways

- Focus retention efforts on month-to-month customers.
- Investigate service quality issues for fiber optic customers.
- Encourage autopay and card-based payments to reduce friction.
- Strengthen onboarding and early engagement for new customers.

## 🛠️ Tech Stack

Python, pandas, matplotlib, seaborn, scipy, scikit-learn, SQLAlchemy, PostgreSQL, Plotly, Streamlit

## 🚀 How to Reproduce

```bash
pip install -r requirements.txt
jupyter notebook data_proccess.ipynb
```

If you want to run the SQL cells, make sure PostgreSQL is running and a database named telco_churn exists.

## 📄 Additional Notes

- Charts generated during the analysis are saved in reports/figures.
- A short business summary is available in reports/business_summary.md.
- A simple dashboard can be launched with:

```bash
streamlit run dashboard/app.py
```
