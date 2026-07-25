-- 29. Find the top 5 longest movies (by runtime) that have never been rented.
	
select top 5 f.title, f.length
from film f
left join rental r on r.film_id = f.film_id 
group by f.title, f.length
having count(r.film_id) = 0
order by f.length desc;
