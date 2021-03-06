USE [ARCs]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID_employee] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](70) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Patronymic] [nvarchar](70) NOT NULL,
	[Phone] [char](20) NOT NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (1, N'Жуков', N'Дмитрий', N'Вениаминович', N'+79994670001        ', N'zdv01@mail.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (2, N'Тарасов', N'Леонид', N'Алексеевич', N'+79994670002        ', N'tla02@mail.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (3, N'Белоусов', N'Антон', N'Аркадьевич', N'+79994670003        ', N'baa03@mail.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (4, N'Бобылёв', N'Панкратий', N'Мэлсович', N'+79994670004        ', N'bpm04@mail.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (5, N'Власова', N'Эльвира', N'Львовна', N'+79994670005        ', N'')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (6, N'Силин', N'Бронислав', N'Лаврентьевич', N'+79996600001        ', N'sbl01@sbax.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (7, N'Беспалов', N'Борис', N'Филиппович', N'+79996600002        ', N'bbf02@sbax.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (8, N'Хохлов', N'Тарас', N'Анатольевич', N'+79996600003        ', N'')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (9, N'Лихачёв', N'Иосиф', N'Федорович', N'+79996600004        ', N'lif04@sbax.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (10, N'Субботина', N'Веста', N'Иринеевна', N'+79996600005        ', N'svi05@sbax.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (11, N'Павлов', N'Емельян', N'Федотович', N'+79993890001        ', N'pef01mail@peremont.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (12, N'Копылов', N'Дмитрий', N'Артемович', N'+79993890002        ', N'kda02mail@peremont.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (13, N'Николаев', N'Давид', N'Николаевич', N'+79993890003        ', N'ndn03mail@peremont.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (14, N'Доронин', N'Федор', N'Аркадьевич', N'+79993890004        ', N'dfa04mail@peremont.ru')
INSERT [dbo].[Employees] ([ID_employee], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (15, N'Крюкова', N'Светлана', N'Петровна', N'+79993890005        ', N'ksp05mail@peremont.ru')
SET IDENTITY_INSERT [dbo].[Employees] OFF
