# Write your MySQL query statement below
SELECT
    A.GENDER,A.DAY,SUM(B.SCORE_POINTS) AS TOTAL
FROM
    SCORES A
INNER JOIN
    SCORES B
ON
    A.DAY >= B.DAY
AND
    A.GENDER = B.GENDER
GROUP BY 1,2
ORDER BY 1,2
