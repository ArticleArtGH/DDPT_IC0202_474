USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataCompanies_iSiF]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--удаление данных Компании по диапозону
create proc [dbo].[deleteDataCompanies_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
	while @iS <= @iF
	begin
		delete from Companies
		where ID_company = @iS
		set @iS += 1
	end
	else
	while @iF <= @iS
	begin
		delete from Companies
		where ID_company = @iF
		set @iF += 1
	end
end
GO
