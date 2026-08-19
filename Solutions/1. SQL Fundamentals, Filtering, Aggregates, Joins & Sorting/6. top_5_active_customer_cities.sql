-- Finds the top 5 cities with the highest number of active customers.

select top 5 city, count(*) as number_of_active_customers
from customer
where active = 1
group by city
order by number_of_active_customers desc;
