SELECT *FROM amazon;
# What is the total number of orders in the dataset
SELECT COUNT(ORDERID)
FROM amazon;

#	What is the total revenue generated from all orders?
select orderid, sum(quantity*unitprice)as total_revenue
from amazon
group by orderid;

#What is the average, minimum and maximum order amount?
select min(unitprice) as minimum_price,max(unitprice) as max_price,avg(unitprice) as average_price
FROM AMAZON ;

#What is the average quantity purchased per order?
select avg(quantity) as avg_per_order
from amazon
;

#	What is the total quantity of products sold?
select productname, sum(quantity)
from amazon
group by productname;

# What is the average discount given on orders?
select avg(discount)
from amazon;

# What are the total tax and shipping costs collected?
select sum(tax  + shippingcost) as total_tax_and_shipping
from amazon;

# How does total revenue change month by month?
SELECT
    YEAR(STR_TO_DATE(OrderDate, '%Y-%m-%d')) AS Year,
    MONTH(STR_TO_DATE(OrderDate, '%Y-%m-%d')) AS Month,
    MONTHNAME(STR_TO_DATE(OrderDate, '%Y-%m-%d')) AS Month_Name,
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM Amazon
GROUP BY
    Year,
    Month,
    Month_Name
ORDER BY
    Year,
    Month;

#	Which year generated the highest total revenue?
SELECT YEAR(str_to_date(ORDERDATE, '%Y-%m-%d')) AS YEAR ,
SUM(QUANTITY*UNITPRICE) AS TOTAL_REVENUE
FROM AMAZON
GROUP  BY YEAR
ORDER BY TOTAL_REVENUE DESC
LIMIT 1;

#Which month has the highest number of orders?
SELECT month(str_to_date(ORDERDATE, '%Y-%m-%d')) AS MONTH,
SUM(QUANTITY) AS NO_OF_ORDERS
FROM amazon
GROUP BY month
ORDER BY NO_OF_ORDERS
LIMIT 1;

#How does the number of delivered orders change year by year?
SELECT YEAR(str_to_date(ORDERDATE, '%Y-%m-%d')) AS YEAR,
COUNT(DISTINCT(ORDERID)) AS ORDER_DELIVERED
FROM AMAZON 
WHERE ORDERSTATUS ='DELIVERED'
GROUP BY year
ORDER BY YEAR;

#Which five product categories generate the highest revenue?
select productname, sum(quantity* unitprice) as total_revenue
from amazon
group by productname
order by total_revenue desc
limit 5;

#Which five brands have the highest sales?
select brand, sum(unitprice) as highest_sale
from amazon
group by brand
order by  sum(unitprice) ;

#Which payment method is used most frequently by customers?
select  distinct(paymentmethod) as payment_method,
count(PaymentMethod) as most_frequently
from amazon
group by Payment_Method;

#Which five countries contribute the highest total revenue?
select distinct(country) as country ,
sum(quantity*unitprice) as total_revenue
from amazon
group by Country;



