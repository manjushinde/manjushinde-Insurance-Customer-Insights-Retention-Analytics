# 📊 Insurance Customer Insights & Retention Analytics

![SQL](https://img.shields.io/badge/Tool-SQL-blue)  
![Excel](https://img.shields.io/badge/Tool-Excel-green)  
![Power BI](https://img.shields.io/badge/Tool-Power%20BI-yellow)

---

## 📌 Overview
This project delivers a **Customer Targeting Analytics Dashboard** to identify high-value customers and those at risk of policy expiry.  
Using **SQL** for data cleaning and integration, **Excel** for validation, and **Power BI** for visualization, it transforms fragmented datasets into actionable insights for targeted marketing and retention campaigns.

---

## 🎯 Problem Statement
The insurance company lacked a **centralized, visual, and interactive** system to monitor customer value and policy renewal risk.  
Existing reports were **manual, inconsistent, and incomplete**, making it difficult to:
- 🎯 Identify high-value customers with strong financial profiles  
- ⏳ Track policies nearing expiry to prevent churn  
- 📈 Analyze demographics and premium trends for targeted campaigns  

---

## 🎯 Objectives
- 📊 Build a unified dataset of all customers  
- 💰 Identify **high-value customers**  
- ⏳ Detect customers with **expiring policies**  
- 🗺 Segment customers by **demographics and premium category**  
- 🎯 Support **data-driven renewal and marketing strategies**  

---

## 📂 Dataset
- **Source:** Synthetic insurance dataset  
- **Key Fields:**  
  - Name, Gender, Occupation, DOB, Email, Mobile  
  - State, City, Tier, Pincode  
  - Income, CIBIL Score, Card Type  
  - Type of Insurance, Premium, Payment Frequency, Start & End Dates  

---

## 📋 Dataset Tables & Columns

**1. Personal Information Table**  
`PAN_no`, `name`, `gender`, `occupation`, `mobile`, `dob`, `email_id`  

**2. Demographic Information Table**  
`PAN_no`, `city_key`, `state`, `city_name`, `tier`, `pincode`  

**3. City Information Table**  
`city_key`, `city_name`, `tier`, `state`  

**4. Financial Information Table**  
`PAN_no`, `income`, `cibil_score`, `bank_account_number`, `card_type`  

**5. Insurance History Table**  
`PAN_no`, `type_of_insurance`, `premium`, `payment_frequency`, `insurance_start_date`, `insurance_end_date`  

---

## 🛠 Data Preparation
Data was cleaned and transformed in **SQL**:
- ✅ Standardized gender, pincode, and date formats  
- ✅ Mapped cities to states  
- ✅ Classified card type based on income & CIBIL score  
- ✅ Filled missing email IDs with placeholders  
- ✅ Merged all tables into a **final_information** dataset  

---

## 📊 Key Insights
- **Total Customers:** 5,715  
- **Total Premium Revenue:** ₹124M (₹12.4 crore)  
- **High-Value Customers:** 572  
- **High-Value Customers Expiring Soon:** 29 (5.07%)  
- **Largest Age Segment:** 25–44 years (~72%)  
- **Top State by Customers:** Maharashtra (33.7%)  
- **Most Profitable Insurance Type:** Motor Insurance  

---

## 💡 Recommendations
- 🎯 Target renewal campaigns at high-value customers nearing expiry  
- 📈 Focus marketing in top-performing states  
- 💳 Cross-sell products to high-income, high-CIBIL customers without certain insurance types  
- 🔄 Automate dashboard refresh for real-time monitoring  

---

## 📈 Tools & Technologies
- **Data Cleaning & Integration:** SQL  
- **Validation:** Excel  
- **Visualization:** Power BI  

---

## 📷 Dashboard Preview
### Dashboard 1 – Overall Customer Insights
<img width="1317" height="736" alt="Screenshot 2025-08-14 070142" src="https://github.com/user-attachments/assets/59f118f9-8227-4413-bf0a-f769e7d5a754" />


### Dashboard 2 – High Value Customer Retention
<img width="1313" height="732" alt="Screenshot 2025-08-14 071158" src="https://github.com/user-attachments/assets/0e6d025b-ca36-4311-aacc-f1b3f42d4b2d" />


---

## 🚀 How to Use
1. Load the dataset into SQL.  
2. Run the SQL scripts from the `/SQL` folder for cleaning and merging.  
3. Import the cleaned dataset into Power BI.  
4. Use dashboard filters to explore insights by **state, insurance type, and payment frequency**.

---

## 📜 License
This project is for educational purposes only.

