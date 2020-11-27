USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[deleteDataEmployees_Content]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудники (по содержимому)
create proc [dbo].[deleteDataEmployees_Content]( @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	delete from Employees
	where Surname = @nvcS and Name = @nvcN and Patronymic = @nvcP and Phone = @c 
	and Email = @vc
end
GO
