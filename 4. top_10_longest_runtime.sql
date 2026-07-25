-- This SQL query retrieves the top 10 longest films from the "film" table in the database, ordered by their length in descending order.

select top 10 title, length
from film
order by length desc;
