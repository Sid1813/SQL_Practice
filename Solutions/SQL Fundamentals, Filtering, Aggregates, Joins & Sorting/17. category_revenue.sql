-- 17. total revenue generated for each movie category

select f.category, sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as total_revenue_generated
from film f
join rental r on r.film_id = f.film_id
group by f.category
order by total_revenue_generated desc;

