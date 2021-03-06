USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataContract_iSiF]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Договор (по диапозону индексов)
create proc [dbo].[deleteDataContract_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Contract
			where ID_contract = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Contract
			where ID_contract = @iF
			set @iF += 1
		end
end
GO
