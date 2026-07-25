-- 25. For all the films in the inventory, give the number of times they were rented out.

select f.film_id, f.title as film_title, count(r.film_id) as rental_count
from film f
left join rental r on r.film_id = f.film_id
group by f.film_id, f.title
order by rental_count desc;
