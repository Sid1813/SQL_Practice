-- 39. For each movie, calculate the running total of revenue and order the movies by rental date.

select f.film_id, f.title, r.rental_date,
	   (coalesce(r.amount, 0) + coalesce(r.tax, 0)) as revenue,
	   sum(coalesce(r.amount, 0) + (coalesce(r.tax, 0)))
	   over (partition by f.film_id
			 order by r.rental_date) as running_total_revenue
from rental r
join film f on f.film_id = r.film_id
