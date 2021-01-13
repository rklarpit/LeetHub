# Write your MySQL query statement below
SELECT
    NAME, population , area
FROM
    WORLD
WHERE
    AREA > 3000000
OR
    POPULATION > 25000000
