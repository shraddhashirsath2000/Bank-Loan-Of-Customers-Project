Create database bank;
use bank;
select * from finance_1;
select count(*) from finance_1;
select * from finance_2;
select count(*) from finance_2;

## Year wise loan amount Stats
select year(issue_D) as Year_of_issue_D , sum(loan_amnt) as 'Total loan amount'
from finance_1
group by Year_of_issue_D
order by Year_of_issue_D;

### Grade and sub grade wise revol_bal
select 
grade ,sub_grade , sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id=finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;

### Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status, 
concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_payment
from finance_1 inner join finance_2
on(finance_1.id=finance_2.id)
group by verification_status ;

### State wise and last_credit_pull_d wise loan status
select addr_State, last_credit_pull_d , loan_status
from finance_1 inner join finance_2
on(finance_1.id=finance_2.id)
group by addr_State, last_credit_pull_d , loan_status
order by addr_State;

### Home ownership Vs last payment date stats
select
home_ownership, last_pymnt_d,
concat(format(round(sum(last_pymnt_amnt)/10000,2),2),"K") as Total_amount
from finance_1
inner join finance_2 
on
finance_1.id=finance_2.id
group by home_ownership ,last_pymnt_d
order by last_pymnt_d desc, home_ownership desc;