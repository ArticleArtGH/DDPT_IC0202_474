USE [ARCs]
GO
/****** Object:  View [dbo].[CompaniesTheirServices]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Компании и их услуги
create view [dbo].[CompaniesTheirServices]
as
select C.Name as [Company Name], S.Name as [Services Name]--псевдонимы
from Companies as C, Services as S-- псевдонимы
where S.ID_company = C.ID_company
GO
