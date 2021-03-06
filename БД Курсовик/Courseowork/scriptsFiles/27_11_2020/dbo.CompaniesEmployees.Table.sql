USE [ARCs]
GO
/****** Object:  Table [dbo].[CompaniesEmployees]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesEmployees](
	[ID_company] [int] NOT NULL,
	[ID_employee] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (1, 1)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (1, 2)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (1, 3)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (1, 4)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (1, 5)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (2, 6)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (2, 7)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (2, 8)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (2, 9)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (2, 10)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (3, 11)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (3, 12)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (3, 13)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (3, 14)
INSERT [dbo].[CompaniesEmployees] ([ID_company], [ID_employee]) VALUES (3, 15)
/****** Object:  Index [PK_CompaniesEmployees]    Script Date: 27.11.2020 21:11:32 ******/
ALTER TABLE [dbo].[CompaniesEmployees] ADD  CONSTRAINT [PK_CompaniesEmployees] PRIMARY KEY NONCLUSTERED 
(
	[ID_company] ASC,
	[ID_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompaniesEmployees]  WITH CHECK ADD  CONSTRAINT [FK_CompaniesEmployees_Company] FOREIGN KEY([ID_company])
REFERENCES [dbo].[Companies] ([ID_company])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompaniesEmployees] CHECK CONSTRAINT [FK_CompaniesEmployees_Company]
GO
ALTER TABLE [dbo].[CompaniesEmployees]  WITH CHECK ADD  CONSTRAINT [FK_CompaniesEmployees_Employee] FOREIGN KEY([ID_employee])
REFERENCES [dbo].[Employees] ([ID_employee])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompaniesEmployees] CHECK CONSTRAINT [FK_CompaniesEmployees_Employee]
GO
