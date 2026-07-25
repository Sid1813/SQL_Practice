-- 23. Which categories have generated the highest & lowest revenue? 

select 'Highest' as revenue, f.category, f.revenue
from (select top 1 f1.category, sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as revenue
	  from film f1
	  join rental r on r.film_id = f1.film_id
	  group by f1.category
	  order by revenue desc) f 

union all

select 'Lowest' as revenue, g.category, g.revenue
from (select top 1 g1.category, sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as revenue
	  from film g1
	  join rental r on r.film_id = g1.film_id
	  group by g1.category
	  order by revenue asc) g
