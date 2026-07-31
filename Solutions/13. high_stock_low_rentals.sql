-- 13. top 5 movies with highest copies in stock but lowest rental count 

select top 5 f.title, f.copies_in_stock, count(r.film_id) as rental_count
from film f
left join rental r on r.film_id = f.film_id
group by f.title, f.copies_in_stock
order by f.copies_in_stock desc, rental_count asc;


