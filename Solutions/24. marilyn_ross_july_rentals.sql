-- 24. What movies did customer Marilyn Ross rent in July?

select distinct f.title
from film f
join rental r on r.film_id = f.film_id
join customer c on c.customer_id = r.customer_id
where concat(c.first_name, ' ', c.last_name) = 'Marilyn Ross' and
datepart(month, r.rental_date) = 7;
