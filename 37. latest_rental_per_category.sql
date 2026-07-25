-- 37. For each category, find the most recently rented movie with its rental date and customer name.

select sq.category, 
       sq.title,
	   sq.rental_date,
	   sq.customer_id,
	   sq.customer_name
from ( select f.category,
              f.title,
			  r.rental_date,
			  c.customer_id,
			  concat(c.first_name, ' ', c.last_name) as customer_name,
	   row_number() over (partition by f.category
	                    order by rental_date desc) rn
	   from film f
	   join rental r on r.film_id = f.film_id
	   join customer c on c.customer_id = r.customer_id
	   ) sq
where rn = 1
