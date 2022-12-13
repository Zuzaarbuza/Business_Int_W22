
create table BI_Bikes_50.TB_SalesOrderHeader (
	SalesOrderID INT primary key,
    SalesOrderNumber varchar(30) not null,
    OrderDate date not null,
    DueDate date not null,
    ShipDate date,
    OrderStatusID int not null,
    CustomerID int not null,
    BillToAddressID int not null,
    ShipToAddressID int not null,
    ShipMethodID int not null,
    FOREIGN KEY (OrderStatusID) REFERENCES TB_OrderStatus(OrderStatusID),
    FOREIGN KEY (CustomerID) REFERENCES TB_Customer(CustomerID),
    FOREIGN KEY (BillToAddressID) REFERENCES TB_Address(AddressID),
    FOREIGN KEY (ShipToAddressID) REFERENCES TB_Address(AddressID),
    FOREIGN KEY (ShipMethodID) REFERENCES TB_ShipMethod(ShipMethodID)
)