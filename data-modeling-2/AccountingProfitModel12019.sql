CREATE TABLE [dbo].[AccountingProfitModel12019](
	[APMKey] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[ItemMarginPct] [float] NULL,
	[ItemProfitDollars] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[APMKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)


