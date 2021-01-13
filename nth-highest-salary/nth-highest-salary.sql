 CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
​
BEGIN
  RETURN (
      # Write your MySQL query statement below.
     SELECT
      A.SALARY
     FROM(
    SELECT 
        SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RANK_SALARY
     FROM
        EMPLOYEE
    ) AS A
        WHERE RANK_SALARY = N
     LIMIT 1
  );
END
​
# CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
# BEGIN
# DECLARE offst INT unsigned DEFAULT (N-1);
# RETURN (
# # Write your MySQL query statement below.
# SELECT DISTINCT Salary FROM Employee
# ORDER BY Salary DESC
# LIMIT 1 OFFSET offst
# );
# END
