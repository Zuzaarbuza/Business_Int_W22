CREATE TABLE BI_BikesDW_50.Dim_Location (
    PK_DimLocation INT PRIMARY KEY NOT NULL,
    Country VARCHAR(30) NOT NULL,
    Region VARCHAR(30) NOT NULL,
    TaxRate DECIMAL(13 , 4),
    ShipCoeff DECIMAL(13 , 4)
)