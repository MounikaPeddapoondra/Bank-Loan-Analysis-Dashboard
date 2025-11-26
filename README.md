# End-to-End Bank Loan Analysis & Visualization | SQL, Python, Power BI, Tableau,Excel
## Project Objective
The objective of this project is to analyze bank loan data to uncover meaningful insights that support risk management and financial decision-making. Using SQL, Python, Power BI, Tableau, and Excel, the project identifies repayment trends, evaluates loan status behavior, analyzes customer credit grades, and visualizes loan performance patterns to help stakeholders improve operational efficiency and minimize risk.

## Dataset used
- <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/Finance1td.csv">Dataset</a>
- <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/Finance2td.csv">Dataset</a>

## Questions(KPI'S)
- Year-wise loan amount distribution
- Grade and Sub-grade wise revolving balance comparison
- Verification status impact on total payments
- Home ownership vs last payment trends
- State and month-wise loan status analysis
- Interactive dashboards for business stakeholders

- Dashboard Interaction
 - Power BI <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/BANK%20LOAN%20PBI.jpg">View Dashboard</a>
 - EXCEL <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/BANK%20LOAN%20EXCEL.jpg">View Dashboard</a>
 - Tableau <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/bank%20loan%20tableau.jpg">View Dashboard</a>
 - SQL <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/BANK%20LOAN%20PROJ%20SQL.sql">View code</a>
 - python <a href="https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/Bank%20Loan%20Analysis%20project%20python.pdf">View Code</a>

## Project Process 
- Understood the business requirement to analyze loan performance and risk.
- Collected and explored loan datasets containing customer and payment details.
- Cleaned and prepared the data using SQL and Python (handled nulls, duplicates, format issues).
- Joined tables using a common key and extracted additional fields like year and month.
- Performed exploratory data analysis to understand trends and relationships.
- Identified key KPIs such as total loan amount, total payment, loan status, verification status, and grade performance.
- Loaded the processed data into Power BI and Tableau for visualization.
- Built interactive dashboards using bar charts, donut charts, tables, and slicers.
- Generated insights related to repayment trends, credit grades, and risk patterns.

## Dashboard

![Dashboard Screenshot](https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/BANK%20LOAN%20PBI.jpg?raw=true)
![Dashboard Screenshot](https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/BANK%20LOAN%20EXCEL.jpg?raw=true)
![Dashboard Screenshot](https://github.com/MounikaPeddapoondra/Bank-Loan-Analysis-Dashboard/blob/main/bank%20loan%20tableau.jpg?raw=true)
![code](create database project1;
USE project1;
select * from finance1vd;
select * from finance2cd;
/*
1.Year wise loan amount Stats
2. Grade and sub grade wise revol_bal
3.Total Payment for Verified Status Vs Total Payment for Non Verified Status
4.State wise and month wise loan status
5. Home ownership Vs last payment date stats.
*/

# KPI 1(YEAR WISE LOAN AMOUNT STATS)
select Year (Issue_d) as Loan_Year,sum(loan_amnt) as Total_loan_amnt
from finance1vd
group by Loan_year
order by Loan_year;


#KPI 2(GRADE AND SUB_GRADE WISE REVOL_BAL)
select grade ,sub_grade , sum(revol_bal) as total_revol_bal
from finance1vd inner join finance2cd
on(finance1vd.id = finance2cd.id)
group by grade , sub_grade
order by grade , sub_grade;

#KPI-3(TOTAL PAYMENT FOR VERIFIED STATS VS TOTAL PAYMENT FOR NON VERIFIED STATS)
select verification_status, round(sum(total_pymnt),2) as total_payment
from finance1vd inner join finance2cd
on(finance1vd.id = finance2cd.id)
group by verification_status;

#KPI-4(STATE WISE AND MONTH WISE LOAN STATUS)
SELECT addr_state, Month (Issue_D) as Month_of_issue_d,sum(loan_amnt) as Total_loan_amnt , loan_status
from finance1vd inner join finance2cd
on(finance1vd.id = finance2cd.id)
group by addr_state, Month_of_issue_d , loan_status
order by addr_state , loan_status;

# KPI 5 ( HOME OWNERRSHIP VS LAST PAYMENT DATE STATS)
select home_ownership , Last_pymnt_d, CONCAT('$' , FORMAT(ROUND(SUM(last_pymnt_amnt)/10000,2),2), 'k') as total_payment
from finance1vd INNER JOIN finance2cd on finance1vd.id = finance2cd.id group by home_ownership, last_pymnt_d order by
last_pymnt_d desc , home_ownership desc;



## Project Insights
- Fully Paid loans contribute the highest share in total payments.
- Loan amounts increased significantly between 2009–2011.
- Verified customers show better repayment performance.
- Higher credit grades have higher revolving balance values.
- Some states show more Charged-Off loans, indicating risk.

## Final Conclusion
This project helps banks understand loan behavior, manage risks, and make better financial decisions. It provides a clear view of how loans are performing across different years, states, verification types, and credit grades.
