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
select MONTH_ID, round(sum(SALES),2) as Revenue, count(ORDERNUMBER) as Quantity
from sales_data_sample
where YEAR_ID = '2003'
group by MONTH_ID
order by Revenue desc

select MONTH_ID, round(sum(SALES),2) as Revenue, count(ORDERNUMBER) as Quantity
from sales_data_sample
where YEAR_ID = '2004'
group by MONTH_ID
order by Revenue desc

select MONTH_ID, round(sum(SALES),2) as Revenue, count(ORDERNUMBER) as Quantity
from sales_data_sample
where YEAR_ID = '2005'
group by MONTH_ID
order by Revenue desc

select * from dbo.sales_data_sample

-- November is the best month, what was the product sold?
select top 1 PRODUCTLINE, 
			MONTH_ID, 
			round(sum(SALES),2) as Revenue, 
			count(ORDERNUMBER) as Quantity
from sales_data_sample
where YEAR_ID = 2003 AND MONTH_ID = 11
group by PRODUCTLINE, MONTH_ID
order by Revenue desc
-- Classic Cars are the best-selling product in the month of november

-- Who is the best customer?
-- Recency, Frequency, Monetary Value (RFM). Last order date, count of total orders, total spend

drop table if exists #rfm;
with rfm as
	(select CUSTOMERNAME,
		sum(SALES) as Monetary_Value,
		round(avg(SALES),2) as Average_Sales,
		count(ORDERNUMBER) as Total_Orders,
		max(ORDERDATE) as Last_OrderDate,
		(select max(ORDERDATE) from sales_data_sample) as Max_OrderDate,
		datediff(DD, max(ORDERDATE), (select max(ORDERDATE) from sales_data_sample)) as Recency
	from sales_data_sample
	group by CUSTOMERNAME
),
rfm_calc as
	(select r.*,
		ntile(4) over (order by Recency desc) rfm_recency,
		ntile(4) over (order by Total_Orders) rfm_frequency,
		ntile(4) over (order by Monetary_Value) rfm_monetary
	from rfm r
)
select 
	c.*, rfm_recency + rfm_monetary + rfm_frequency as rfm_cell,
	cast(rfm_recency as varchar) + cast(rfm_monetary as varchar) + cast(rfm_frequency as varchar) as rfm_cell_string
into #rfm
from rfm_calc c

select CUSTOMERNAME, rfm_recency, rfm_monetary, rfm_frequency,
	case
		when rfm_cell_string in (111,112,121,122,123,132,211,212,114,141) then 'lost_customers'
		when rfm_cell_string in (133,134,143,244,334,343,344) then 'cannot_lose' --Big spenders, better not to lose
		when rfm_cell_string in (311,411,331) then 'new_customers'
		when rfm_cell_string in (222,223,233,322) then 'potential_churners'
		when rfm_cell_string in (323,333,321,422,332,432) then 'active' --Customers who buy often but at a low price point
		when rfm_cell_string in (433,434,443,444) then 'loyal'
	end rfm_Segment

from #rfm

-- What products are more often sold together?
select distinct ORDERNUMBER, stuff(

	(select ',' + PRODUCTCODE
	from sales_data_sample as p
	where ORDERNUMBER in 
		(
			select ORDERNUMBER 
			from (
				select ORDERNUMBER, count(*) as rn
				from sales_data_sample
				where status = 'Shipped'
				group by ORDERNUMBER
				) as m
			where rn = 2
		)
		and p.ORDERNUMBER = s.ORDERNUMBER
		for xml path ('')), 
		
		1, 1, '') as ProductCodes

from sales_data_sample as s
order by 2 desc