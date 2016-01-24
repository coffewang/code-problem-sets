# Data Modeling

## Scenario Outline

You have been asked by a client to design and implement a new data mart to help them understand the profitability of their sales channel. They are particularly interested in understanding which members of their sales team are their top performers both by volume and profitability.

## Recommended architecture

What database system do you recommend? Why do you recommend this system?
<Coffie>
SQL SERVER will be recommended based on below reasons.
1. Choose sql server can also use Microsoft BI tools(like, SSIS/SSAS/SSRS) to do data process and analysis.
2. Compare with other DB system, sql server is secure, reliable and cost effective.
3. Sql Server can be well supported by other application and it has good scalability.
4. It can be migrated to Azure if you choose SQL Azure.
5. By leveraging Excel as well power BI tools, you can simply do rich data analysis.
6. You can get official technical support for MS in case any problem.
</Coffie>
##Current state

Initial discovery exercises with the client’s stakeholders have identified the following tables as being of potential interest.

###Tables
* Goal mapping v3
* HREmployees
* HRCorporateLocations
* Orders all v3
* Order items all v3
* tblInventoryCategories
* tblPriceList
* AccountingProfitModel2019

Full schemas of these tables are attached with this exercise.

##KPI definition

What KPIs would you recommend for the client?
<Coffie>
Below KPIs could be defined for client.
1.Total Order Amount--Total order amount US Dollars
2.Total Order Qty--Total order quantity
3.Order Count--Total orders
4.Customer Count--Total customers
5.Sales Product Count--Distinct count products which have been ordered
6.Sales Completion Rate--The rate of sales completion
7.Total Sales Margin
8.Total Sales Profit
9.Avg Unit Price
10.Avg Sales Amount
</Coffie>

 
##Recommend a data model

What data model would you recommend for the client? Describe both the model selected and the reasons for choosing this model.
<Coffie>
A "Star Schema" dimension model will be chosen for the client.
In the "Star Schema", there is fact table stores transaction data(such as orders), while there are also dimension tables like customer, store and product,dimension tables are each connected to the fact table via their primary key, which is a foreign key for the fact table, the relationships between fact and dimension tables simply like its name "Star". 

"Star Schema" has less join,comparing with snowflake model it has good performance relatively. It's useful for metric analysis and appliable for datamarts with simple relationships, which should be 2 reasons for us to choose this model.
</Coffie> 
##Implement the data model
Write the SQL statements to generate tables you are recommending.
<Coffie>
Actually there are confusion about this question, not sure above list tables are all the source table I can use, or I still can add some other tables by myself.
If I just use above tables, then I will create 3 dimension tables and 1 fact table(the gruanularity is Order,Customer,Employee,Product).
Pls refer to new added TableCreateScript.sql
</Coffie>
Write SQL statements to populate your tables.
<Coffie>
Pls refer to new added DataPopulatingScripts.sql
</Coffie>
 
##Solve the business problem
Write SQL statements to be used by the analytics team to identify top performers by volume and profitability.
<Coffie>
--Get top 5 performers by volume and profitability
SELECT TOP 5 Emp.EmpNum, SUM([OrderQty]*Prod.ItemPriceUSD) as [TotalSalesAmount]
,SUM([OrderQty]*Prod.ItemProfitUSD) as [TotalSalesProfit]
FROM [dbo].[FactOrder] as Fact
INNER JOIN dbo.DimEmployee Emp
ON Fact.EmployeeKey = Emp.EmployeeKey
INNER JOIN DimProduct as Prod
ON Fact.ItemKey = Prod.ItemKey
GROUP BY Emp.EmpNum
ORDER BY [TotalSalesAmount] DESC,[TotalSalesProfit] DESC
</Coffie>