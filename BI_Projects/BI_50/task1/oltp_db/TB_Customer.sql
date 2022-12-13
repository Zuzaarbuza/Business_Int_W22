create table BI_Bikes_50.TB_Customer (
	CustomerID INT primary key not null,
    PersonID INT not null,
    AccountNumber varchar(30) not null,
    
    FOREIGN KEY (PersonID) REFERENCES TB_Person(PersonID)
)