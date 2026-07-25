-- 15. how many customers have rented more than 10 films in a year? 

select sq.rental_year, count(*) as customers_who_have_rented_more_than_10_films_per_year -- the final query tells you the count of those customers
from (
	select c.customer_id, datepart(year, r.rental_date) as rental_year, count(r.film_id) as rental_count -- this subquery gives you the list of customers who have rented more than 10 films
	from customer c
	join rental r on r.customer_id = c.customer_id
	group by c.customer_id, datepart(year, rental_date)
	having count(r.film_id) > 10) sq
group by sq.rental_year
order by customers_who_have_rented_more_than_10_films_per_year desc;
