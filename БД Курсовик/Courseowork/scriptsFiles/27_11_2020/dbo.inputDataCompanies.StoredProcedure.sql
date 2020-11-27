USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[inputDataCompanies]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inputDataCompanies]( @nvc nvarchar(250), @c char(20), @vc varchar(250) )
as 
begin
	insert into Companies(Name, Phone, Email)
	values(@nvc, @c, @vc)
end	
GO
