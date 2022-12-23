SELECT 
	L.Country,
    CAST(SUM(F.OrderLineProfit) AS DECIMAL(13,2)) AS "Profit"
FROM 
	BI_BikesDW_50.Dim_Location L,
    BI_BikesDW_50.Fact_InternetSales F
WHERE
	F.UnitPrice BETWEEN 1000 AND 2000
    AND F.ShipToLocationKey = L.PK_DimLocation
GROUP BY
	L.Country 
ORDER BY 2 DESC
LIMIT 3;
