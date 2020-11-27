USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[updateDataEmployees_ID]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Сотрудник
create proc [dbo].[updateDataEmployees_ID]( @i int, @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	update Employees
	set Surname = @nvcS, Name = @nvcN, Patronymic = @nvcP, Phone = @c, Email = @vc 
	where ID_employee = @i
end
GO
