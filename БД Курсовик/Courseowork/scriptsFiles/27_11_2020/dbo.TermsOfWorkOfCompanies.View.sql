USE [ARCs]
GO
/****** Object:  View [dbo].[TermsOfWorkOfCompanies]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании с их услугами и сроками выполнения этих услуг
create view [dbo].[TermsOfWorkOfCompanies]
as
--select Cmp.ID_company, Cmp.Name as 'Company Name', S.Name as 'Service Name',
--Date_beginning, Date_expiration
--from Companies as Cmp, Services as S, Contract as Cnt
--where Cnt.ID_service = S.ID_service and 
--S.ID_company = Cmp.ID_company
--OR
select Cmp.ID_company, Cmp.Name 'Company Name', S.Name 'Service Name',
Date_beginning, Date_expiration
from Companies Cmp--, Services S, Contract Cnt
join Services S on Cmp.ID_company = S.ID_company
join Contract Cnt on Cnt.ID_service = S.ID_service
GO
