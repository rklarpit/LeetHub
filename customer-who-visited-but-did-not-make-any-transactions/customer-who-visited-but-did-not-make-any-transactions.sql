# Write your MySQL query statement below
​
SELECT 
    
    V.CUSTOMER_ID as customer_id ,
    COUNT(V.VISIT_ID) AS count_no_trans
FROM
    VISITS V
LEFT JOIN
    TRANSACTIONS T
ON
    V.VISIT_ID = T.VISIT_ID
WHERE
    T.AMOUNT IS NULL
GROUP BY 1
