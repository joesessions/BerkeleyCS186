Select stuff( (select ',' + brand_name
			from production.brands b
			for xml path ('')
			), 1, 1,''
			);

			select ',' + bname 
			from boats b
			for xml path('');
			
			
