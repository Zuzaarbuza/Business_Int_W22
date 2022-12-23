DROP FUNCTION IF EXISTS `compute_date`;

CREATE FUNCTION compute_date(Datum DATE)
RETURNS INT DETERMINISTIC
RETURN YEAR(Datum) * 10000 + MONTH(Datum) * 100 + DAY(Datum);
-- Probably could be done simpler, but SQL is just a mess

INSERT INTO BI_BikesDW_50.Fact_InternetSales
SELECT 
    CONCAT('SOL',
            detail.SalesOrderID,
            '-',
            detail.SalesOrderDetailID),
    header.SalesOrderNumber,
    COMPUTE_DATE(header.OrderDate),
    header.OrderDate,
    COMPUTE_DATE(header.DueDate),
    header.DueDate,
    COMPUTE_DATE(header.ShipDate),
    header.ShipDate,
    detail.ProductID,
    header.CustomerID,
    address.CountryID,
    status.OrderStatusName,
    method.ShipMethodName,
    detail.OrderQty,
    detail.UnitPrice,
    detail.OrderQty * detail.UnitPrice AS OrderLineTotal,
    detail.OrderQty * detail.UnitPrice - detail.OrderQty * product.StandardCost AS OrderLineProfit,
    (detail.OrderQty * detail.UnitPrice * country.TaxRate) AS OrderLineTaxAmt,
    (top.ShipSurcharge + method.ShipBase + (detail.OrderQty * method.ShipRate * country.ShipCoeff)) AS OrderLineShippingCost
FROM
    (((((((BI_Bikes_50.TB_SalesOrderHeader AS header
    JOIN BI_Bikes_50.TB_SalesOrderDetail AS detail ON header.SalesOrderID = detail.SalesOrderID)
    JOIN BI_Bikes_50.TB_Address AS address ON header.ShipToAddressID = address.AddressID)
    JOIN BI_Bikes_50.TB_Country AS country ON address.CountryID = country.CountryID)
    JOIN BI_Bikes_50.TB_OrderStatus AS status ON status.OrderStatusID = header.OrderStatusID)
    JOIN BI_Bikes_50.TB_ShipMethod AS method ON method.ShipMethodID = header.ShipMethodID)
    JOIN BI_Bikes_50.TB_Product AS product ON detail.ProductID = product.ProductID)
    JOIN BI_Bikes_50.TB_ProductSubCategory AS sub ON product.ProductSubCategoryID = sub.ProductSubCategoryID)
	JOIN BI_Bikes_50.TB_ProductTopCategory AS top ON sub.ProductTopCategoryID = top.ProductTopCategoryID