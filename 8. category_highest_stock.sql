-- which film category has the highest number of films available in stock

select category, sum(copies_in_stock) as total_copies
from film
group by category
order by total_copies desc;
