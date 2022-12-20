CREATE TABLE BI_BikesDW_50.Dim_Product (
    PK_DimProduct INT PRIMARY KEY NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    ProductModelName VARCHAR(50),
    ProductSubCategoryName VARCHAR(50),
    ProductTopCategoryName VARCHAR(50),
    StandardCost DECIMAL(13, 4) NOT NULL,
    ListPrice DECIMAL(13 , 4) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    ProductStatus VARCHAR(50) NOT NULL
)