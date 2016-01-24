/***DimCustomer***/
INSERT INTO dbo.DimCustomer (Name,[Address 1],[Address 2],City,State,Zip)
SELECT [Customer Name],[Customer Address 1],[Customer Address 2],[Customer City],[Customer State],[Customer Zip]   
FROM  [Orders all v3]
--Insert dummy row
SET IDENTITY_INSERT  dbo.DimCustomer ON
INSERT INTO dbo.DimCustomer (CustomerKey,Name,[Address 1],[Address 2],City,State,Zip)
SELECT -1,'','','','','',''
SET IDENTITY_INSERT  dbo.DimCustomer OFF

/***DimEmployee***/
INSERT INTO dbo.DimEmployee (EmpNum,FirstName,MI,LastName,PreferredName,CorpLocName,StartDate,TerminatedDate,CurrRole,SalesGoalVolume,SalesGoalProfit,SalesGoalDate)
select EmpNum,FirstName,MI,LastName,PreferredName,CL.[CorpLocName],StartDate,TerminatedDate,CurrRole
,GMV3.[Sales goal volume],GMV3.[Sales goal profit],GMV3.[Sales goal date]
FROM [HREmployees] Emp 
LEFT JOIN [HRCorporateLocations] CL on Emp.CorpLocID=CL.CorpLocID
LEFT JOIN [dbo].[Goal mapping v3] GMV3
ON Emp.EmpNum = GMV3.[Employee Number]

--Insert dummy row
SET IDENTITY_INSERT  dbo.DimEmployee ON
INSERT INTO dbo.DimEmployee (EmployeeKey,EmpNum)
SELECT -1,-1
SET IDENTITY_INSERT  dbo.DimEmployee OFF

/***DimProduct***/
INSERT INTO dbo.DimProduct (ItemID,ItemName,ItemPriceUSD,ItemMarginPCT,ItemProfitUSD)
SELECT PL.ItemID,PL.ItemName,PL.ItemPriceUSD,APM.ItemMarginPct,APM.ItemProfitDollars
FROM dbo.tblPriceList PL 
LEFT JOIN dbo.[AccountingProfitModel12019] APM
ON PL.ItemID = APM.ItemID

--Insert dummy row
SET IDENTITY_INSERT  dbo.DimProduct ON
INSERT INTO dbo.DimProduct (ProductKey,ItemID)
SELECT -1,-1
SET IDENTITY_INSERT  dbo.DimProduct OFF


/***[FactOrder]***/
INSERT INTO [dbo].[FactOrder]([OrderNumber],[EmployeeKey],[ProductKey],[CustomerKey],[OrderAmount],[OrderAmount2],[OrderQty])
SELECT [Order Number],ISNULL([EmployeeKey],-1),ISNULL([ProductKey],-1),ISNULL([CustomerKey],-1)
,O.[Order Amount US Dollars]
,OI.[Item Quantity]*Prod.[ItemPriceUSD]
,OI.[Item Quantity]
FROM [dbo].[Orders all v3] O
LEFT JOIN [dbo].[Order items all v3] OI
ON O.[Order Number] = OI.[Parent Order Number]
LEFT JOIN [dbo].[DimEmployee] Emp
ON O.[Employee Number] = Emp.EmpNum
LEFT JOIN [dbo].[DimCustomer] Cus
ON O.[Customer Name] = Cus.Name --use all the customer attribute to lookup the customer key if customer name is not unique
AND ISNULL(O.[Customer Address 1],'') = ISNULL(Cus.[Address 1],'')
AND ISNULL(O.[Customer Address 2],'') = ISNULL(Cus.[Address 2],'')
AND ISNULL(O.[Customer City],'') = ISNULL(Cus.[City],'')
AND ISNULL(O.[Customer State],'') = ISNULL(Cus.[State],'')
AND ISNULL(O.[Customer Zip],'') = ISNULL(Cus.[Zip],'')
LEFT JOIN  [dbo].[DimProduct] Prod
ON OI.[Item ID] = Prod.ItemID




