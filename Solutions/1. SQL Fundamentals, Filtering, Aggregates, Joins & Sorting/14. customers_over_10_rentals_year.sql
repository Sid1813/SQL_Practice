-- 14. who are the customers have rented more than 10 films in a year?

select 
	c.customer_id, 
	concat(c.first_name, ' ',  c.last_name) as customer_name, 
	datepart(year, r.rental_date) as rental_year,
	count(r.film_id) as rental_count
from customer c
join rental r on r.customer_id = c.customer_id
group by 
	c.customer_id, 
	concat(c.first_name, ' ',  c.last_name),
	datepart(year, r.rental_date)
having count(r.film_id) > 10
order by rental_count desc;

