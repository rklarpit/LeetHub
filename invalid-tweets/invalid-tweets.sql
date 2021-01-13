# Write your MySQL query statement below
SELECT tweet_id FROM(
SELECT 
    tweet_id, LENGTH(content) as LENGTH_1
FROM
    TWEETS
GROUP BY 1
HAVING LENGTH_1 > 15) AS A
​
