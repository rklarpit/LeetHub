# Write your MySQL query statement below
SELECT
    S.ID,
    S.NAME
FROM
    STUDENTS S
LEFT JOIN
    DEPARTMENTS D
ON
    S.DEPARTMENT_ID = D.ID
WHERE 
    D.ID IS NULL
