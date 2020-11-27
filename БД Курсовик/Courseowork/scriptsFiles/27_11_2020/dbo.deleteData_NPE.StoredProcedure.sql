USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteData_NPE]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteData_NPE]( @nvc nvarchar(250), @c char(20), @vc varchar(250) )
as
begin
	delete from Companies
	where Name = @nvc and Phone = @c and Email = @vc
end
GO
