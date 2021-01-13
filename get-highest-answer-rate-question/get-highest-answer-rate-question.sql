# Write your MySQL query statement below
SELECT SURVEY_LOG FROM
(
SELECT
    QUESTION_ID AS SURVEY_LOG,
    SUM(CASE WHEN ACTION = 'ANSWER' THEN 1 ELSE 0 END)/
    SUM(CASE WHEN ACTION = 'SHOW' THEN 1 ELSE 0 END) AS ANSWER_RATIO
FROM SURVEY_LOG
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
    ) AS A