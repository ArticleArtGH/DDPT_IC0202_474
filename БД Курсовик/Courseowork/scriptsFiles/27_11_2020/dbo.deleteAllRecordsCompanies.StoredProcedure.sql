USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteAllRecordsCompanies]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании
create proc [dbo].[deleteAllRecordsCompanies]
as
begin
	delete from Companies
end
GO
