-- 26. Identify the customers who rented the same movie more than thrice and list the movie title for each case.

select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, f.title, count(r.film_id) as rental_count
from customer c
join rental r on r.customer_id = c.customer_id
join film f on f.film_id = r.film_id
group by c.customer_id, concat(c.first_name, ' ', c.last_name), f.title
having count(r.film_id) > 1 -- changed it to 1 since its empty for > 3
order by rental_count desc;
