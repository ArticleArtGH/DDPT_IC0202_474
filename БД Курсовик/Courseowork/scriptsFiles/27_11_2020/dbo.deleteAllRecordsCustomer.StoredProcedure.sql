USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsCustomer]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteAllRecordsCustomer]
as
begin
	delete from Customer
end
GO
