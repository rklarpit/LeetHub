# Write your MySQL query statement below
SELECT
    C.COUNTRY_NAME, 
    CASE WHEN AVG(W.WEATHER_STATE) <= 15 THEN 'Cold'
         WHEN AVG(W.WEATHER_STATE) >= 25 THEN 'Hot'
         ELSE 'Warm'
    END AS WEATHER_TYPE
FROM
    COUNTRIES C
INNER JOIN
    WEATHER W
ON
    C.COUNTRY_ID = W.COUNTRY_ID
AND MONTH(W.DAY) = 11 and YEAR(W.DAY) = 2019
GROUP BY 1
​
