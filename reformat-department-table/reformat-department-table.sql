# Write your MySQL query statement below
SELECT ID,
SUM(CASE WHEN MONTH='Jan' THEN REVENUE END) AS Jan_Revenue,
SUM(CASE WHEN MONTH='Feb' THEN REVENUE END) AS Feb_Revenue,
SUM(CASE WHEN MONTH='Mar' THEN REVENUE END) AS Mar_Revenue,
SUM(CASE WHEN MONTH='Apr' THEN REVENUE END) AS Apr_Revenue,
SUM(CASE WHEN MONTH='May' THEN REVENUE END) AS May_Revenue,
SUM(CASE WHEN MONTH='Jun' THEN REVENUE END) AS Jun_Revenue,
SUM(CASE WHEN MONTH='Jul' THEN REVENUE END) AS Jul_Revenue,
SUM(CASE WHEN MONTH='Aug' THEN REVENUE END) AS Aug_Revenue,
SUM(CASE WHEN MONTH='Sep' THEN REVENUE END) AS Sep_Revenue,
SUM(CASE WHEN MONTH='Oct' THEN REVENUE END) AS Oct_Revenue,
SUM(CASE WHEN MONTH='Nov' THEN REVENUE END) AS Nov_Revenue,
SUM(CASE WHEN MONTH='Dec' THEN REVENUE END) AS Dec_Revenue
FROM DEPARTMENT
GROUP BY 1