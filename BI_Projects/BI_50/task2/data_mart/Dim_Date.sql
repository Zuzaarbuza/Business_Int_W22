CREATE TABLE BI_BikesDW_50.Dim_Date (
    PK_DimDate INT PRIMARY KEY NOT NULL,
    FullDateAlternateKey DATE,
    DayNumberOfWeek INT,
    EnglishDayNameOfWeek VARCHAR(50),
    DayNumberOfMonth INT,
    DayNumberOfYear INT,
    WeekNumberOfYear INT,
    EnglishMonthName VARCHAR(50),
    MonthNumberOfYear INT,
    CalendarQuarter INT,
    CalendarYear INT
)