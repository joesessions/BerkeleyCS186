--item sales by day of the week.  Days across the top.
use BerkeleyCrs
select datepart(dw,order_date), oi.quantity from sales.orders o
left join sales.order_items oi on o.order_id = oi.order_id

Select * from (
select DATENAME(weekday,datepart(dw,order_date)-2) WeekdayNumber, oi.quantity from sales.orders o
left join sales.order_items oi on o.order_id = oi.order_id) src
PIVOT
(sum (quantity)
for WeekdayNumber in ([Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday])) pvt

--select datename(weekday,1-2)