CREATE TABLE BI_Bikes_50.TB_Country (
    CountryID INT PRIMARY KEY NOT NULL,
    Country VARCHAR(30) NOT NULL,
    Region VARCHAR(30) NOT NULL,
    TaxRate DECIMAL(13 , 4 ),
    ShipCoeff DECIMAL(13 , 4 )
)