USE [ARCs]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID_service] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ID_company] [int] NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (1, N'Черновой ремонт', 1, 2350.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (2, N'Косметический ремонт', 1, 2790.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (3, N'Капитальный ремонт', 1, 4740.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (4, N'Черновой ремонт', 2, 2500.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (5, N'Косметический ремонт', 2, 2600.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (6, N'Капитальный ремонт', 2, 4800.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (7, N'Черновой ремонт', 3, 2350.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (8, N'Евроремонт', 3, 6300.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (9, N'Капитальный ремонт', 3, 4750.0000)
/****** Object:  Index [PK_Services]    Script Date: 27.11.2020 21:11:33 ******/
ALTER TABLE [dbo].[Services] ADD  CONSTRAINT [PK_Services] PRIMARY KEY NONCLUSTERED 
(
	[ID_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Company] FOREIGN KEY([ID_company])
REFERENCES [dbo].[Companies] ([ID_company])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Company]
GO
