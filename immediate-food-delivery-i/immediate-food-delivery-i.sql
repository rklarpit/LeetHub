# Write your MySQL query statement below
SELECT
   ROUND(SUM(CASE WHEN ORDER_DATE = customer_pref_delivery_datE THEN 1 ELSE 0 END)/COUNT(1)*100,2) AS immediate_percentage
FROM
    DELIVERY
