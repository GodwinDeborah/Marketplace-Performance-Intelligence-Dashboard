# Business Requirements Document (BRD)

# Marketplace Performance Intelligence Dashboard

# Project Overview

The Marketplace Performance Intelligence Dashboard is an end-to-end Business Intelligence solution developed using SQL Server and Power BI.

The solution analyzes approximately 197,000 marketplace orders to provide decision-makers with insights into marketplace performance, restaurant effectiveness, menu performance, geographic opportunities, and overall marketplace health.

The project follows a modern BI workflow consisting of data ingestion, transformation, dimensional modeling, business analysis, and interactive dashboard development.

---

# Business Problem

Restaurant marketplace operators require timely and accurate insights to understand marketplace performance and identify opportunities for operational improvement.

Existing operational data contains valuable information but does not provide a centralized view of:

- Revenue performance
- Customer demand
- Restaurant effectiveness
- Menu performance
- Geographic trends
- Marketplace concentration
- Customer satisfaction

Decision-makers need an interactive solution capable of transforming raw transactional data into actionable business intelligence.

---

# Business Objectives

The dashboard aims to:

- Monitor overall marketplace performance.
- Evaluate restaurant performance.
- Analyze menu effectiveness.
- Identify geographic opportunities.
- Assess marketplace health.
- Support strategic business decision-making.

---

# Project Scope

## Included

- SQL Server staging and production tables
- Data quality validation
- Star schema data model
- DAX measures
- Interactive Power BI dashboard
- Five analytical report pages
- Global synchronized slicers
- Custom report page tooltips
- Executive KPI reporting

## Excluded

- Predictive analytics
- Machine learning
- Real-time streaming data
- Automated data refresh
- External API integration

---

# Stakeholders

Primary stakeholders include:

- Executive Management
- Operations Managers
- Regional Managers
- Restaurant Partnership Team
- Business Analysts

---

# Data Source

Dataset:

Restaurant marketplace transactional data containing approximately 197,000 customer orders.

Key business entities include:

- Orders
- Restaurants
- Dishes
- Categories
- Locations
- Dates

---

# Functional Requirements

The dashboard must allow users to:

- Filter data using global slicers.
- Analyze marketplace performance.
- Compare restaurant performance.
- Analyze menu performance.
- Evaluate geographic performance.
- Monitor marketplace health.
- View KPI summaries.
- Interact with charts and tooltips.

---

# Dashboard Pages

## Executive Overview

Purpose:

Provide a high-level summary of marketplace performance.

KPIs:

- Revenue
- Orders
- Average Order Value
- Average Rating

Visuals:

- Revenue Trend
- Orders Trend
- Category Revenue
- Rating Distribution

---

## Restaurant Performance

Purpose:

Evaluate restaurant effectiveness.

KPIs:

- Revenue
- Orders
- Average Rating
- Restaurants

Visuals:

- Top Restaurants
- Restaurant Performance Matrix
- Revenue Contribution
- Restaurant Performance Table

---

## Menu Performance

Purpose:

Understand menu effectiveness.

KPIs:

- Revenue
- Orders
- Average Rating
- Dishes

Visuals:

- Top Categories
- Top Dishes
- Category Performance Matrix
- Menu Performance Table

---

## Geographic Performance

Purpose:

Identify regional performance patterns.

KPIs:

- Revenue
- Orders
- Average Rating
- Cities

Visuals:

- Revenue by City
- Orders by City
- City Performance Matrix
- Geographic Performance Table

---

## Marketplace Health

Purpose:

Assess the long-term health of the marketplace.

KPIs:

- Top 10 Share
- Restaurants
- Categories
- Avg Rating

Visuals:

- Revenue Concentration
- Rating Distribution
- Category Diversity
- Top 10 Restaurants by Revenue

---

# Data Model

The solution uses a Star Schema.

Fact Table

- fact_swiggy_orders

Dimension Tables

- dim_date
- dim_restaurant
- dim_category
- dim_location
- dim_dish

The dimensional model improves query performance and simplifies analytical reporting.

---

# ETL Process

The data pipeline follows the process below:

CSV Dataset

↓

Staging Table

↓

Production Fact Table

↓

Dimension Tables

↓

Power BI Data Model

This approach preserves the raw source data while ensuring production-ready datasets for reporting.

---

# Business Questions

The dashboard answers the following business questions:

### Executive Overview

- How is the marketplace performing?

### Restaurant Performance

- Which restaurants generate the most revenue?
- Which restaurants receive the highest ratings?

### Menu Performance

- Which menu categories drive revenue?
- Which dishes perform best?

### Geographic Performance

- Which cities contribute the most revenue?
- Which regions demonstrate strong customer satisfaction?

### Marketplace Health

- Is revenue concentrated among a few restaurants?
- Is customer demand diversified across categories?
- What is the overall health of the marketplace?

---

# Success Criteria

The project is considered successful if users can:

- Monitor marketplace KPIs.
- Identify top-performing restaurants.
- Analyze customer demand.
- Evaluate menu performance.
- Compare geographic markets.
- Assess marketplace concentration.
- Make data-driven business decisions.

---

# Technology Stack

Database

- SQL Server

Data Modeling

- Star Schema

Visualization

- Power BI

Analytics

- DAX

Version Control

- Git & GitHub

---

# Deliverables

- SQL scripts
- ETL pipeline
- Star schema
- DAX calculations
- Power BI dashboard (.pbix)
- Dashboard screenshots
- Business documentation
- GitHub repository

---

# Future Enhancements

Potential future improvements include:

- Profitability analysis
- Customer segmentation
- Time intelligence (MoM, QoQ, YoY)
- Forecasting
- Predictive analytics
- Automated data refresh
- Power BI Service deployment

---

# Conclusion

The Marketplace Performance Intelligence Dashboard provides an end-to-end Business Intelligence solution that transforms raw marketplace transaction data into actionable insights.

By integrating SQL Server, dimensional modeling, DAX, and Power BI, the solution enables stakeholders to monitor marketplace performance, evaluate restaurant effectiveness, identify geographic opportunities, and support strategic decision-making through an interactive analytics platform.
