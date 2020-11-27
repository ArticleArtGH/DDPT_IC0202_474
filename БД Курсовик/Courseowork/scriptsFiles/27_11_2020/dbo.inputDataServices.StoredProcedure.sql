USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[inputDataServices]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inputDataServices]( @iS int, @nvc nvarchar(250), @iC int,  @m money)
as
begin
	insert into Services(ID_service, Name, ID_company, Price)
	values(@iS, @nvc, @iC, @m)
end
GO
