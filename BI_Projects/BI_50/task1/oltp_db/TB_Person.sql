CREATE TABLE BI_Bikes_50.TB_Person (
    PersonID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(1),
    Birthdate DATE
)