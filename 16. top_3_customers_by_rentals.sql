-- 16. find top 3 customers who have rented the most movies

select top 3 
	c.customer_id, 
	concat(c.first_name, ' ',  c.last_name) as customer_name, 
	count(r.film_id) as total_rentals
from customer c
join rental r on r.customer_id = c.customer_id
group by 
	c.customer_id, 
	concat(c.first_name, ' ',  c.last_name)
order by total_rentals desc;

