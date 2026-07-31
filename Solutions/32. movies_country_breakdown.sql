-- 32. Same as above but with the countries where film was rented also included 

with film_country as 
(select f.title, c.country
from film f
join rental r on r.film_id = f.film_id
join customer c on c.customer_id = r.customer_id
group by f.title, c.country),

country_counts as 
(select f.title, count(distinct(c.country)) as country_count
from film f
join rental r on r.film_id = f.film_id
join customer c on c.customer_id = r.customer_id
group by f.title)

select fc.title, fc.country, cc.country_count
from film_country fc
join country_counts cc on cc.title = fc.title
order by cc.country_count desc;
