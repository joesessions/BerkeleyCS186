----use BerkeleyCrs
----select 
----	o.customer_id
----	, DATENAME(MONTH, order_date) AS [Month]
----	, sum(list_price) 
---- from sales.orders o
----inner join sales.order_items oi on oi.order_id=o.order_id 
----group by o.customer_id, Datename(month, order_date) 

--select Customer_ID
--	, [January]
--	, [February]
--	, [March]
--	,[April]
-- FROM
--(
--	select 
--	o.customer_id
--	, DATENAME(MONTH, order_date) AS [Month]
--	, oi.list_price
--	from sales.orders o
--	inner join sales.order_items oi on oi.order_id=o.order_id 
--) T
--PIVOT
--(
--	sum(list_price)
--	FOR [month] in (
--	[January], [February], [March], April)
--	) as Pvt

	--select --source table is every ITEM sold. Can be multiple items on one sale.
	--o.order_id
	--, o.customer_id
	--, month(order_date) mo_no
	--, DATENAME(MONTH, order_date) AS [Month]
	--, oi.list_price
	--from sales.orders o
	--inner join sales.order_items oi on oi.order_id=o.order_id 

select * -- [Month], [1], [2], [3], [4], [5], [6], [7], [11], [12], [13], [14], [15], [16], [17]  --main query columns give the output. * would select 
													--Cat1) everything in base table EXCEPT Cat2) and Cat3)  NOTE: These will also act as groupby columns
																	--ie. mo_no and Month
													--Cat2) The pivot aggregate function
													--Cat3) The spreading columns
 FROM
(
	select  --source table is every ITEM sold. Can be multiple items on one sale.
	 month(order_date) mo_no --Cat1
	, DATENAME(MONTH, order_date) AS [Month] --Cat1
	, oi.list_price -- Cat2 Aggregated value, ie. what values fill in the report
	, o.customer_id -- Cat3 spreading column, ie, what columns names are on top of the report
	from sales.orders o
	inner join sales.order_items oi on oi.order_id=o.order_id 
) T2
PIVOT
(
	sum(list_price) --Cat2
	FOR [Customer_Id] in ([1], [2], [3], [4], [5], [6], [7], [11], [12], [13], [14], [15], [16], [17] --Cat3
	)) as Pvt2 order by [mo_no]


