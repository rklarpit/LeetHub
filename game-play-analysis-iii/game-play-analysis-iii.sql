# Write your MySQL query statement below
SELECT
    A.PLAYER_ID, A.EVENT_DATE, SUM(b.games_played) AS games_played_so_far
FROM
    ACTIVITY A
INNER JOIN
    ACTIVITY B
ON
    A.PLAYER_ID = B.PLAYER_ID
AND
    A.EVENT_DATE >= B.EVENT_DATE
GROUP BY 1, 2
