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
select film_id,  -- You can also write select * but mentioning all columns to select is a better coding practice
       title,
       category,
       total_film_revenue,
       revenue_rank
from revenue_cte
where category_rank_by_revenue <= 3


-- Solution for the same problem as above using 2 CTEs


with revenue_cte as (select f.film_id, -- This CTE is to find the revenue of all films by coalescing the amount earned by each film across all its rentals
    f.title, 
    f.category,
    sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as total_film_revenue
from film f
join rental r on r.film_id = f.film_id
group by f.film_id, 
    f.title, 
    f.category),

revenue_ranks as ( -- This CTE is to rank all the films by total revenue ( amont + tax) in descending order, by category

select f.film_id, 
    f.title, 
    f.category,
    sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as total_film_revenue,
    dense_rank() over (
partition by f.category order by sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) desc) as revenue_rank
from film f
join rental r on r.film_id = f.film_id
group by f.film_id, 
    f.title, 
    f.category
)

select film_id, -- Final select statement to fimnd top 3 highest revenue films by category
       title,
       category,
       total_film_revenue,
       revenue_rank
from revenue_ranks
where revenue_rank <= 3
