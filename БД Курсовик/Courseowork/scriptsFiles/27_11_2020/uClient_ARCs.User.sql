USE [ARCs]
GO
/****** Object:  User [uClient_ARCs]    Script Date: 27.11.2020 21:11:32 ******/
CREATE USER [uClient_ARCs] FOR LOGIN [Client_ARCs] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [rClient_ARCs] ADD MEMBER [uClient_ARCs]
GO
