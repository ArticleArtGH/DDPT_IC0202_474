USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsContract]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Договор
create proc [dbo].[deleteAllRecordsContract]
as
begin
	delete from Contract
end
GO
