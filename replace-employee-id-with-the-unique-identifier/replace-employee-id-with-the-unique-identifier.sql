# Write your MySQL query statement below
SELECT
    B.UNIQUE_ID, A.NAME
FROM
    EMPLOYEES A
LEFT JOIN
    EMPLOYEEUNI B
ON
    A.ID = B.ID
