create database portfolioproject;
use portfolioproject;

select * from bankchurners;

/* Predict customer churns */

-- Number of men and females in existing customers
select SUM(IF(Gender='M',1,null)) as MaleExistingCustomers, SUM(IF(Gender='F',1,null)) as FemaleExistingCustomers
from bankchurners where Attrition_Flag = 'Existing Customer';

-- Number of men and females in attrited customers
select SUM(IF(Gender='M',1,null)) as MaleAttritedCustomers, SUM(IF(Gender='F',1,null)) as FemaleAttritedCustomers
from bankchurners where Attrition_Flag = 'Attrited Customer';

/* 
-The possibility of a female customer attriting is higher than that of males customers 
*/

-- Distribution of Attrited customers based on age groups
select case when Customer_Age < 20 then '0-20' 
			when Customer_Age between 20 and 30 then '20-30' 
            when Customer_Age between 30 and 40 then '30-40' 
            when Customer_Age between 40 and 50 then '40-50'
            when Customer_Age between 50 and 60 then '50-60'
            when Customer_Age between 60 and 70 then '60-70'
            when Customer_Age between 70 and 80 then '70-80'
            when Customer_Age > 80 then 'Above 80'
		end as Age_Group,
        COUNT(*) from bankchurners
        where Attrition_flag = 'Attrited Customer' group by Age_Group order by Age_Group;

-- Distribution of customers as per Education level
select Education_Level, COUNT(*)
from bankchurners
where Attrition_Flag in ('Attrited Customer')
group by Education_Level
order by COUNT(*) desc;

select case when Education_Level = 'Graduate' then 'Graduate' 
			when Education_Level = 'High School' then 'High School' 
            when Education_Level = 'Unknown' then 'Unknown' 
            when Education_Level = 'Uneducated' then 'Uneducated' 
            when Education_Level = 'College' then 'College' 
            when Education_Level = 'Doctorate' then 'Doctorate' 
            when Education_Level = 'Post-Graduate' then 'Post-Graduate' 
		end as Education_Level,
        case
			when Attrition_Flag = 'Existing Customer' then 'Existing Customer'
			when Attrition_Flag = 'Attrited Customer' then 'Attrited Customer'
		end as Attrition_Status,
        COUNT(*) as Count from bankchurners
        group by Attrition_Status, Education_Level order by Education_Level, Attrition_Status;

-- Distribution of customers as per Marital Status
select Marital_Status, COUNT(*)
from bankchurners
where Attrition_Flag in ('Attrited Customer')
group by Marital_Status
order by COUNT(*) desc;

-- Distribution of customers as per Income Category
select Income_Category, COUNT(*)
from bankchurners
where Attrition_Flag in ('Attrited Customer', 'Existing Customer')
group by Income_Category
order by Income_Category;

-- Distribution as per Inactive Months
select Months_Inactive_12_mon, COUNT(*)
from bankchurners
where Attrition_Flag in ('Attrited Customer')
group by Months_Inactive_12_mon
order by Months_Inactive_12_mon;

-- Distribution as per Months on books
-- Relationship with the bank
select case when Months_on_book < 20 then '0-20' 
			when Months_on_book between 20 and 30 then '20-30' 
            when Months_on_book between 30 and 40 then '30-40' 
            when Months_on_book between 40 and 50 then '40-50' 
            when Months_on_book between 50 and 60 then '50-60' 
            when Months_on_book > 60 then 'Above 60' 
		end as Monthbook_Range,
        case
			when Attrition_Flag = 'Existing Customer' then 'Existing Customer'
			when Attrition_Flag = 'Attrited Customer' then 'Attrited Customer'
		end as Attrition_Status,
        COUNT(*) as Count from bankchurners
        group by Attrition_Status, Monthbook_Range order by Monthbook_Range;

/* 
- We can conclude looking at this queries that the bank need to concentrate on customer between 40 and 60 years old as are the ones that usually churn
- As per the education level we can see the highest attrition level in the 
Doctorate customers with a 26.69% in relation to existing clients, followed by post-graduates.
The more educated the customer the bigger the risk of customers churning.
- The % of customers attriting is the highest in the 30-40 months on book range. 
The bank should concentrate in offering better services to the range 20-50 month's customers.
   */

select distinct Attrition_Flag from bankchurners;
select distinct Education_Level from bankchurners;
select distinct Marital_Status from bankchurners;
select distinct Income_Category from bankchurners;