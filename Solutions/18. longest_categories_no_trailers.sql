-- 18. Find top 3 movie categories with longest avg runtime. Exclude movies with trailers 

select top 3 category, avg(length) as average_runtime
from film
where special_features not like '%Trailers%'
group by category
order by average_runtime desc;
