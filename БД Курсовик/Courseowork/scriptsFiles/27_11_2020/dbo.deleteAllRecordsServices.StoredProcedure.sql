USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsServices]    Script Date: 27.11.2020 21:11:33 ******/
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
