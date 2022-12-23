SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT
	L.Country, 
	D.CalendarYear AS "Year", 
    D.EnglishMonthName AS "Month",
    CAST(SUM(f.OrderLineShippingCost) AS DECIMAL(13,2)) AS 'Shipping Costs'
FROM
	BI_BikesDW_50.Fact_InternetSales F,
    BI_BikesDW_50.Dim_Location L,
    BI_BikesDW_50.Dim_Date D
WHERE
	F.OrderDateKey = D.PK_DimDate
    AND L.Country = 'United Kingdom'
    AND D.MonthNumberOfYear < 7
    AND F.ShipToLocationKey = L.PK_DimLocation
    AND F.ShipMethod = 'Cargo International'
    AND D.CalendarYear = 2020
GROUP BY
	D.MonthNumberOfYear