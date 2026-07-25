-- 38. calculate the monthly revenue for the last 12 months. Include the month and total revenue for each month.

select datepart(year, rental_date) as rental_year, datepart(month, rental_date) as rental_month, sum(coalesce(amount, 0) + coalesce(tax, 0)) as monthly_total_revenue
from rental 
where rental_date >= dateadd(month, -12, (select max(rental_date) from rental))
group by datepart(year, rental_date), datepart(month, rental_date)
order by rental_year asc, rental_month asc -- also find out the sql coder to know to know total timeframe of data
