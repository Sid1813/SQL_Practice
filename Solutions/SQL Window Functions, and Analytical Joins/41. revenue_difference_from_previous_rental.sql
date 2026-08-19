-- 41. Difference in revenue compared to previous rental

select
	f.film_id,
	f.title,
	r.rental_date,
	(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as revenue,
	lag(coalesce(r.amount, 0) + coalesce(r.tax, 0)) over
	(partition by f.film_id
	order by r.rental_date) as previous_rental_revenue,

	(coalesce(r.amount, 0) + coalesce(r.tax, 0))
	-
	lag(coalesce(r.amount, 0) + coalesce(r.tax, 0)) 
	over (partition by f.film_id
		  order by r.rental_date) as difference_in_revenue
from film f
join rental r on r.film_id = f.film_id
