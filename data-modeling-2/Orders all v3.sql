CREATE TABLE [dbo].[Orders all v3](
	[Order Number] [int] IDENTITY(1,1) NOT NULL,
	[Order Amount US Dollars] [money] NULL,
	[Customer Name] [nchar](70) NULL,
	[Customer Address 1] [nchar](150) NULL,
	[Customer Address 2] [nchar](150) NULL,
	[Customer City] [nchar](100) NULL,
	[Customer State] [nchar](30) NULL,
	[Customer Zip] [nchar](20) NULL,
	[Employee Number] [int] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[Order Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


