select * from BikeStores.production.brands
select * from BikeStores.production.categories
select * from BikeStores.production.products
select * from BikeStores.production.stocks
select * from BikeStores.sales.customers
select * from BikeStores.sales.order_items
select * from BikeStores.sales.orders
select * from BikeStores.sales.staffs
select * from BikeStores.sales.stores

-- Sales volume and total revenue generated
select ord.order_id, 
	CONCAT(cus.first_name,' ', cus.last_name) as full_name, 
	cus.city, 
	cus.state, 
	ord.order_date,
	SUM(ite.quantity) as 'total_units',
	SUM(ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name) as full_name_staff
from sales.orders ord
join sales.customers cus on ord.customer_id = cus.customer_id
join sales.order_items ite on ord.order_id = ite.order_id
join production.products pro on ite.product_id = pro.product_id
join production.categories cat on pro.category_id = cat.category_id
join sales.stores sto on ord.store_id = sto.store_id
join sales.staffs sta on ord.staff_id = sta.staff_id
group by ord.order_id, CONCAT(cus.first_name,' ', cus.last_name), cus.city, cus.state, ord.order_date,
	pro.product_name, cat.category_name, sto.store_name, CONCAT(sta.first_name,' ', sta.last_name)

use BikeStores