USE [ARCs]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ID_contract] [int] NOT NULL,
	[ID_customer] [int] NOT NULL,
	[ID_service] [int] NOT NULL,
	[Additional_expenses] [money] NOT NULL,
	[Date_beginning] [date] NOT NULL,
	[Date_expiration] [date] NOT NULL,
	[Cost] [money] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (1, 1, 5, 1500.0000, CAST(N'2020-09-21' AS Date), CAST(N'2020-11-20' AS Date), 92500.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (2, 2, 1, 500.0000, CAST(N'2020-10-05' AS Date), CAST(N'2020-11-04' AS Date), 81500.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (3, 3, 8, 5000.0000, CAST(N'2020-10-11' AS Date), CAST(N'2020-12-01' AS Date), 225500.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (4, 4, 9, 4500.0000, CAST(N'2021-01-21' AS Date), CAST(N'2021-03-22' AS Date), 170750.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (5, 5, 7, 1000.0000, CAST(N'2021-02-14' AS Date), CAST(N'2021-03-17' AS Date), 93000.0000)
/****** Object:  Index [PK_Contract]    Script Date: 27.11.2020 21:11:32 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [PK_Contract] PRIMARY KEY NONCLUSTERED 
(
	[ID_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Customer] FOREIGN KEY([ID_customer])
REFERENCES [dbo].[Customer] ([ID_customer])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Customer]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Service] FOREIGN KEY([ID_service])
REFERENCES [dbo].[Services] ([ID_service])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Service]
GO
