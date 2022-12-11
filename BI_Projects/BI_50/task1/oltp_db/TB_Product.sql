create table BI_Bikes_50.TB_Product (
	ProductID INT primary key not null,
    ProductName Varchar(50) not null,
    ProductNumber varchar(50) not null,
    StandardCost Decimal(13.4) not null,
    ListPrice Decimal(13,4) not null,   
    ProductSubCategoryID INT,
    ProductModelID INT,
    SellStartDate date not null,
    SellEndDate date,
    
    FOREIGN KEY (ProductSubCategoryID) REFERENCES TB_ProductSubCategory(ProductSubCategoryID),
    FOREIGN KEY (ProductModelID) REFERENCES TB_ProductModel(ProductModelID)
)