USE [ARCs]
GO
/****** Object:  View [dbo].[IncomeAllOrdersFulfilled]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[IncomeAllOrdersFulfilled]
as
	select sum(Cnt.Cost) 'Income'
	from Contract Cnt, Customer Csr,Services S
	where Cnt.ID_customer = Csr.ID_customer and Cnt.ID_service = S.ID_service
GO
