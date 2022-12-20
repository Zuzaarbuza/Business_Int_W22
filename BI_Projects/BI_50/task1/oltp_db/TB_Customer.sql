CREATE TABLE BI_Bikes_50.TB_Customer (
    CustomerID INT PRIMARY KEY NOT NULL,
    PersonID INT NOT NULL,
    AccountNumber VARCHAR(30) NOT NULL,
    
    FOREIGN KEY (PersonID) REFERENCES TB_Person (PersonID)
)