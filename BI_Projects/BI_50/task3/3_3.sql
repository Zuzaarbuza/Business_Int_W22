SELECT 
    C.FullName AS "Customer Name",
	SUM(F.OrderLineProfit) AS "Profit"
FROM
	Dim_Customer C,
    Fact_InternetSales F,
    Dim_Date D
WHERE
	D.MonthNumberOfYear < 7
    AND D.CalendarYear = 2021
    AND C.PK_DimCustomer = F.CustomerKey
    AND F.OrderDateKey = D.PK_DimDate
GROUP BY c.FullName 
ORDER BY 2 DESC
LIMIT 10;