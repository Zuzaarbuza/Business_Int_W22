SELECT 
    (ROW_NUMBER() OVER (ORDER BY SUM(sales.OrderLineProfit) DESC)) AS 'Customer Rank',
    customer.FullName as "Full Name", 
	CAST(SUM(sales.OrderLineProfit) AS DECIMAL(13,2)) AS Profit
FROM
    BI_BikesDW_50.Fact_InternetSales AS sales
        JOIN
    BI_BikesDW_50.Dim_Customer AS customer ON sales.CustomerKey = customer.PK_DimCustomer
WHERE
    YEAR(sales.OrderDate) = 2021
        AND MONTH(sales.OrderDate) <= 6
GROUP BY sales.CustomerKey
ORDER BY profit DESC
LIMIT 10