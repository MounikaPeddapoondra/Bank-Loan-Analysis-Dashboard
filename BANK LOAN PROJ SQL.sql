create database project1;
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

