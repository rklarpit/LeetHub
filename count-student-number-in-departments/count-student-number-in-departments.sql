# Write your MySQL query statement below
SELECT
    D.DEPT_NAME, COUNT(S.STUDENT_ID) AS STUDENT_NUMBER
FROM
    DEPARTMENT D
LEFT JOIN
    STUDENT S
ON
    D.DEPT_ID = S.DEPT_ID
GROUP BY 1
ORDER BY 2 DESC
