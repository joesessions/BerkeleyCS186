--use BerkeleyCrs
--select c.first_name, c.last_name, count(c.first_name)
--from sales.customers c
--inner join sales.orders o on c.customer_id = o.customer_id
--inner join sales.order_items oi on oi.order_id = o.order_id
--group by c.first_name, c.last_name
--having count(c.first_name) > 8

-- purchases by customer by month. Customers across the top. 
--Select * from (
--select  c.last_name, Month(o.order_date) MonthNo, 1 as sales
--from sales.customers c
--inner join sales.orders o on c.customer_id = o.customer_id
--inner join sales.order_items oi on oi.order_id = o.order_id
--inner join production.products p on oi.product_id = p.product_id
----where last_name in ('Alvarez', 'Hahn', 'Larsen','Hodges', 'Home') 

----order by c.last_name
--) as Src
--PIVOT
--(count(sales)
--for [last_name] in ([Alvarez], [Hahn], [Larsen],[Hodges], [Home])) pvt


--number of mtb per company.  Co name across the top.
select * from (
select p.product_name , brand_name
from production.products p
inner join production.categories c on c.category_id = p.category_id
inner join production.brands b on b.brand_id = p.brand_id
where category_name = 'Mountain Bikes') src
PIVOT
(count(product_name)
for [brand_name] in ([Trek], [Ritchey], [Surly], [Sun Bicycles], [Haro], [Heller])) pvt

