SELECT 
	P.ProductTopCategoryName AS "Product Top Category",
    SUM(F.OrderLineProfit) AS "Profit"
FROM 
	Dim_Product P,
    Fact_InternetSales F
WHERE
	F.ProductKey = P.PK_DimProduct
    AND YEAR(F.OrderDate) = '2021'
GROUP BY 
	P.ProductTopCategoryName
ORDER BY 2 DESC
	