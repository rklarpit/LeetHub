# Write your MySQL query statement below
SELECT DISTINCT NUM AS CONSECUTIVENUMS
FROM(
SELECT
    NUM,
LEAD(NUM, 1) OVER(ORDER BY ID) AS LEAD_NUM,
LAG(NUM, 1) OVER(ORDER BY ID) AS LAG_NUM
FROM
    Logs
) AS A
WHERE
    NUM = LEAD_NUM
AND
    NUM = LAG_NUM
