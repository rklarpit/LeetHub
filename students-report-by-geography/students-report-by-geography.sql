# Write your MySQL query statement below
SELECT MAX(America) as America, Max(Asia) as Asia, Max(Europe) As Europe
From(
        SELECT 
            CASE 
                WHEN Continent = 'America' Then @r1:=@r1+1
                WHEN Continent = 'Asia' Then @r2:=@r2+1
                WHEN Continent = 'Europe' Then @r3:=@r3+1
            END
                AS RowID,
            CASE WHEN Continent = 'America' Then Name END AS AMERICA,
            CASE WHEN Continent = 'Asia' Then Name END AS Asia,
            CASE WHEN Continent = 'Europe' Then Name END AS Europe
          FROM
                STUDENT, (SELECT @r1 := 0, @r2 := 0, @r3 := 0) tmp
        Order By Name
) As A
Group By RowId
