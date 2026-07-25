-- 27. Which movie(s) has been rented the most number of times?

select top 1 f.title, count(r.film_id) as rental_count -- added top 1 since only 1 movie has been rented that many times
from film f
join rental r on r.film_id = f.film_id
group by f.title
order by rental_count desc;
