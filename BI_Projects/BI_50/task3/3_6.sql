-- Production – most sold product models in each of the categories
-- What are the three most sold product models in each of the top product categories, sorted by Product Top Category and Quantity Sold?

SELECT 
    ProductTopCategoryName AS 'Product Top Category',
    ProductSubCategoryName AS 'Product Sub Category',
    ProductModelName AS 'Product Model',
    Quantity_Sold AS 'Quantity Sold'
FROM
    (SELECT 
        *, 
        ROW_NUMBER() OVER (PARTITION BY filtered.ProductTopCategoryName ORDER BY Quantity_Sold DESC) AS seqnum -- THIS WAS PAINFUL
    FROM
        (SELECT 
        product.ProductTopCategoryName,
            product.ProductSubCategoryName,
            product.ProductModelName,
            SUM(sales.OrderQty) AS Quantity_Sold
    FROM
        (BI_BikesDW_50.Dim_Product AS product
    JOIN BI_BikesDW_50.Fact_InternetSales AS sales ON sales.ProductKey = product.PK_DimProduct)
    GROUP BY product.PK_DimProduct
    ORDER BY Quantity_Sold DESC) AS filtered) AS tmp
WHERE
    seqnum <= 3
