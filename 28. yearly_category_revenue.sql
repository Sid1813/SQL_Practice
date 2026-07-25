-- 28. Compute the total revenue for each movie category for every year.

select f.category, datepart(year, r.rental_date) as rental_year, sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as total_revenue
from film f
join rental r on r.film_id = f.film_id
group by f.category, datepart(year, r.rental_date)
order by rental_year asc, total_revenue desc;
