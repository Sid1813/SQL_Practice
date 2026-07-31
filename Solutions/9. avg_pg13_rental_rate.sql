-- What is the average rental rate for films categorized as PG-13

select rating, avg(rental_rate) as average_rental_rate
from film
where rating = 'PG-13'
group by rating;
