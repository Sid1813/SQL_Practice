-- This SQL query retrieves all the titles from the "film" table in the database released in 2006.

select title, release_year
from film
where release_year = 2006;
