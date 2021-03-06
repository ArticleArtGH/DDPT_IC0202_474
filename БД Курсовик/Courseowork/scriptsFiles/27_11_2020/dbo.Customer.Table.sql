USE [ARCs]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID_customer] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](70) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Patronymic] [nvarchar](70) NOT NULL,
	[Phone] [char](20) NOT NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (1, N'Кузьмин', N'Святослав', N'Андреевич', N'+79117640001        ', N'')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (2, N'Шилов', N'Владислав', N'Владислав', N'+79520550002        ', N'shilovVV0002@mail.ru')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (3, N'Рожкова', N'Марфа', N'Иринеевна', N'+79229830003        ', N'RozhkovaMarphaE0003')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (4, N'Щербаков', N'Никифор', N'Витальевич', N'+79625530004        ', N'')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (5, N'Харитонова', N'Наталия', N'Григорьевна', N'+79999640005        ', N'KharitonovaNG0005@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
