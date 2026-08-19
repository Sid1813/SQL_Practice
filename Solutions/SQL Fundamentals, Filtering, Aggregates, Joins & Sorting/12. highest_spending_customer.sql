-- 12. which customer spent the most money on rentals

select top 1 
	c.customer_id, 
	concat(c.first_name, ' ',  c.last_name) as customer_name, 
	sum(coalesce(r.amount, 0) + (coalesce(r.tax, 0))) as total_money_spent
from customer c
join rental r on r.customer_id = c.customer_id
group by c.customer_id, concat(c.first_name, ' ', c.last_name)
order by total_money_spent desc;
