-- Counts customers in each country and ranks countries by customer count.

select country, count(*) as number_of_customers
from customer
group by country
order by number_of_customers desc;
