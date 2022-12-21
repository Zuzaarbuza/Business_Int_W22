-- Sales – most actively purchasing customers
-- Who are the top five most active purchasing customers (by the number of purchased items) among the customers in Europe? Use ShipToLocation.

SELECT 
    europeans.Region,
    customers.FullName AS 'Customer Name',
    SUM(sales.OrderQty) AS 'Quantity Sold',
    (ROW_NUMBER() OVER (ORDER BY SUM(sales.OrderQty) DESC)) AS 'Rank'
FROM
    ((SELECT 
        location.PK_DimLocation, location.Region
    FROM
        BI_BikesDW_50.Dim_Location AS location
    WHERE
        location.Region = 'Europe') AS europeans
    JOIN BI_BikesDW_50.Fact_InternetSales AS sales ON europeans.PK_DimLocation = sales.ShipToLocationKey)
        JOIN
    BI_BikesDW_50.Dim_Customer AS customers ON sales.CustomerKey = customers.PK_DimCustomer
GROUP BY sales.CustomerKey
ORDER BY 'Quantity Sold' DESC
LIMIT 5