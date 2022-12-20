CREATE TABLE BI_Bikes_50.TB_ShipMethod (
    ShipMethodID INT PRIMARY KEY NOT NULL,
    ShipMethodName VARCHAR(50) NOT NULL,
    ShipBase DECIMAL(13 , 4 ) NOT NULL,
    ShipRate DECIMAL(13 , 4 ) NOT NULL
)
