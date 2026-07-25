-- 11. What is the total revenue generated from film rentals per year

select 
	year(rental_date) as rental_year,
	sum(coalesce(amount, 0) + coalesce(tax, 0)) as total_revenue_generated
from rental
group by year(rental_date)
order by rental_year asc, total_revenue_generated desc;
