USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[updateDataCompanies_resetID]    Script Date: 27.11.2020 21:11:33 ******/
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
