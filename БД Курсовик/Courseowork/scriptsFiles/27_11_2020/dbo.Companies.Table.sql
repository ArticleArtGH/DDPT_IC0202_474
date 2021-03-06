USE [ARCs]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[ID_company] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [char](20) NOT NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[ID_company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([ID_company], [Name], [Phone], [Email]) VALUES (1, N'Студия Ремонтов', N'+78124674230        ', N'')
INSERT [dbo].[Companies] ([ID_company], [Name], [Phone], [Email]) VALUES (2, N'SBAX', N'+78126605520        ', N'sales@sbax.ru')
INSERT [dbo].[Companies] ([ID_company], [Name], [Phone], [Email]) VALUES (3, N'Еврохаус', N'+78123895599        ', N'info@eurohouse.spb.ru')
SET IDENTITY_INSERT [dbo].[Companies] OFF
