-- 22. List all movies with a runtime longer than the average runtime of their category. 
--	   Additionally:
--     •	Express the ratio of the movie’s runtime to the category’s average runtime.
--     •	Exclude movies that exactly match the category average.

select f.title, f.length as film_runtime, c.avg_runtime as category_average_runtime, 
cast(f.length * 1.0 / c.avg_runtime as decimal(10,2)) as runtime_ratio
from film f
join (select category, avg(length) as avg_runtime
	  from film
	  group by category) c on c.category = f.category
where f.length > c.avg_runtime;
