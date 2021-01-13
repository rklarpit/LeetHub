# Write your MySQL query statement below
SELECT
    ID, MOVIE, DESCRIPTION, RATING
FROM
    CINEMA    
WHERE
    MOD(ID,2) != 0
AND
     DESCRIPTION != 'boring'
ORDER BY RATING DESC
