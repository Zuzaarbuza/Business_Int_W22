create table Dim_Location (
	PK_DimLocation INT primary key not null,
    Country varchar(30) not null,
    Region varchar(30) not null,
    TaxRate decimal(13,4),
    ShipCoeff decimal(13,4)
)