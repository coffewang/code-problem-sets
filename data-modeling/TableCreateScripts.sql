/*Create test database SalesDM*/
/*
USE [master]
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'SalesDM')
DROP DATABASE [SalesDM]
GO

CREATE DATABASE [SalesDM]
*/


/*Create tables and insert test data */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesGroup]') AND type in (N'U'))
DROP TABLE [dbo].[SalesGroup]
GO

CREATE TABLE [dbo].[SalesGroup](
	[SalesGroupID] [smallint] NOT NULL,
	[SalesGroupName] NVARCHAR(50) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesGroup_SalesGroupID] PRIMARY KEY CLUSTERED 
(
	[SalesGroupID] ASC
)
) ON [PRIMARY]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesPerson]') AND type in (N'U'))
DROP TABLE [dbo].[SalesPerson]
GO

CREATE TABLE [dbo].[SalesPerson](
	[SalesPersonSurrogateID] [int] IDENTITY(1,1) NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[SalesPersonName] NVARCHAR(25) NULL,
	[SalesGroupID] [smallint] NOT NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CurrentFlag] [tinyint] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesPerson_SalesPersonID] PRIMARY KEY CLUSTERED 
(
	[SalesPersonSurrogateID] ASC
)
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[SalesPerson]  WITH CHECK ADD  CONSTRAINT [FK_SalesPerson_SalesGroupID] FOREIGN KEY([SalesGroupID])
REFERENCES [dbo].[SalesGroup] ([SalesGroupID])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [FK_SalesPerson_SalesGroupID]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] NVARCHAR(50) NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Products_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)
) ON [PRIMARY]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO

CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] NVARCHAR(25) NULL,
	[Gender] NVARCHAR(1) NULL,
	[Address] NVARCHAR(120),
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)
) ON [PRIMARY]

GO

SELECT * FROM [dbo].[Customer] 
 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesOrder]') AND type in (N'U'))
DROP TABLE [dbo].[SalesOrder]
GO

