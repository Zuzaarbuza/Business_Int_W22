DROP FUNCTION IF EXISTS `compute_date`;

CREATE FUNCTION compute_date(Datum DATE)
RETURNS INT DETERMINISTIC
RETURN YEAR(Datum) * 10000 + MONTH(Datum) * 100 + DAY(Datum);
-- Probably could be done simpler, but SQL is just a mess

INSERT INTO BI_BikesDW_50.Dim_Date
SELECT 
    COMPUTE_DATE(cdate),
    cdate,
    DAYOFWEEK(cdate),
    DAYNAME(cdate),
    DAYOFMONTH(cdate),
    DAYOFYEAR(cdate),
    WEEKOFYEAR(cdate),
    MONTHNAME(cdate),
    MONTH(cdate),
    FLOOR((MONTH(cdate) - 1) / 3) + 1,
    YEAR(cdate)
FROM
    (SELECT DISTINCT
        OrderDate AS cdate
    FROM
        (SELECT 
        OrderDate
    FROM
        BI_Bikes_50.TB_SalesOrderHeader UNION SELECT 
        DueDate
    FROM
        BI_Bikes_50.TB_SalesOrderHeader UNION SELECT 
        ShipDate
    FROM
        BI_Bikes_50.TB_SalesOrderHeader) AS Dates) AS Distinct_Dates
