USE [ARCs]
GO
/****** Object:  StoredProcedure [dbo].[inputDataCustomer]    Script Date: 27.11.2020 21:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Заполнение таблицы Заказчик
create proc [dbo].[inputDataCustomer]( @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	insert into Customer(Surname, Name, Patronymic, Phone, Email)
	values(@nvcS, @nvcN, @nvcP, @c, @vc) 
end
GO
