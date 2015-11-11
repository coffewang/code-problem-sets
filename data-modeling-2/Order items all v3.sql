USE [RecruitingScenario]
GO

/****** Object:  Table [dbo].[Order items all v3]    Script Date: 11/10/2015 12:52:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order items all v3](
	[Order Item Number] [int] IDENTITY(1,1) NOT NULL,
	[Parent Order Number] [int] NULL,
	[Item ID] [int] NULL,
	[Item Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order Item Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

ALTER TABLE [dbo].[Order items all v3]  WITH CHECK ADD  CONSTRAINT [Order items all v3 FK] FOREIGN KEY([Parent Order Number])
REFERENCES [dbo].[Orders all v3] ([Order Number])
GO

ALTER TABLE [dbo].[Order items all v3] CHECK CONSTRAINT [Order items all v3 FK]
GO


