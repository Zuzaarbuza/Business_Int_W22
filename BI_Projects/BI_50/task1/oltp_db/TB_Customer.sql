create table BI_Bikes_50.TB_Customer (
	CustomerID INT primary key,
    PersonID INT,
    AccountNumber varchar(30) not null,
    FOREIGN KEY (PersonID) REFERENCES TB_Person(PersonID)
)