USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteData_I]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteData_I]( @i int  )
as
begin
	delete from Companies
	where ID_company = @i
end
GO
