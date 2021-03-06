USE [ARCs]
GO
/****** Object:  View [dbo].[CountCustomerEachCompany]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CountCustomerEachCompany]
as
	--select Cmp.Name 'Company Name', Count(Ctr.Name) 'Count Customer'
	--from Companies Cmp
	--join Services S on S.ID_company = Cmp.ID_company
	--join Contract Cnt on Cnt.ID_service = S.ID_service
	--join Customer Ctr on Cnt.ID_customer = Ctr.ID_customer 
	--group by Cmp.Name
	select Cmp.Name 'Company Name', Count(Ctr.Name) 'Count Customer'
	from Contract Cnt, Companies Cmp, Customer Ctr, Services S
	where Cnt.ID_customer = Ctr.ID_customer  and S.ID_company = Cmp.ID_company
	and Cnt.ID_service = S.ID_service
	group by Cmp.Name
GO