CREATE TABLE [dbo].[SalesOrder](
	[SalesOrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[LineTotal]  AS (isnull([OrderQty]*[UnitPrice],(0.00))),
	[OrderDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrder_SaleOrderID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrder_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO 
ALTER TABLE [dbo].[SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrder_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

ALTER TABLE [dbo].[SalesOrder] CHECK CONSTRAINT [FK_SalesOrder_CustomerID]
GO 
ALTER TABLE [dbo].[SalesOrder] CHECK CONSTRAINT [FK_SalesOrder_ProductID]
GO

/*Insert test data*/
INSERT INTO [dbo].[SalesGroup]([SalesGroupID],[SalesGroupName],[ModifiedDate])
SELECT 1, 'SG 1', getdate()
UNION 
SELECT 2, 'SG 2', getdate()
UNION 
SELECT 3, 'SG 3', getdate()
UNION 
SELECT 4, 'SG 4', getdate()
UNION 
SELECT 5, 'SG 5', getdate()

select * from [dbo].[SalesGroup] 

INSERT INTO [dbo].[SalesPerson]([SalesPersonID],[SalesPersonName],[SalesGroupID],[BeginDate],[EndDate],[CurrentFlag],[ModifiedDate])
SELECT 1,'SalesPerson 1',1,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 2,'SalesPerson 2',2,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 3,'SalesPerson 3',3,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 4,'SalesPerson 4',4,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 5,'SalesPerson 5',5,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 6,'SalesPerson 6',1,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 7,'SalesPerson 7',2,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 8,'SalesPerson 8',3,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 9,'SalesPerson 9',4,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() UNION ALL 
SELECT 10,'SalesPerson 10',5,DATEADD(M,-3*3,GETDATE()),DATEADD(M,-3,GETDATE()),0, GETDATE() 
UNION ALL
SELECT 1,'SalesPerson 1',2,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 2,'SalesPerson 2',3,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 3,'SalesPerson 3',4,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 4,'SalesPerson 4',5,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 5,'SalesPerson 5',1,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 6,'SalesPerson 6',2,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 7,'SalesPerson 7',3,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 8,'SalesPerson 8',4,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 9,'SalesPerson 9',5,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() UNION ALL 
SELECT 10,'SalesPerson 10',1,DATEADD(M,-3,GETDATE()),NULL,1, GETDATE() 

SELECT * FROM dbo.SalesPerson

INSERT INTO [dbo].[Products]([ProductName], [StandardCost], [ListPrice], [SellStartDate],[ModifiedDate])
SELECT 'Product A', 1.00, 2.5,DATEADD(MM,-15,GETDATE()),GETDATE() UNION ALL
SELECT 'Product B', 1.00, 3.5,DATEADD(MM,-13,GETDATE()),GETDATE() UNION ALL
SELECT 'Product C', 2.00, 4.5,DATEADD(MM,-12,GETDATE()),GETDATE() UNION ALL
SELECT 'Product D', 3.00, 5.5,DATEADD(MM,-16,GETDATE()),GETDATE() UNION ALL
SELECT 'Product E', 4.00, 7.5,DATEADD(MM,-18,GETDATE()),GETDATE() 

SELECT * FROM [dbo].[Products]


INSERT INTO [dbo].[Customer]([CustomerName],[Gender],[Address],[ModifiedDate])
SELECT 'Customer 1', 'M', '626 HaiDian Street', GETDATE() UNION ALL 
SELECT 'Customer 2', 'F', '1170 Caoxi Rd', GETDATE() UNION ALL 
SELECT 'Customer 3', 'M', '8255 Nanjing Road', GETDATE() UNION ALL 
SELECT 'Customer 4', 'F', '719 William Way', GETDATE() UNION ALL 
SELECT 'Customer 5', 'M', '3235 Shengli Street', GETDATE() 

--truncate table [SalesOrder]
INSERT INTO [dbo].[SalesOrder]([OrderQty],[SalesPersonID],[CustomerID],[ProductID],[UnitPrice],[OrderDate],[ModifiedDate])
SELECT 1, 1,1, 2, 2.0,DATEADD(MM,-1,GETDATE()), GETDATE() UNION ALL  
SELECT 5, 2,1, 1, 3.0,DATEADD(MM,-2,GETDATE()), GETDATE() UNION ALL  
SELECT 3, 3,1, 4, 4.0,DATEADD(MM,-3,GETDATE()), GETDATE() UNION ALL  
SELECT 8, 4,1, 3, 5.0,DATEADD(MM,-4,GETDATE()), GETDATE() UNION ALL  
SELECT 6, 5,1, 5, 6.0,DATEADD(MM,-5,GETDATE()), GETDATE() UNION ALL  
SELECT 1, 6,1, 2, 7.0,DATEADD(MM,-1,GETDATE()), GETDATE() UNION ALL  
SELECT 5, 7,1, 1, 8.0,DATEADD(MM,-2,GETDATE()), GETDATE() UNION ALL  
SELECT 3, 9,1, 4, 2.0,DATEADD(MM,-6,GETDATE()), GETDATE() UNION ALL  
SELECT 8, 9,1, 3, 3.0,DATEADD(MM,-8,GETDATE()), GETDATE() UNION ALL  
SELECT 6, 10,1, 5, 2.0,DATEADD(MM,-3,GETDATE()), GETDATE() UNION ALL  
SELECT 1, 1,1, 2, 4.0,DATEADD(MM,-5,GETDATE()), GETDATE() UNION ALL  
SELECT 5, 2,1, 1, 2.0,DATEADD(MM,-1,GETDATE()), GETDATE() UNION ALL  
SELECT 3, 3,1, 4, 3.0,DATEADD(MM,-8,GETDATE()), GETDATE() UNION ALL  
SELECT 8, 4,1, 3, 2.0,DATEADD(MM,-2,GETDATE()), GETDATE() UNION ALL  
SELECT 6, 5,1, 5, 6.0,DATEADD(MM,-1,GETDATE()), GETDATE()   

SELECT * FROM dbo.SalesOrder

