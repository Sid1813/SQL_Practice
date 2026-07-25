-- 31. Identify movies that have been rented by customers from more than 3 different countries. 
--     Return the movie title and the number of unique countries

select f.title, count(distinct(c.country)) as count_unique_countries
from film f
join rental r on r.film_id = f.film_id
join customer c on c.customer_id = r.customer_id
group by f.title
having count(distinct(c.country)) > 3
order by count_unique_countries desc
