drop function if exists `compute_date`;

create function compute_date(Datum date)
returns int deterministic
Return year(Datum) * 10000 + month(Datum) * 100 + day(Datum);
-- Probably could be done simpler, but SQL is just a mess

insert into BI_BikesDW_50.Dim_Date
select compute_date(cdate), cdate, dayofweek(cdate), dayname(cdate), dayofmonth(cdate), dayofyear(cdate), weekofyear(cdate), monthname(cdate), month(cdate), floor((month(cdate) - 1) / 3) + 1, year(cdate) from 
(select distinct OrderDate as cdate from (select OrderDate from BI_Bikes_50.TB_SalesOrderHeader union select DueDate from BI_Bikes_50.TB_SalesOrderHeader union select ShipDate from BI_Bikes_50.TB_SalesOrderHeader) as Dates) as Distinct_Dates
