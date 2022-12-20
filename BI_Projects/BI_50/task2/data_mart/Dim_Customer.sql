CREATE TABLE BI_BikesDW_50.Dim_Customer (
    PK_DimCustomer INT PRIMARY KEY,
    AccountNumber VARCHAR(30) NOT NULL,
    FullName VARCHAR(150),
    Gender VARCHAR(1),
    Age INT
)