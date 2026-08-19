-- Lists movies not released in 2005 with a replacement cost greater than $20.

from film
where release_year <> 2005
and replacement_cost > 20;
