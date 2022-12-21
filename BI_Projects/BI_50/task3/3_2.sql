-- Sales – revenue for countries
-- What is the total revenue for each country in the year 2019 sorted by revenue in descending order? Use ShipToLocation, OrderDate and OrderLineTotal.
 
SELECT 
    location.Country, SUM(sales.OrderLineTotal) AS Revenue
FROM
    (BI_BikesDW_50.Fact_InternetSales AS sales
    JOIN BI_BikesDW_50.Dim_Location AS location ON sales.ShipToLocationKey = location.PK_DimLocation)
WHERE
    YEAR(sales.OrderDate) = 2019
GROUP BY sales.ShipToLocationKey
ORDER BY Revenue DESC