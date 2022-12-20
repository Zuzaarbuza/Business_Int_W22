CREATE TABLE BI_Bikes_50.TB_Address (
    AddressID INT PRIMARY KEY,
    CountryID INT NOT NULL,
    AddressLine VARCHAR(60) NOT NULL,
    City VARCHAR(30) NOT NULL,
    PostalCode VARCHAR(15) NOT NULL,
    
    FOREIGN KEY (CountryID) REFERENCES TB_Country (CountryID)
)