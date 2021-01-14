# Write your MySQL query statement below
SELECT
    LEFT(trans_date, 7) AS MONTH, 
    COUNTRY, COUNT(ID) AS TRANS_COUNT, 
    SUM(CASE WHEN STATE = 'approved' THEN 1 ELSE 0 END) AS APPROVED_COUNT,
    SUM(AMOUNT) AS trans_total_amount, 
    SUM(CASE WHEN STATE = 'approved' THEN AMOUNT ELSE 0 END) AS approved_total_amount 
FROM
    TRANSACTIONS
GROUP BY 1,2
