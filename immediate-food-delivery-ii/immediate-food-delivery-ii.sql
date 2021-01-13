# # Write your MySQL query statement below
# WITH FIRST_ORDER AS(
#     SELECT CUSTOMER_ID, MIN(ORDER_DATE) as MIN_DATE
#     FROM DELIVERY
#     GROUP BY 1
# )
# SELECT
#     ROUND(SUM(CASE WHEN D.ORDER_DATE = D.customer_pref_delivery_date THEN 1 END)/COUNT(1)* 100, 2) AS IMMEDIATE_PERCENTAGE
# FROM
#     DELIVERY D
# INNER JOIN 
#     FIRST_ORDER F
# ON
#     F.CUSTOMER_ID = D.customer_id
# AND
#     D.ORDER_DATE = F.MIN_DATE
​
select round(count(distinct if(datediff(customer_pref_delivery_date,order_date) = 0, delivery_id,null))/count(distinct delivery_id)*100,2) as immediate_percentage
from
    (select delivery_id
         , customer_id
         , order_date
         , customer_pref_delivery_date
         , rank() over(partition by customer_id order by order_date asc)  as ranking
    from delivery) temp
where ranking = 1
