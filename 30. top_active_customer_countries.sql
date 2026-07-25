-- 30. Rank the top 5 countries with the highet number of active customers

select top 5 country, count(customer_id) as active_customers
from customer 
where active = 1
group by country
order by active_customers desc;
