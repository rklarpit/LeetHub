# Write your MySQL query statement below
SELECT
    S.name
FROM
    salesperson S
WHERE
    S.SALES_ID
NOT IN(    
SELECT
    S.SALES_ID
FROM
    salesperson S
INNER JOIN
    orders O
ON 
    S.sales_id =  O.sales_id
INNER JOIN
    company C
ON
    C.com_id = O.com_id
AND 
     C.name = 'RED') 
