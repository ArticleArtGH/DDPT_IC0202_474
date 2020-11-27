USE [ARCs]
GO
/****** Object:  View [dbo].[CountEachServices]    Script Date: 27.11.2020 21:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Количество каждой услуги
create view [dbo].[CountEachServices]
as
	select Name, count(Name) as 'Count Services' 
	from Services 
	group by Name
GO
