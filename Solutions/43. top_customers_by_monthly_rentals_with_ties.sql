– 44. Same as above but returns all customers tied for the highest number of rentals in each month

with rentals_per_month_cte as (
	select datepart(year, rental_date) as rental_year,
		   datepart(month, rental_date) as rental_month,
		   customer_id,
	count(*) as rental_count,
	dense_rank() over (
			partition by datepart(year, rental_date),
			             datepart(month, rental_date)
			order by count(*) desc) rn
	from rental
	group by datepart(year, rental_date),
			 datepart(month, rental_date),
			 customer_id
	)
select rc.customer_id,
	   concat(c.first_name, ' ', c.last_name) as full_name,
	   rc.rental_year,
	   rc.rental_month,
	   rc.rental_count
from rentals_per_month_cte rc
join customer c on rc.customer_id = c.customer_id

where rc.rn = 1

order by rental_year desc,
		 rental_month desc,
		 rental_count desc
