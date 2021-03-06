# Write your MySQL query statement below
WITH FIRST_LOGIN AS (
    SELECT
        PLAYER_ID, MIN(EVENT_DATE) AS FIRST_LOGIN
    FROM
        ACTIVITY
    GROUP BY 1
)
SELECT 
    ACTIVITY.PLAYER_ID,
    DEVICE_ID
FROM
    ACTIVITY
INNER JOIN
    FIRST_LOGIN
ON
    ACTIVITY.EVENT_DATE = FIRST_LOGIN.FIRST_LOGIN
AND 
    ACTIVITY.PLAYER_ID = FIRST_LOGIN.PLAYER_ID
