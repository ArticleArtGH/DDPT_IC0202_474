USE [ARCs]
GO
/****** Object:  User [uEmployee_ARCs]    Script Date: 27.11.2020 21:11:32 ******/
CREATE USER [uEmployee_ARCs] FOR LOGIN [Employee_ARCs] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [rEmployee_ARCs] ADD MEMBER [uEmployee_ARCs]
GO
