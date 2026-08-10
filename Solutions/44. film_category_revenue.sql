--   For each movie, calculate the percentage of total category revenue contributed by that movie.

select f.film_id,
	   f.title, 
	   f.category,
	   sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as film_revenue,
	   sum(sum(coalesce(r.amount, 0) + coalesce(r.tax, 0))) over (partition by category) as category_revenue,
	   round((sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) * 100)/
	   sum(sum(coalesce(r.amount, 0) + coalesce(r.tax, 0))) over (partition by category), 2) as percentage_revenue_contribution_of_film_to_category
from film f
join rental r on r.film_id = f.film_id
group by f.film_id, f.title, f.category
order by percentage_revenue_contribution_of_film_to_category desc

-- Alternate way to do the same using CTE : (This solution is better and easier to understand)

with fr as (
    select f.film_id,
        f.title, 
        f.category,
        sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as film_revenue
    from film f
    join rental r on r.film_id = f.film_id
    group by f.film_id, f.title, f.category
)

select film_id,
       title, 
       category,
       film_revenue,
	   sum(film_revenue) over (partition by category) as category_revenue,
	   round(film_revenue * 100/
	   (sum(film_revenue) over (partition by category)), 2) as percentage_revenue_contribution_of_film_to_category

from fr

order by percentage_revenue_contribution_of_film_to_category desc