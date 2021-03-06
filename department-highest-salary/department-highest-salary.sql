# Write your MySQL query statement below
SELECT D.NAME AS Department, A.NAME AS EMPLOYEE, SALARY FROM(
SELECT
    DEPARTMENTID,NAME,SALARY, RANK() OVER(PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) AS SALARY_RANK
FROM Employee) AS A
INNER JOIN 
DEPARTMENT D
ON D.ID = A.DEPARTMENTID
WHERE SALARY_RANK = 1
