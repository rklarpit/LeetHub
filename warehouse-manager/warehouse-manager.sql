# Write your MySQL query statement below
SELECT
    W.NAME AS WAREHOUSE_NAME,
    SUM(P.WIDTH*P.LENGTH*P.HEIGHT*W.UNITS) AS VOLUME
FROM
    WAREHOUSE W
INNER JOIN
    PRODUCTS P
ON 
    W.PRODUCT_ID = P.PRODUCT_ID
GROUP BY 1
