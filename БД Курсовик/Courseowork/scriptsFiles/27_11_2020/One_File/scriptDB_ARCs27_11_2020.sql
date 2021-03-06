USE [master]
GO
/****** Object:  Database [ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE DATABASE [ARCs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ARCs_dat', FILENAME = N'E:\MS SQL Server 2017 Edition\Компоненты\MSSQL14.SQLEXPRESS\MSSQL\DATA\ARCs_dat' , SIZE = 8192KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ARCs_log', FILENAME = N'E:\MS SQL Server 2017 Edition\Компоненты\MSSQL14.SQLEXPRESS\MSSQL\DATA\ARCs_log' , SIZE = 2048KB , MAXSIZE = 5120KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [ARCs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ARCs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ARCs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ARCs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ARCs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ARCs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ARCs] SET ARITHABORT OFF 
GO
ALTER DATABASE [ARCs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ARCs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ARCs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ARCs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ARCs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ARCs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ARCs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ARCs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ARCs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ARCs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ARCs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ARCs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ARCs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ARCs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ARCs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ARCs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ARCs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ARCs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ARCs] SET  MULTI_USER 
GO
ALTER DATABASE [ARCs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ARCs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ARCs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ARCs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ARCs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ARCs] SET QUERY_STORE = OFF
GO
USE [ARCs]
GO
/****** Object:  User [uManager_ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE USER [uManager_ARCs] FOR LOGIN [Manager_ARCs] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [uEmployee_ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE USER [uEmployee_ARCs] FOR LOGIN [Employee_ARCs] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [uClient_ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE USER [uClient_ARCs] FOR LOGIN [Client_ARCs] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [rManager_ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE ROLE [rManager_ARCs]
GO
/****** Object:  DatabaseRole [rEmployee_ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE ROLE [rEmployee_ARCs]
GO
/****** Object:  DatabaseRole [rClient_ARCs]    Script Date: 27.11.2020 21:17:35 ******/
CREATE ROLE [rClient_ARCs]
GO
ALTER ROLE [rManager_ARCs] ADD MEMBER [uManager_ARCs]
GO
ALTER ROLE [rEmployee_ARCs] ADD MEMBER [uEmployee_ARCs]
GO
ALTER ROLE [rClient_ARCs] ADD MEMBER [uClient_ARCs]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 27.11.2020 21:17:36 ******/
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
/****** Object:  Table [dbo].[Services]    Script Date: 27.11.2020 21:17:36 ******/
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
/****** Object:  View [dbo].[CompaniesTheirServices]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании и их услуги
create view [dbo].[CompaniesTheirServices]
as
select C.Name as [Company Name], S.Name as [Services Name]--псевдонимы
from Companies as C, Services as S-- псевдонимы
where S.ID_company = C.ID_company
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27.11.2020 21:17:36 ******/
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
/****** Object:  View [dbo].[CustomersAndCompaniesNotEmail]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Заказчики без почты, а также компании
create view [dbo].[CustomersAndCompaniesNotEmail]
as
select ID_customer, Surname, Customer.Name as 'Customer Name', Patronymic, 
ID_company, Companies.Name as 'Company Name'
from Customer, Companies
where Customer.Email = '' and Companies.Email = ''
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 27.11.2020 21:17:36 ******/
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
/****** Object:  Table [dbo].[CompaniesEmployees]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesEmployees](
	[ID_company] [int] NOT NULL,
	[ID_employee] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CompaniesTheirEmployees]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании и их сотрудники
create view [dbo].[CompaniesTheirEmployees]
as
select C.ID_company, C.Name as 'Company Name', E.ID_employee, Surname, 
E.Name as 'Employee Name', Patronymic, E.Phone, E.Email
from Companies as C, Employees as E, CompaniesEmployees as CE
where CE.ID_company = C.ID_company and CE.ID_employee = E.ID_employee
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 27.11.2020 21:17:36 ******/
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
/****** Object:  View [dbo].[TermsOfWorkOfCompanies]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании с их услугами и сроками выполнения этих услуг
create view [dbo].[TermsOfWorkOfCompanies]
as
--select Cmp.ID_company, Cmp.Name as 'Company Name', S.Name as 'Service Name',
--Date_beginning, Date_expiration
--from Companies as Cmp, Services as S, Contract as Cnt
--where Cnt.ID_service = S.ID_service and 
--S.ID_company = Cmp.ID_company
--OR
select Cmp.ID_company, Cmp.Name 'Company Name', S.Name 'Service Name',
Date_beginning, Date_expiration
from Companies Cmp--, Services S, Contract Cnt
join Services S on Cmp.ID_company = S.ID_company
join Contract Cnt on Cnt.ID_service = S.ID_service
GO
/****** Object:  View [dbo].[TermsRepairsDays]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TermsRepairsDays]
as
	select Cr.Name as 'Name Customer', S.Name as 'Name Service',
	datediff(day, Ct.Date_beginning, Ct.Date_expiration) as 'Terms'
	from Customer as Cr, Services as S, Contract as Ct	
	where Ct.ID_service = S.ID_service and Ct.ID_customer = Cr.ID_customer
GO
/****** Object:  View [dbo].[CountEachServices]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Количество каждой услуги
create view [dbo].[CountEachServices]
as
	select Name, count(Name) as 'Count Services' 
	from Services 
	group by Name
GO
/****** Object:  View [dbo].[IncomeAllOrdersFulfilled]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[IncomeAllOrdersFulfilled]
as
	select sum(Cnt.Cost) 'Income'
	from Contract Cnt, Customer Csr,Services S
	where Cnt.ID_customer = Csr.ID_customer and Cnt.ID_service = S.ID_service
GO
/****** Object:  View [dbo].[CountCustomerEachCompany]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CountCustomerEachCompany]
as
	--select Cmp.Name 'Company Name', Count(Ctr.Name) 'Count Customer'
	--from Companies Cmp
	--join Services S on S.ID_company = Cmp.ID_company
	--join Contract Cnt on Cnt.ID_service = S.ID_service
	--join Customer Ctr on Cnt.ID_customer = Ctr.ID_customer 
	--group by Cmp.Name
	select Cmp.Name 'Company Name', Count(Ctr.Name) 'Count Customer'
	from Contract Cnt, Companies Cmp, Customer Ctr, Services S
	where Cnt.ID_customer = Ctr.ID_customer  and S.ID_company = Cmp.ID_company
	and Cnt.ID_service = S.ID_service
	group by Cmp.Name
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([ID_company], [Name], [Phone], [Email]) VALUES (1, N'Студия Ремонтов', N'+78124674230        ', N'')
INSERT [dbo].[Companies] ([ID_company], [Name], [Phone], [Email]) VALUES (2, N'SBAX', N'+78126605520        ', N'sales@sbax.ru')
INSERT [dbo].[Companies] ([ID_company], [Name], [Phone], [Email]) VALUES (3, N'Еврохаус', N'+78123895599        ', N'info@eurohouse.spb.ru')
SET IDENTITY_INSERT [dbo].[Companies] OFF
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
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (1, 1, 5, 1500.0000, CAST(N'2020-09-21' AS Date), CAST(N'2020-11-20' AS Date), 92500.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (2, 2, 1, 500.0000, CAST(N'2020-10-05' AS Date), CAST(N'2020-11-04' AS Date), 81500.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (3, 3, 8, 5000.0000, CAST(N'2020-10-11' AS Date), CAST(N'2020-12-01' AS Date), 225500.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (4, 4, 9, 4500.0000, CAST(N'2021-01-21' AS Date), CAST(N'2021-03-22' AS Date), 170750.0000)
INSERT [dbo].[Contract] ([ID_contract], [ID_customer], [ID_service], [Additional_expenses], [Date_beginning], [Date_expiration], [Cost]) VALUES (5, 5, 7, 1000.0000, CAST(N'2021-02-14' AS Date), CAST(N'2021-03-17' AS Date), 93000.0000)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (1, N'Кузьмин', N'Святослав', N'Андреевич', N'+79117640001        ', N'')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (2, N'Шилов', N'Владислав', N'Владислав', N'+79520550002        ', N'shilovVV0002@mail.ru')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (3, N'Рожкова', N'Марфа', N'Иринеевна', N'+79229830003        ', N'RozhkovaMarphaE0003')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (4, N'Щербаков', N'Никифор', N'Витальевич', N'+79625530004        ', N'')
INSERT [dbo].[Customer] ([ID_customer], [Surname], [Name], [Patronymic], [Phone], [Email]) VALUES (5, N'Харитонова', N'Наталия', N'Григорьевна', N'+79999640005        ', N'KharitonovaNG0005@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
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
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (1, N'Черновой ремонт', 1, 2350.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (2, N'Косметический ремонт', 1, 2790.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (3, N'Капитальный ремонт', 1, 4740.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (4, N'Черновой ремонт', 2, 2500.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (5, N'Косметический ремонт', 2, 2600.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (6, N'Капитальный ремонт', 2, 4800.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (7, N'Черновой ремонт', 3, 2350.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (8, N'Евроремонт', 3, 6300.0000)
INSERT [dbo].[Services] ([ID_service], [Name], [ID_company], [Price]) VALUES (9, N'Капитальный ремонт', 3, 4750.0000)
/****** Object:  Index [PK_CompaniesEmployees]    Script Date: 27.11.2020 21:17:36 ******/
ALTER TABLE [dbo].[CompaniesEmployees] ADD  CONSTRAINT [PK_CompaniesEmployees] PRIMARY KEY NONCLUSTERED 
(
	[ID_company] ASC,
	[ID_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Contract]    Script Date: 27.11.2020 21:17:36 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [PK_Contract] PRIMARY KEY NONCLUSTERED 
(
	[ID_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Services]    Script Date: 27.11.2020 21:17:36 ******/
ALTER TABLE [dbo].[Services] ADD  CONSTRAINT [PK_Services] PRIMARY KEY NONCLUSTERED 
(
	[ID_service] ASC
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
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Company] FOREIGN KEY([ID_company])
REFERENCES [dbo].[Companies] ([ID_company])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Company]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsCompanies]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании
create proc [dbo].[deleteAllRecordsCompanies]
as
begin
	delete from Companies
