USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[updateDataCustomer_resetID]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateDataCustomer_resetID]( @i int)
as
begin
	dbcc checkident(Customer, reseed, @i)
end
GO
