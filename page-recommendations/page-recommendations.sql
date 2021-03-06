# Write your MySQL query statement below
WITH FRIENDS AS(
SELECT
    DISTINCT USER2_ID AS USER_ID
FROM
    FRIENDSHIP
WHERE
    USER1_ID = 1
UNION
SELECT
    DISTINCT USER1_ID AS USER_ID
FROM
    FRIENDSHIP
WHERE
    USER2_ID = 1
)
SELECT 
   DISTINCT L.PAGE_ID AS recommended_page
FROM
    LIKES L
INNER JOIN
    FRIENDS F
ON
    F.USER_ID = L.USER_ID
WHERE
    L.PAGE_ID NOT IN (
        SELECT
            PAGE_ID
        FROM
            LIKES
        WHERE
            USER_ID = 1
    )
