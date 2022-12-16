create table Dim_Date (
	PK_DimDate INT primary key not null,
	FullDateAlternateKey date,
    DayNumberOfWeek int,
    EnglishDayNameOfWeek varchar(50),
    DayNumberOfMonth int,
    DayNumberOfYear int,
    WeekNumberOfYear int,
    EnglishMonthName varchar(50),
    MonthNumberOfYear int,
    CalendarQuarter int,
    CalendarYear int
)