USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsCompaniesEmployees]    Script Date: 27.11.2020 21:11:33 ******/
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
