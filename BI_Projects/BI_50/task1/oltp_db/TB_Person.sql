create table BI_Bikes_50.TB_Person (
	PersonID INT primary key not null,
    FirstName varchar(50) not null,
    MiddleName varchar(50),
    LastName varchar(50) not null,
    Gender varchar(1),
    Birthdate date
)