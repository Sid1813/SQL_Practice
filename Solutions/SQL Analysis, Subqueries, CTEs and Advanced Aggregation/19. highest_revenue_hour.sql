-- 19. At what hour of the day is total revenue (amount + tax) the highest?

select top 1 datepart(hour, rental_date) as rental_hour, sum(coalesce(amount, 0) + coalesce(tax, 0)) as total_revenue
from rental 
group by datepart(hour, rental_date)
order by total_revenue desc;