end
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsCompaniesEmployees]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--КомпанииСотрудники
create proc [dbo].[deleteAllRecordsCompaniesEmployees]
as
begin
	delete from CompaniesEmployees
end
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsContract]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Договор
create proc [dbo].[deleteAllRecordsContract]
as
begin
	delete from Contract
end
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsCustomer]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteAllRecordsCustomer]
as
begin
	delete from Customer
end
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsEmployees]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники
create proc [dbo].[deleteAllRecordsEmployees]
as
begin
	delete from Employees
end
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsServices]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Услуги
create proc [dbo].[deleteAllRecordsServices]
as
begin
	delete from Services
end
GO
/****** Object:  StoredProcedure [dbo].[deleteData_I]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteData_I]( @i int  )
as
begin
	delete from Companies
	where ID_company = @i
end
GO
/****** Object:  StoredProcedure [dbo].[deleteData_NPE]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteData_NPE]( @nvc nvarchar(250), @c char(20), @vc varchar(250) )
as
begin
	delete from Companies
	where Name = @nvc and Phone = @c and Email = @vc
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataCompanies_iSiF]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--удаление данных Компании по диапозону
create proc [dbo].[deleteDataCompanies_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
	while @iS <= @iF
	begin
		delete from Companies
		where ID_company = @iS
		set @iS += 1
	end
	else
	while @iF <= @iS
	begin
		delete from Companies
		where ID_company = @iF
		set @iF += 1
	end
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataCompaniesEmployees_iSiF]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--КомпанииСотрудники (по диапозону индексов)
create proc [dbo].[deleteDataCompaniesEmployees_iSiF]( @iCmpS int, @iCmpF int,
@iEmpS int, @iEmpF int )
as
begin
	declare @x int
	if @iCmpS > @iCmpF
	begin
		set @x = @iCmpS 
		set @iCmpS = @iCmpF
		set @iCmpF = @x
	end
	if @iEmpS > @iEmpF
	begin
		set @x = @iEmpS
		set @iEmpS = @iEmpF
		set @iEmpF = @x
	end
	set @x = @iEmpS
	while @iCmpS <= @iCmpF 
	begin
		while @iEmpS <= @iEmpF
		begin
			delete from CompaniesEmployees
			where ID_company = @iCmpS and ID_employee = @iEmpS
			set @iEmpS += 1
		end
		set @iCmpS += 1
		set @iEmpS = @x
	end
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataContract_iSiF]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Договор (по диапозону индексов)
create proc [dbo].[deleteDataContract_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Contract
			where ID_contract = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Contract
			where ID_contract = @iF
			set @iF += 1
		end
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataCustomer_iSiF]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteDataCustomer_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Customer
			where ID_customer = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Customer
			where ID_customer = @iF
			set @iF += 1
		end
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataEmployees_Content]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники (по содержимому)
create proc [dbo].[deleteDataEmployees_Content]( @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	delete from Employees
	where Surname = @nvcS and Name = @nvcN and Patronymic = @nvcP and Phone = @c 
	and Email = @vc
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataEmployees_iSiF]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники (по диапозону индексов)
create proc [dbo].[deleteDataEmployees_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Employees
			where ID_employee = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Employees
			where ID_employee = @iF
			set @iF += 1
		end
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDataServices_iSiF]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сервисы (по диапозону индексов)
create proc [dbo].[deleteDataServices_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Services
			where ID_service = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Services
			where ID_service = @iF
			set @iF += 1
		end
end
GO
/****** Object:  StoredProcedure [dbo].[inputDataCompanies]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inputDataCompanies]( @nvc nvarchar(250), @c char(20), @vc varchar(250) )
as 
begin
	insert into Companies(Name, Phone, Email)
	values(@nvc, @c, @vc)
end	
GO
/****** Object:  StoredProcedure [dbo].[inputDataCompaniesEmployees]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--КомпанииСотрудники
create proc [dbo].[inputDataCompaniesEmployees]( @iC int, @iE int )
as
begin
	insert into CompaniesEmployees(ID_company, ID_employee)
	values(@iC, @iE)
end
GO
/****** Object:  StoredProcedure [dbo].[inputDataContract]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inputDataContract]( @iCon int, @iCus int, @iS int, @mAdd money,
@dateB date, @dateE date, @mC money )
as
begin
	insert into Contract(ID_contract, ID_customer, ID_service, Additional_expenses,
	Date_beginning, Date_expiration, Cost)
	values(@iCon, @iCus, @iS, @mAdd, @dateB, @dateE, @mC)
end
GO
/****** Object:  StoredProcedure [dbo].[inputDataCustomer]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Заполнение таблицы Заказчик
create proc [dbo].[inputDataCustomer]( @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	insert into Customer(Surname, Name, Patronymic, Phone, Email)
	values(@nvcS, @nvcN, @nvcP, @c, @vc) 
end
GO
/****** Object:  StoredProcedure [dbo].[inputDataEmployees]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники
create proc [dbo].[inputDataEmployees]( @nvcS nvarchar(70), @nvcN nvarchar(70), 
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	insert into Employees(Surname, Name, Patronymic, Phone, Email)
	values(@nvcS, @nvcN, @nvcP, @c, @vc)
end
GO
/****** Object:  StoredProcedure [dbo].[inputDataServices]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inputDataServices]( @iS int, @nvc nvarchar(250), @iC int,  @m money)
as
begin
	insert into Services(ID_service, Name, ID_company, Price)
	values(@iS, @nvc, @iC, @m)
end
GO
/****** Object:  StoredProcedure [dbo].[updateDataCompanies_resetID]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компанни (индекс)
create proc [dbo].[updateDataCompanies_resetID]( @i int )
as
begin
	dbcc checkident(Companies, reseed, @i) 
end
GO
/****** Object:  StoredProcedure [dbo].[updateDataCustomer_resetID]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateDataCustomer_resetID]( @i int)
as
begin
	dbcc checkident(Customer, reseed, @i)
end
GO
/****** Object:  StoredProcedure [dbo].[updateDataEmployees_ID]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудник
create proc [dbo].[updateDataEmployees_ID]( @i int, @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	update Employees
	set Surname = @nvcS, Name = @nvcN, Patronymic = @nvcP, Phone = @c, Email = @vc 
	where ID_employee = @i
end
GO
/****** Object:  StoredProcedure [dbo].[updateDataEmployees_resetID]    Script Date: 27.11.2020 21:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники (индекс)
create proc [dbo].[updateDataEmployees_resetID]( @i int)
as
begin
	dbcc checkident(Employees, reseed, @i)
end
GO
USE [master]
GO
ALTER DATABASE [ARCs] SET  READ_WRITE 
GO
