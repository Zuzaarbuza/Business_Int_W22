create table Dim_Customer (
	PK_DimCustomer INT primary key,
    AccountNumber varchar(30) not null,
    FullName varchar(150),
    Gender varchar(1),
    Age INT
)