select * from dbo.sales_data_sample

-- Sales by product line
select PRODUCTLINE, round(sum(SALES),2) as Revenue
from sales_data_sample
group by PRODUCTLINE
order by Revenue desc

-- Sales by year
select YEAR_ID, round(sum(SALES),2) as Revenue
from sales_data_sample
group by YEAR_ID
order by Revenue desc

-- Sales by Size
select DEALSIZE, round(sum(SALES),2) as Revenue
from sales_data_sample
group by DEALSIZE
order by Revenue desc

-- What was the best month for sales in an specific year and what was the quantity?
select MONTH_ID, round(sum(SALES),2) as Revenue, count(ORDERNUMBER) Quantity
from sales_data_sample
where YEAR_ID = '2003'
group by MONTH_ID
order by Revenue desc

select MONTH_ID, round(sum(SALES),2) as Revenue, count(ORDERNUMBER) Quantity
from sales_data_sample
where YEAR_ID = '2004'
group by MONTH_ID
order by Revenue desc

select MONTH_ID, round(sum(SALES),2) as Revenue, count(ORDERNUMBER) Quantity
from sales_data_sample
where YEAR_ID = '2005'
group by MONTH_ID
order by Revenue desc