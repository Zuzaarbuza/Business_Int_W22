CREATE TABLE BI_Bikes_50.TB_SalesOrderDetail (
    SalesOrderDetailID INT PRIMARY KEY NOT NULL,
    SalesOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderQty INT NOT NULL,
    UnitPrice DECIMAL(13 , 4 ) NOT NULL,
    
    FOREIGN KEY (SalesOrderID) REFERENCES TB_SalesOrderHeader (SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES TB_Product (ProductID)
)