# Write your MySQL query statement below
WITH MANAGER_1 AS (
SELECT
    employee_id 
FROM
    Employees
WHERE manager_id = 1
AND NOT EMPLOYEE_ID = 1
    ),
MANAGER_2 AS(
    SELECT
    E.employee_id 
FROM
    Employees E
INNER JOIN
    MANAGER_1 M
WHERE E.manager_id = M.EMPLOYEE_ID
),
MANAGER_3 AS(
    SELECT
    E.employee_id 
FROM
    Employees E
INNER JOIN
    MANAGER_2 M
WHERE E.manager_id = M.EMPLOYEE_ID
)
SELECT EMPLOYEE_ID FROM MANAGER_1
UNION
SELECT EMPLOYEE_ID FROM MANAGER_2
UNION
SELECT EMPLOYEE_ID FROM MANAGER_3
​
