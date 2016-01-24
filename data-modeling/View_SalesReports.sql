CREATE VIEW vw_SalesReports
AS
SELECT  [SalesPersonName],[SalesGroupName]
,SUM(OrderQty) AS TotalSalesQty
,SUM(LineTotal)AS TotalSalesAmount
,COUNT(DISTINCT ProductID) TotalSalesProduct 
,COUNT(DISTINCT CustomerID) TotalCustomersResposible 
FROM dbo.SalesOrder SO
LEFT JOIN dbo.SalesPerson SP
ON SO.[SalesPersonID] = SP.[SalesPersonID] 
AND SO.[OrderDate] >= ISNULL(SP.BeginDate,'1900-01-01')
AND SO.[OrderDate] <= ISNULL(SP.EndDate,GETDATE())
INNER JOIN dbo.SalesGroup SG
ON SP.SalesGroupID = SG.SalesGroupID
WHERE [OrderDate] >= CONVERT(DATE,DATEADD(M,-12,GETDATE()))
GROUP BY [SalesPersonName],[SalesGroupName]
ORDER BY [SalesPersonName],[SalesGroupName]

GO
 
 
  