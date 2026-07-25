-- 20. count of movies based on length : < 1hr - short, >1 <2 medium, >2 long 

select
sum(case when length < 60 then 1 else 0 end) as short_movies,
sum(case when length between 60 and 120 then 1 else 0 end) as medium_length_movies,
sum(case when length > 120 then 1 else 0 end) as long_movies
from film
