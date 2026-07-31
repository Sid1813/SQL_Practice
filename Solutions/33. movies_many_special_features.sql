-- 33. List all movies that have more than two special features. 

select title, (len(special_features) - len(replace(special_features, ',', '')) + 1) as special_features_count, special_features
from film 
where (len(special_features) - len(replace(special_features, ',', '')) + 1) > 2
order by title
