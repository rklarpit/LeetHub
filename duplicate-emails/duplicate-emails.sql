# Write your MySQL query statement below
SELECT EMAIL FROM(
SELECT
    EMAIL, COUNT(EMAIL) AS CountEmail
FROM
    PERSON
GROUP BY
    EMAIL
HAVING COUNTEMAIL >1) AS A
    
​
