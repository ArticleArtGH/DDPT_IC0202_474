USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[updateDataEmployees_resetID]    Script Date: 27.11.2020 21:11:33 ******/
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
