create table BI_Bikes_50.TB_ProductSubCategory (
	ProductSubCategoryID INT primary key not null,
    ProductTopCategoryID INT not null,
    Name Varchar(50) not null,

    FOREIGN KEY (ProductTopCategoryID) REFERENCES TB_ProductTopCategory(ProductTopCategoryID)
)