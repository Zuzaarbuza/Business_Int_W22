create table BI_Bikes_50.TB_ShipMethod (
	ShipMethodID INT primary key,
    ShipMethodName varchar(50) not null,
    ShipBase decimal(13,4) not null,
    ShipRate decimal(13,4) not null
)
