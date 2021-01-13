# Write your MySQL query statement below
SELECT 
    U.NAME, COALESCE(SUM(DISTANCE), 0)as travelled_distance
FROM
    USERS U
LEFT JOIN
    RIDES R
ON
    U.ID = R.USER_ID
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
