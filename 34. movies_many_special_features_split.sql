-- 34. alt way of doing the same as above 

select title, count(*) as secial_features_count, special_features
from film
cross apply string_split(special_features, ',')
group by title, special_features
having count(*) > 2
order by title
