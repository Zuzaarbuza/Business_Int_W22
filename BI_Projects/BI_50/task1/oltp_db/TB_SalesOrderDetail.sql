create table BI_Bikes_50.TB_SalesOrderDetail (
	SalesOrderDetailID INT primary key not null,
    SalesOrderID int not null,
    ProductID int not null,
    OrderQty  int not null,
    UnitPrice decimal(13,4) not null,
    
    foreign key (SalesOrderID) references TB_SalesOrderHeader(SalesOrderID),
    foreign key (ProductID) references TB_Product(ProductID)
)