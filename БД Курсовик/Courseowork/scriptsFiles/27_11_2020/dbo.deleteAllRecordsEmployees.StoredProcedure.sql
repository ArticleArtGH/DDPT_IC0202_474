USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsEmployees]    Script Date: 27.11.2020 21:11:33 ******/
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
