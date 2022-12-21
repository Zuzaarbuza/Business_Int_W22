SELECT 
	L.Country,
    SUM(F.OrderLineProfit) AS "Profit"
FROM 
	Dim_Location L,
    Fact_InternetSales F
WHERE
	F.UnitPrice BETWEEN 1000 AND 2000
    AND F.ShipToLocationKey = L.PK_DimLocation
GROUP BY
	L.Country 
ORDER BY 2 DESC
LIMIT 3;
