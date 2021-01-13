# Write your MySQL query statement below
SELECT
  DISTINCT A.SEAT_ID
FROM
    CINEMA A
INNER JOIN
    CINEMA B
ON
    (A.SEAT_ID = B.SEAT_ID-1 OR A.SEAT_ID = B.SEAT_ID +1)
AND
    A.FREE =1 and B.FREE =1
