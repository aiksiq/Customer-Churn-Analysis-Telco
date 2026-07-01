import streamlit as st
import pandas as pd
import plotly.express as px

df = pd.read_csv('data/processed/telco_clean.csv')

st.title('Telco Customer Churn Dashboard')

col1, col2, col3 = st.columns(3)
col1.metric("Total Customers", len(df))
col2.metric("Churn Rate", f"{(df['Churn']=='Yes').mean()*100:.1f}%")
col3.metric("Revenue at Risk", f"${df[df['Churn']=='Yes']['MonthlyCharges'].sum():,.0f}/mo")

fig = px.histogram(df, x='Contract', color='Churn', barmode='group', title='Churn by Contract Type')
st.plotly_chart(fig)

fig2 = px.histogram(df, x='tenure', color='Churn', title='Tenure Distribution')
st.plotly_chart(fig2)