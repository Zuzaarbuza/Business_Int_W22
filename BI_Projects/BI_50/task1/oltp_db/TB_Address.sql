create table BI_Bikes_50.TB_Address (
	AddressID INT primary key,
    CountryID INT,
    AddressLine varchar(60) not null,
    City varchar(30) not null,
    PostalCode varchar(15) not null,
    FOREIGN KEY (CountryID) REFERENCES TB_Country(CountryID)
)