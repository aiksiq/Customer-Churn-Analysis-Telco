-- =============================================
-- Telco Customer Churn: SQL Analysis
-- Database: SQLite (loaded via pandas.to_sql)
-- =============================================

-- 1. Overall churn rate
SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM customers), 2) AS pct
FROM customers
GROUP BY Churn;

-- 2. Churn rate by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- 3. Tenure segmentation + churn rate per segment
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '12-24 months'
        WHEN tenure <= 48 THEN '24-48 months'
        ELSE '48+ months'
    END AS tenure_segment,
    COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY tenure_segment
ORDER BY churn_rate_pct DESC;

-- 4. Average MonthlyCharges: churned vs retained
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 1) AS avg_tenure
FROM customers
GROUP BY Churn;

-- 5. Ranking segments by churn risk (window function)
SELECT
    InternetService,
    Contract,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct,
    RANK() OVER (
        ORDER BY 100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) DESC
    ) AS risk_rank
FROM customers
GROUP BY InternetService, Contract;

-- 6. Revenue at risk: total monthly revenue lost from churned customers (CTE)
WITH churned_customers AS (
    SELECT customerID, MonthlyCharges
    FROM customers
    WHERE Churn = 'Yes'
)
SELECT
    COUNT(*) AS churned_customers,
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk,
    ROUND(SUM(MonthlyCharges) * 12, 2) AS annualized_revenue_at_risk
FROM churned_customers;

-- 7. Payment method vs churn
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;
