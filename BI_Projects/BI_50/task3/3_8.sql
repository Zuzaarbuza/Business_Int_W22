-- Accounting – taxes charged from the customers in certain countries
-- What is the monthly amount of taxes for the buyers in France and Germany in the first six months of 2021 (January through June)? Use OrderDate, ShipToLocation and OrderLineTaxAmt.

SELECT 
    YEAR(sales.OrderDate) AS 'Calendar Year',
    MONTHNAME(sales.OrderDate) AS 'Month',
    location.Country AS Country,
    SUM(sales.OrderLineTaxAmt) AS 'Tax Amount'
FROM
    (BI_BikesDW_50.Fact_InternetSales AS sales
    JOIN BI_BikesDW_50.Dim_Location AS location ON sales.ShipToLocationKey = location.PK_DimLocation)
WHERE
    MONTH(sales.OrderDate) <= 6
        AND YEAR(sales.OrderDate) = 2021
        AND (location.Country = 'Germany' OR location.Country = 'France')
GROUP BY YEAR(sales.OrderDate) , MONTHNAME(sales.OrderDate) , location.Country
ORDER BY MONTH(sales.OrderDate) , location.Country