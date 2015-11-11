CREATE TABLE [dbo].[HREmployees](
	[EmpNum] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MI] [nvarchar](10) NULL,
	[LastName] [nvarchar](50) NULL,
	[PreferredName] [nvarchar](150) NULL,
	[CorpLocID] [int] NULL,
	[StartDate] [datetime] NULL,
	[TerminatedDate] [datetime] NULL,
	[CurrRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

