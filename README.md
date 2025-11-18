# 📊 Data-Driven Marketing Performance Analysis: Optimizing Ad Spend for a B2C E-commerce Platform

## 💡 Project Overview
This project addresses the challenge faced by an **e-commerce B2C company** in efficiently allocating its multi-channel marketing budget. By calculating key performance indicators (KPIs) like **ROAS (Return on Ad Spend)** and **Conversion Rate**, I created an interactive dashboard that provides a clear, data-driven view of campaign and channel effectiveness. The solution enables the marketing team to quickly identify high and underperforming areas, allowing for **data-driven budget adjustments** for better overall returns.

---

## 🔎 Key Findings & Results
The analysis provides actionable insights for optimizing marketing spend, addressing key questions from the marketing team:

* **Email Marketing Dominance:** The **Email channel** delivers the highest performance, accounting for **40.90% of total ROAS** and the highest **Conversion Rate (12.43%)**.
* **Target Audience Efficiency:** Performance metrics (ROAS & Conversion Rate) differ significantly across the **four audience segments** (e.g., Premium, New Users, Inactive, etc) and by channel, indicating specific opportunities to tailor campaigns for maximum return.
* **Continuous Revenue Growth:** **Revenue Over Time** showed a general **upward trend** over the analyzed period, peaking at approximately **$11.9 million**.

---

## 📑 Dataset & Sources
* **Source:** Edited Marketing Performance Dataset from an external source (Kaggle).
* **Business Domain:** B2C E-commerce / Multi-channel Marketing.
* **Key Features/Variables:** The source table contains metrics across four channels (App, Social, Email, SMS) and nine distinct marketing campaigns.

---

## 💻 Technologies Used
| Category | Tool | Description |
| :--- | :--- | :--- |
| **Data Processing** | SQL | Used for data aggregation, processing, and calculating KPIs (ROAS, Conversion Rate). |
| **Visualization** | Tableau | Used to build the interactive dashboard for performance insights. |
| **Environment** | Data Analytics Bootcamp | Final project |

---

## ⚙️ Project Structure & Key Files

### SQL Analysis (`marketing_kpi_calculation.sql`)
The SQL script processes the raw data to create the foundation for the dashboard.
* **Core Logic:** The script creates a new table (`new_roas`) to calculate and evaluate ROAS and then uses `GROUP BY` statements to aggregate and calculate all necessary KPIs (ROAS, Click-Through Rate, Conversion Rate) across dimensions like **Channel**, **Campaign Name**, and **Target Audience**.
* **Output:** The final `SELECT` statements provide aggregated datasets grouped by `DATE` to enable all time-series visualizations in Tableau.

### Visualizations
Below are key views from the interactive Tableau Dashboard:

Visualization | Description | File Name |
| :--- | :--- | :--- |
| **Overview Tab** | **Executive Summary:** Displays key engagement metrics and tracks **Revenue Over Time**, providing a high-level view of the project's time frame and total value. | `Marketing_dashboard_1_overview_tab.png` |
| **Campaigns Tab** | **Campaigns Performance:** Analyzes **ROAS trends** over time and provides a direct bar chart comparison of **Conversion Rate** and **ROAS** for all nine individual campaigns. | `Marketing_dashboard_1_campaigns_tab.png` |
| **Channels Tab** | **Channel Performance:** Clearly compares the total **ROAS** and **Conversion Rate** across the four marketing channels (Email, Social, SMS, App) and shows the historical ROAS trend. | `Marketing_dashboard_1_channels_tab.png` |
| **Target Audience Tab** | **Audience Insights:** Provides a detailed breakdown of **Conversion Rate by Channel** and **ROAS by Channel** for all defined audience segments, guiding highly specific budget allocation decisions. | `Marketing_dashboard_1_audience_tab.png` |

---

## 🔗 Live Dashboard & Code

* **Interactive Dashboard:** https://public.tableau.com/app/profile/lana.sheina/viz/MarketingPerformanceDashboardforE-CommerceCompany/Campaigns****
* **SQL Code:** The processed data used for the dashboard is found in the SQL script: `marketing_kpi_calculation.sql`

---

## 📧 Contact
* **Email:** lana.sheina93@gmail.com
* **LinkedIn:** https://www.linkedin.com/in/svitlana-sheina/
