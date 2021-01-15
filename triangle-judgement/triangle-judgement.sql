# Write your MySQL query statement below
SELECT
    X,
    Y,
    Z,
    IF(( X+Y>Z AND X+Z>Y AND Y+Z>X)=1,'Yes','No') AS TRIANGLE
FROM
    TRIANGLE
