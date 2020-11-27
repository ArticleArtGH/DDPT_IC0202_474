USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[inputDataContract]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inputDataContract]( @iCon int, @iCus int, @iS int, @mAdd money,
@dateB date, @dateE date, @mC money )
as
begin
	insert into Contract(ID_contract, ID_customer, ID_service, Additional_expenses,
	Date_beginning, Date_expiration, Cost)
	values(@iCon, @iCus, @iS, @mAdd, @dateB, @dateE, @mC)
end
GO
