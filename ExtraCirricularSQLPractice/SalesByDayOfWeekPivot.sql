--item sales by day of the week.  Days across the top.
use BerkeleyCrs
--select datepart(dw,order_date), oi.quantity from sales.orders o
--left join sales.order_items oi on o.order_id = oi.order_id

--Select * from (
--select DATENAME(weekday,datepart(dw,order_date)-2) WeekdayNumber, oi.quantity from sales.orders o
--left join sales.order_items oi on o.order_id = oi.order_id) src
--PIVOT
--(sum (quantity)
--for WeekdayNumber in ([Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday])) pvt

--select datename(weekday,1-2)

--product sales by portion of the alphabet (across the top), year down the side. 
select 'a-g' as Segment, p.product_name, o.order_date
from production.products p
left join sales.order_items oi on p.product_id = oi.product_id
left join sales.orders o on p.product_id = oi.product_id
where substring(p.product_name, 1, 1) >= 'a' and  substring(p.product_name, 1, 1) <= 'g'
union
select 'h-m'  as Segment, p.product_name, o.order_date
from production.products p
left join sales.order_items oi on p.product_id = oi.product_id
left join sales.orders o on p.product_id = oi.product_id
where substring(p.product_name, 1, 1) >= 'h' and  substring(p.product_name, 1, 1) <= 'm'
union 
select 'n-s' as Segment, p.product_name, o.order_date
from production.products p
left join sales.order_items oi on p.product_id = oi.product_id
left join sales.orders o on p.product_id = oi.product_id
where substring(p.product_name, 1, 1) >= 'n' and  substring(p.product_name, 1, 1) <= 's'
union
select 't-z' as Segment, p.product_name, o.order_date
from production.products p
left join sales.order_items oi on p.product_id = oi.product_id
left join sales.orders o on p.product_id = oi.product_id
where substring(p.product_name, 1, 1) >= 't' and  substring(p.product_name, 1, 1) <= 'z'
