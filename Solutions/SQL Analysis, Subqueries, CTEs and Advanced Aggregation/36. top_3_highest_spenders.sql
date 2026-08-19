-- 36. Identify the top 3 customers who have spent the most on rentals over their entire rental history

select top 3 c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, sum(coalesce(r.amount, 0) + coalesce(r.tax, 0)) as total_amount_spent_on_rentals 
from customer c
join rental r on r.customer_id = c.customer_id
group by c.customer_id, concat(c.first_name, ' ', c.last_name)
order by total_amount_spent_on_rentals desc;
