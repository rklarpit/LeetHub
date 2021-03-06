# Write your MySQL query statement below
SELECT
    A.MACHINE_ID, ROUND(SUM(B.TIMESTAMP - A.TIMESTAMP)/COUNT(A.PROCESS_ID),3) AS PROCESSING_TIME
FROM
    ACTIVITY A
INNER JOIN
    ACTIVITY B
ON A. MACHINE_ID = B.MACHINE_ID
AND A.PROCESS_ID = B.PROCESS_ID
AND A.ACTIVITY_TYPE = 'start'
AND B.ACTIVITY_TYPE = 'end'
GROUP BY 1
ORDER BY 1
