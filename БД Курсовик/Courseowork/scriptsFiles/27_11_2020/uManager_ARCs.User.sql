USE [ARCs]
GO
/****** Object:  User [uManager_ARCs]    Script Date: 27.11.2020 21:11:32 ******/
CREATE USER [uManager_ARCs] FOR LOGIN [Manager_ARCs] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [rManager_ARCs] ADD MEMBER [uManager_ARCs]
GO
