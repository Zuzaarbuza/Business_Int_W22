SELECT 
	P.ProductTopCategoryName AS "Product Top Category",
    CAST(SUM(F.OrderLineProfit) AS DECIMAL(13,2)) AS "Profit"
FROM 
	BI_BikesDW_50.Dim_Product P,
    BI_BikesDW_50.Fact_InternetSales F
WHERE
	F.ProductKey = P.PK_DimProduct
    AND YEAR(F.OrderDate) = '2021'
GROUP BY 
	P.ProductTopCategoryName
ORDER BY 2 DESC
	