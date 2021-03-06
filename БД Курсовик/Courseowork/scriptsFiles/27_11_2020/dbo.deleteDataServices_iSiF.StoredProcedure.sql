USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataServices_iSiF]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сервисы (по диапозону индексов)
create proc [dbo].[deleteDataServices_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Services
			where ID_service = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Services
			where ID_service = @iF
			set @iF += 1
		end
end
GO
