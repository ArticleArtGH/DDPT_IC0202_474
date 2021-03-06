USE [ARCs]
GO
/****** Object:  View [dbo].[CustomersAndCompaniesNotEmail]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Заказчики без почты, а также компании
create view [dbo].[CustomersAndCompaniesNotEmail]
as
select ID_customer, Surname, Customer.Name as 'Customer Name', Patronymic, 
ID_company, Companies.Name as 'Company Name'
from Customer, Companies
where Customer.Email = '' and Companies.Email = ''
GO
