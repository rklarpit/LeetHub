# Write your MySQL query statement below
WITH BUY AS(
    SELECT
        STOCK_NAME,
        SUM(PRICE) AS TOTAL_BOUGHT_PRICE
    FROM
        STOCKS
    WHERE
        OPERATION = 'Buy'
    GROUP BY 1
    ),
SELL AS
    (
        SELECT
        STOCK_NAME,
        SUM(PRICE) AS TOTAL_SOLD_PRICE
    FROM
        STOCKS
    WHERE
        OPERATION = 'SELL' 
    GROUP BY 1 
    )
SELECT 
    BUY.STOCK_NAME, (TOTAL_SOLD_PRICE - TOTAL_BOUGHT_PRICE) AS capital_gain_loss
FROM
    BUY
INNER JOIN
    SELL
ON 
    BUY.STOCK_NAME = SELL.STOCK_NAME
​
        
