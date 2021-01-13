SELECT ad_id,
ROUND(IFNULL(COUNT(CASE WHEN action = 'Clicked' THEN user_id ELSE NULL END)
/ COUNT( CASE WHEN action IN ('Clicked','Viewed') THEN user_id ELSE NULL END),0)*100,2) AS ctr
FROM Ads
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;
