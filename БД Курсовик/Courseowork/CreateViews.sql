use ARCs
go

--			�������������



--		����� ����������� ������


--��������
select * from Customer
go

--��������
select * from Companies
go

--����������
select * from Employees
go

--������������������
select * from CompaniesEmployees
go

--������
select * from Services
go

--�������
select * from Contract
go


--		������������� �� ������� ������ �� ���������� ������ � ��������������
--	������� ������ �� ���������� �����


--�������� � �� ������
create view CompaniesTheirServices
as
select C.Name as [Company Name], S.Name as [Services Name]--����������
from Companies as C, Services as S-- ����������
where S.ID_company = C.ID_company
go

select * from CompaniesTheirServices
go

--drop view CompaniesTheirServices
--go


--��������� ��� �����, � ����� ��������
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


--�������� � �� ����������
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


--�������� � �� �������� � ������� ���������� ���� �����
--create view TermsOfWorkOfCompanies
--as
--select ID_company, Companies.Name, Services.Name, Date_beginnig, Date_expiration
--from Companies as Cmp, Services as S, Contract as Cnt
--full outer join Services s on Cmp.ID_company = s.ID_company--Cmp.ID_company = S.ID_company
--where --Cnt.ID_service = S.ID_service --and 
----S.ID_company = Cmp.ID_company
--go
create view TermsOfWorkOfCompanies
as
select Cmp.ID_company, Cmp.Name as 'Company Name', S.Name as 'Service Name',
Date_beginning, Date_expiration
from Companies as Cmp, Services as S, Contract as Cnt
where Cnt.ID_service = S.ID_service and 
S.ID_company = Cmp.ID_company
go

select * from TermsOfWorkOfCompanies
go

--drop view TermsOfWorkOfCompanies
--go



----� ���� �� ���������� ���� ����������� �����
--create view CustomerNotEmail 
--as
--select  Surname, Name, Patronymic
--from Customer
--where Customer.Email = ''  
--go

--select * from CustomerNotEmail
--go

--drop view CustomerNotEmail
--go


----����� ����� ��� � ������ ���������
--create view ServeciesNotInOthersCompanies
--as
--select Name, 




--

----� ����� �������� ����� ���������
--create view CompaniesTheirCustomer 
--as
--select  Surname, Name, Patronimic
--from Companies, Customer
--where 
--go


--		������������� � �������������� ��������� �����



--		������������� � �������������� ��������� ��������

--���������� ������ ������



--��������
--��������
--����������
--������������������
--������
--�������