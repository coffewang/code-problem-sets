/*Scrips to generate needed tables */

IF OBJECT_ID ('[dbo].[DimCustomer]','U') IS NOT NULL
	DROP TABLE [dbo].[DimCustomer]
GO
CREATE TABLE [dbo].[DimCustomer]  
(
	[CustomerKey] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(70) NULL,
	[Address 1] NVARCHAR(150) NULL,
	[Address 2] NVARCHAR(150) NULL,
	[City] NVARCHAR(100) NULL,
	[State] NVARCHAR(30) NULL,
	[Zip] NVARCHAR(20) NULL,
	[InsertedDate] DATETIME DEFAULT GETDATE(),
	[UpdatedDate] DATETIME DEFAULT GETDATE()
	PRIMARY KEY CLUSTERED 
	(
		[CustomerKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

IF OBJECT_ID ('[dbo].[DimProduct]','U') IS NOT NULL
	DROP TABLE [dbo].[DimProduct]
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] INT IDENTITY(1,1),
	[ItemID] INT NOT NULL,
	[ItemName] NVARCHAR(100) NULL,
	[ItemPriceUSD] FLOAT NULL,
	[ItemMarginPCT] FLOAT NULL,
	[ItemProfitUSD] FLOAT NULL,
	[InsertedDate] DATETIME DEFAULT GETDATE(),
	[UpdatedDate] DATETIME DEFAULT GETDATE()
	PRIMARY KEY CLUSTERED 
	(
		[ProductKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


IF OBJECT_ID ('[dbo].[DimEmployee]','U') IS NOT NULL
	DROP TABLE [dbo].[DimEmployee]
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] INT IDENTITY(1,1) NOT NULL,
	[EmpNum] INT NOT NULL,
	[FirstName] NVARCHAR(50) NULL,
	[MI] NVARCHAR(10) NULL,
	[LastName] NVARCHAR(50) NULL,
	[PreferredName] NVARCHAR(150) NULL,
	[CorpLocName] NVARCHAR(50) NULL,
	[StartDate] DATETIME NULL,
	[TerminatedDate] DATETIME NULL,
	[CurrRole] INT NULL,
	[SalesGoalVolume] FLOAT NULL,
	[SalesGoalProfit] FLOAT NULL,
	[SalesGoalDate] DECIMAL(18,0) NULL,
	[InsertedDate] DATETIME DEFAULT GETDATE(),
	[UpdatedDate] DATETIME DEFAULT GETDATE()
	PRIMARY KEY CLUSTERED 
	(
		[EmployeeKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

IF OBJECT_ID ('[dbo].[FactOrder]','U') IS NOT NULL
	DROP TABLE [dbo].[FactOrder]
GO
CREATE TABLE [dbo].[FactOrder](
	[FactOrderID] BIGINT IDENTITY(1,1),
	[OrderNumber] INT NOT NULL,
	[EmployeeKey] INT NOT NULL,
	[ProductKey] INT NOT NULL,
	[CustomerKey] INT NOT NULL,
	[OrderAmount] FLOAT NULL,
	[OrderAmount2] FLOAT NULL,
	[OrderQty] INT NULL,
	[InsertedDate] DATETIME DEFAULT GETDATE(),
	[UpdatedDate] DATETIME DEFAULT GETDATE()
	PRIMARY KEY CLUSTERED 
	(
		[FactOrderID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
)	

/*

IF OBJECT_ID ('[dbo].[DimDate]','U') IS NOT NULL
	DROP TABLE [dbo].[DimDate]
GO
CREATE TABLE [dbo].[DimDate]  
(
	[DateKey] [int] NOT NULL,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL,
	 CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED 
	(
		[DateKey] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
)	 


*/


