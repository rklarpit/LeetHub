# Write your MySQL query statement below
SELECT
    NAME
FROM
    CUSTOMER
WHERE
    NOT COALESCE(REFEREE_ID,0) = 2
