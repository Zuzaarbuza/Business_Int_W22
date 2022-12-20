INSERT INTO BI_BikesDW_50.Dim_Product
SELECT 
    product.ProductID,
    product.ProductName,
    model.ProductModelName,
    sub.Name,
    top.Name,
    product.StandardCost,
    product.ListPrice,
    product.SellStartDate,
    product.SellEndDate,
    CASE
        WHEN
            (product.SellEndDate IS NULL
                OR product.SellEndDate > '2021-09-30')
        THEN
            'Current'
        ELSE 'Discontinued'
    END AS Status
FROM
    (((BI_Bikes_50.TB_Product AS product
    LEFT JOIN BI_Bikes_50.TB_ProductModel AS model ON product.ProductModelID = model.ProductModelID)
    LEFT JOIN BI_Bikes_50.TB_ProductSubCategory AS sub ON product.ProductSubCategoryID = sub.ProductSubCategoryID)
    LEFT JOIN BI_Bikes_50.TB_ProductTopCategory AS top ON sub.ProductTopCategoryID = top.ProductTopCategoryID)