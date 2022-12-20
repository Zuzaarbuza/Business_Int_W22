INSERT INTO BI_BikesDW_50.Dim_Customer
SELECT 
    customer.CustomerID,
    customer.AccountNumber,
    CONCAT(person.FirstName,
            ' ',
            person.MiddleName,
            ' ',
            person.MiddleName),
    person.Gender,
    FLOOR(DATEDIFF('2021-09-30', person.Birthdate) / 365)
FROM
    BI_Bikes_50.TB_Customer AS customer
        JOIN
    BI_Bikes_50.TB_Person AS person ON customer.PersonID = person.PersonID