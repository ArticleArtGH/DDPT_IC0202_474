USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataCustomer_iSiF]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteDataCustomer_iSiF]( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Customer
			where ID_customer = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Customer
			where ID_customer = @iF
			set @iF += 1
		end
end
GO
