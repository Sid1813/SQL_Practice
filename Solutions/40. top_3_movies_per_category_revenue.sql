-- 40. List the top 3 movies in each category based on total revenue.

with revenue_cte as
(
	select f.film_id, f.title, f.category, sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as total_revenue,
	dense_rank() over 
				(partition by f.category
			     order by sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) desc,
				 f.film_id asc) as category_rank_by_revenue
	from film f
	join rental r on r.film_id = f.film_id
	group by f.film_id, f.title, f.category
)
select *
from revenue_cte
where category_rank_by_revenue <= 3
