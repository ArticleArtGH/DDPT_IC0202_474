use ARCs
go

--			Представления



--		Вывод содержимого таблиц (для проверки)


--Заказчик
select * from Customer
go

--Компании
select * from Companies
go

--Сотрудники
select * from Employees
go

--КомпанииСотрудники
select * from CompaniesEmployees
go

--Услуги
select * from Services
go

--Договор
select * from Contract
go



--		Представления на выборку данных из нескольких таблиц с использованием
--	условий отбора по нескольким полям


--Компании и их услуги
create view CompaniesTheirServices
as
select C.Name as [Company Name], S.Name as [Services Name]--псевдонимы
from Companies as C, Services as S-- псевдонимы
where S.ID_company = C.ID_company
go

select * from CompaniesTheirServices
go

--drop view CompaniesTheirServices
--go


--Заказчики без почты, а также компании
create view CustomersAndCompaniesNotEmail
as
select ID_customer, Surname, Customer.Name as 'Customer Name', Patronymic, 
ID_company, Companies.Name as 'Company Name'
from Customer, Companies
where Customer.Email = '' and Companies.Email = ''
go

select * from CustomersAndCompaniesNotEmail
go

--drop view CustomersAndCompaniesNotEmail
--go


--Компании и их сотрудники
create view CompaniesTheirEmployees
as
select C.ID_company, C.Name as 'Company Name', E.ID_employee, Surname, 
E.Name as 'Employee Name', Patronymic, E.Phone, E.Email
from Companies as C, Employees as E, CompaniesEmployees as CE
where CE.ID_company = C.ID_company and CE.ID_employee = E.ID_employee
go

select * from CompaniesTheirEmployees
go

--drop view CompaniesTheirEmployees
--go


--Компании с их услугами и сроками выполнения этих услуг по заказу
create view TermsOfWorkOfCompanies
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
go

select * from TermsOfWorkOfCompanies
go

--drop view TermsOfWorkOfCompanies
--go



--		Представления с использованием расчётных полей


--Каков доход, если будут выполнены все заказы
create view IncomeAllOrdersFulfilled
as
	select sum(Cnt.Cost) 'Income'
	from Contract Cnt, Customer Csr,Services S
	where Cnt.ID_customer = Csr.ID_customer and Cnt.ID_service = S.ID_service
go

select * from IncomeAllOrdersFulfilled
go

--drop view IncomeAllOrdersFulfilled
--go


--Сроки ремонтов в днях
create view TermsRepairsDays
as
	select Cr.Name as 'Name Customer', S.Name as 'Name Service',
	datediff(day, Ct.Date_beginning, Ct.Date_expiration) as 'Terms'
	from Customer as Cr, Services as S, Contract as Ct	
	where Ct.ID_service = S.ID_service and Ct.ID_customer = Cr.ID_customer
go

select * from TermsRepairsDays
go

--drop view TermsRepairsDays
--go


--В какой день будет половина выполненной услуги
create view HalfDateServicesPerfomed
as
	select Ct.ID_customer 'ID customer', Cr.Surname+' '+Cr.Name+' '+Cr.Patronymic 'SNP',
	S.ID_service 'ID service', S.Name 'Name service', 
	dateadd(day ,datediff(day, Ct.Date_beginning, Ct.Date_expiration)/2, Ct.Date_beginning ) 'Half terms'
	from Customer Cr, Services S, Contract Ct
	where Ct.ID_customer = Cr.ID_customer and Ct.ID_service = S.ID_service
go

select * from HalfDateServicesPerfomed
go

--drop view HalfDateServicesPerfomed
--go


--		Представление с использованием групповых операций


--Количество каждой услуги
create view CountEachServices
as
	select Name, count(Name) as 'Count Services' 
	from Services 
	group by Name
go

select * from CountEachServices
go

--drop view CountEveryServices
--go


--Сколько заказчиков у каждой компании
create view CountCustomerEachCompany
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
go

select * from CountCustomerEachCompany
go

--drop view CountCustomerEachCompany
--go


--Сколько сотрудников у каждой компании
create view CountEmployeesEachCompanies
as
	select Cmp.Name, Count(Emp.Name) 'Count Employees'
	from Companies Cmp, Employees Emp, CompaniesEmployees CE
	where CE.ID_company = Cmp.ID_company and CE.ID_employee = Emp.ID_employee
	group by Cmp.Name
go

select * from CountEmployeesEachCompanies
go

--drop view CountEmployeesEachCompanies
--go