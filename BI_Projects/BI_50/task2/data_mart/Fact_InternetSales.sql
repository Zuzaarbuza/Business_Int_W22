CREATE TABLE BI_BikesDW_50.Fact_InternetSales (
	PK_FactInternetSales VARCHAR(50) PRIMARY KEY NOT NULL,
    SalesOrderNumber VARCHAR(30) NOT NULL,
    OrderDateKey INT, 
	OrderDate DATE NOT NULL,
    DueDateKey INT,
    DueDate DATE NOT NULL,
    ShipDateKey INT,
    ShipDate DATE,
    ProductKey INT,
    CustomerKey INT,
    ShipToLocationKey INT,
    OrderStatus VARCHAR(50),
    ShipMethod VARCHAR(50),
    OrderQty INT NOT NULL,
    UnitPrice DECIMAL(13, 4) NOT NULL,
    OrderLineTotal DECIMAL(13, 4),
    OrderLineProfit DECIMAL(13, 4),
    OrderLineTaxAmt DECIMAL(13, 4),
    OrderLineShippingCost DECIMAL(13, 4),
    
    CONSTRAINT FK_ProductKey_FactInternetSales FOREIGN KEY (ProductKey) REFERENCES Dim_Product(PK_DimProduct),
    CONSTRAINT FK_ShipToLocation_FactInternetSales FOREIGN KEY (ShipToLocationKey) REFERENCES Dim_Location(PK_DimLocation),
    CONSTRAINT FK_Customer_FactInternetSales FOREIGN KEY (CustomerKey) REFERENCES Dim_Customer(PK_DimCustomer),
    CONSTRAINT FK_OrderDate_FactInternetSales FOREIGN KEY (OrderDateKey) REFERENCES Dim_Date(PK_DimDate),
    CONSTRAINT FK_DueDate_FactinternetSales FOREIGN KEY (DueDateKey) REFERENCES Dim_Date(PK_DimDate),
    CONSTRAINT FK_ShipDate_FactIntrnetSales FOREIGN KEY (ShipDateKey) REFERENCES Dim_Date(PK_DimDate)
)