create table BI_Bikes_50.TB_Country (
	CountryID INT primary key,
    Country varchar(30) not null,
    Region varchar(30) not null,
    TaxRate decimal(13,4),
    ShipCoeff decimal(13,4)
)