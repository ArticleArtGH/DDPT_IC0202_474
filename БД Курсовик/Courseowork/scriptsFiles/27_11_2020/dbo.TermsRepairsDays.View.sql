USE [ARCs]
GO
/****** Object:  View [dbo].[TermsRepairsDays]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TermsRepairsDays]
as
	select Cr.Name as 'Name Customer', S.Name as 'Name Service',
	datediff(day, Ct.Date_beginning, Ct.Date_expiration) as 'Terms'
	from Customer as Cr, Services as S, Contract as Ct	
	where Ct.ID_service = S.ID_service and Ct.ID_customer = Cr.ID_customer
GO
