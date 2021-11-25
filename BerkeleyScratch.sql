SELECT top 3 * FROM production.products
SELECT TOP 10 * FROM production.categories

DECLARE @columns NVARCHAR(MAX) = '';
SELECT @COLUMNS +=  '[' + category_name + '],'   --QUOTENAME(category_name) + ','
from production.categories
order by category_name;


SELECT * FROM(
SELECT
	CATEGORY_nAME,
	product_id
from
	production.products p
	inner join production.categories c
		ON c.category_id = p.category_id
) T
PIVOT (
COUNT(product_id)
FOR category_name IN 
) AS PIVOT_TABLE

select Quotename('category_name')

set @columns = left(@columns, len(@columns)-1)
select @columns


--(
--[Children Bicycles]
--,[Comfort Bicycles]
--,[Cruisers Bicycles]
--,[Cyclocross Bicycles]
--,[Electric Bikes]
--,[Mountain Bikes]
--,[Road Bikes])