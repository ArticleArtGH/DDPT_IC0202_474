USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataEmployees_iSiF]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники (по диапозону индексов)
create proc [dbo].[deleteDataEmployees_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Employees
			where ID_employee = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Employees
			where ID_employee = @iF
			set @iF += 1
		end
end
GO
