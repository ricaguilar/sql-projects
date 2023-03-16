--Are the revenues growing?
with hotels as (
	select * from dbo.['2018$']
	union
	select * from dbo.['2019$']
	union
	select * from dbo.['2020$'])

select arrival_date_year, hotel,
	round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr),2) as revenue
from hotels
group by arrival_date_year, hotel

--Join the other tables
with hotels as (
	select * from dbo.['2018$']
	union
	select * from dbo.['2019$']
	union
	select * from dbo.['2020$'])

select * from hotels
join dbo.market_segment$ on hotels.market_segment = market_segment$.market_segment

use Project