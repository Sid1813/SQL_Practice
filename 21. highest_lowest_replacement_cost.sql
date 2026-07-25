-- 21. List the movies with the highest & lowest replacement costs 
-- (Just the movie name and its corresponding replacement cost)

select f.title, f.replacement_cost
from (select top 1 title, replacement_cost
	  from film
	  order by replacement_cost desc) f

union all

select g.title, g.replacement_cost
from (select top 1 title, replacement_cost
      from film
	  order by replacement_cost asc) g
