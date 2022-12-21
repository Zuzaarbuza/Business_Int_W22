-- Sales – most actively purchasing customers
-- Who are the top five most active purchasing customers (by the number of purchased items) among the customers in Europe? Use ShipToLocation.

SELECT 
    europeans.Region,
    customers.FullName as 'Customer Name',
    SUM(sales.OrderQty) AS 'Quantity_Sold',
    (row_number() over (ORDER BY SUM(sales.OrderQty) desc)) as "Rank"
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
ORDER BY 'Quantity_Sold' DESC
LIMIT 5