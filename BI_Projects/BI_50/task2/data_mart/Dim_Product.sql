create table Dim_Product (
	PK_DimProduct INT primary key not null,
    ProductName varchar(50) not null,
    ProductModelName varchar(50) not null,
    ProductSubCategoryName varchar(50) not null,
    ProductTopCategoryName varchar(50) not null,
    StandardCost Decimal(13.4) not null,
    ListPrice Decimal(13,4) not null,   
    StartDate date not null,
    EndDate date,
    ProductStatus varchar(50)
)