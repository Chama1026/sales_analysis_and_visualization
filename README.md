# Adventure Work Sales Performance and Marketing Analysis

## Project Overview

This project analyzes the sales, products, and customer data of a fictional company called Adventure Works Cycles in 2013. It is a manufacturing and retail company that specializes in outdoor products, such as bikes, cycling gear, clothing, and accessories. 

The main goals of this project are to create an interactive dashboard for the sales and marketing team of the company, and uncover actionable insights to drive the sales and help adjusting the company’s strategy. 

## Dataset

### Overview
- **Source**: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
- **Description**: AdventureWorks dataset contains data for a fictional outdoor product manufacturer and retailer - Adventure Works Cycles. The data are across various departments, including Manufacturing, Sales, Purchasing, Product Management, Contact Management, and Human Resources.
- **Size**: 9 modules, 71 tables

### Key Tables
- **Sales.SalesOrderHeader**: Store high level information of each sales order, such as total amount, order date etc.
- **Sales.SalesOrderDetail**: Store detail information of each sales order, such as item purchased, discount given etc.
- **Production.Product**: Store information of all products manufactured by the company.
- **Sales.Customer**: Store all customer information.
- **Sales.SalesPerson**: Store information of all salespeople.

## SQL Script

## Power BI Dashboard
### Sales Dashboard
![Sales overview](https://github.com/user-attachments/assets/91913850-8a1a-4c38-8189-426844226425)
#### Oberservation
- Sales revenue over-performed significantly compared to last year, except in January.
- Sales revemue in 2012 and 2013 both dipped in April, August, and November.
- Nearly all salespeople did not meet their sales target.
- The company has a strong presence in North America, Europe, and Australia. But sales activity is absent Asia, South America, and Africa.
- Bikes contributed 44.04% of revenue, while the rest spread across clothing, components, and accessories fairly evenly.

### Marketing Dashboard
![Adventure Work V2-2](https://github.com/user-attachments/assets/b25e8bb9-442f-4f3d-aed3-4cbe5f12e899)
#### Oberservation
- 8.73k out of 19.12k customers, or 45.66% of the customers, are new customers aquired in 2013. The new customer count jumped significantly compared to the past 2 years.
- 60.93% of customer did not return after first purchase and 28.63% of customer only made 2 purchase. This is consistent with the short customer lifespan (0.46 year).
- Only 24.22% of orders were online. It is noteworthy that retail sales revenue shared a very similar pattern with total revenue, with dips in April, August, and November, while online revenue is oberseved to be growing consistently.
- 71.72% of the customers are subscribed to the company's email list.
  
## Actionable Insights
