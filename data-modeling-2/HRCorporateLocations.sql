USE [RecruitingScenario]
GO

/****** Object:  Table [dbo].[HRCorporateLocations]    Script Date: 11/10/2015 12:52:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HRCorporateLocations](
	[CorpLocID] [int] IDENTITY(1,1) NOT NULL,
	[CorpLocName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CorpLocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO


