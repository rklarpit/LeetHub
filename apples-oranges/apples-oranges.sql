# Write your MySQL query statement below
WITH APPLES AS(
    SELECT
        SALE_DATE, SOLD_NUM
    FROM 
        SALES
    WHERE
        FRUIT = 'apples'
    ),
ORANGES AS(
    SELECT
        SALE_DATE, SOLD_NUM
    FROM 
        SALES
    WHERE
        FRUIT = 'oranges'
    )
SELECT 
    APPLES.SALE_DATE,(APPLES.SOLD_NUM - ORANGES.SOLD_NUM) as DIFF
FROM
    APPLES
INNER JOIN
    ORANGES
ON
    APPLES.SALE_DATE = ORANGES.SALE_DATE 
    
