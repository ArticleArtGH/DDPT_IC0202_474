USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataCompaniesEmployees_iSiF]    Script Date: 27.11.2020 21:11:33 ******/
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
