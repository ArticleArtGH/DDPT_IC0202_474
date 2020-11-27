USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[inputDataCompaniesEmployees]    Script Date: 27.11.2020 21:11:33 ******/
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
