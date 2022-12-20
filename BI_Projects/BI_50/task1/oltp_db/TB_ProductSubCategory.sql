CREATE TABLE BI_Bikes_50.TB_ProductSubCategory (
    ProductSubCategoryID INT PRIMARY KEY NOT NULL,
    ProductTopCategoryID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    
    FOREIGN KEY (ProductTopCategoryID) REFERENCES TB_ProductTopCategory (ProductTopCategoryID)
)