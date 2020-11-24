use ARCs
go

--			Процедуры



--		Заполнение таблиц данными


--Заказчик
create proc inputDataCustomer( @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	insert into Customer(Surname, Name, Patronymic, Phone, Email)
	values(@nvcS, @nvcN, @nvcP, @c, @vc) 
end
go

exec inputDataCustomer 'Кузьмин', 'Святослав', 'Андреевич', '+79117640001',
''
go
exec inputDataCustomer 'Шилов', 'Владислав', 'Владислав', '+79520550002', 
'shilovVV0002@mail.ru'
go
exec inputDataCustomer 'Рожкова', 'Марфа', 'Иринеевна', '+79229830003',
'RozhkovaMarphaE0003'
go
exec inputDataCustomer 'Щербаков', 'Никифор', 'Витальевич', '+79625530004', 
''
go
exec inputDataCustomer 'Харитонова', 'Наталия', 'Григорьевна', '+79999640005',
'KharitonovaNG0005@gmail.com'
go

--drop proc inputDataCustomer
--go


--Компании
create proc inputDataCompanies( @nvc nvarchar(250), @c char(20), @vc varchar(250) )
as 
begin
	insert into Companies(Name, Phone, Email)
	values(@nvc, @c, @vc)
end	
go

exec inputDataCompanies 'Студия Ремонтов', '+78124674230', ''
go
exec inputDataCompanies 'SBAX', '+78126605520', 'sales@sbax.ru'
go
exec inputDataCompanies 'Еврохаус', '+78123895599', 'info@eurohouse.spb.ru'
go

--drop proc inputDataCompanies
--go


--Сотрудники
create proc inputDataEmployees( @nvcS nvarchar(70), @nvcN nvarchar(70), 
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	insert into Employees(Surname, Name, Patronymic, Phone, Email)
	values(@nvcS, @nvcN, @nvcP, @c, @vc)
end
go

exec inputDataEmployees 'Жуков', 'Дмитрий', 'Вениаминович', '+79994670001',
'zdv01@mail.ru'
go
exec inputDataEmployees 'Тарасов', 'Леонид', 'Алексеевич', '+79994670002',
'tla02@mail.ru'
go
exec inputDataEmployees 'Белоусов', 'Антон', 'Аркадьевич', '+79994670003',
'baa03@mail.ru'
go
exec inputDataEmployees 'Бобылёв', 'Панкратий', 'Мэлсович', '+79994670004',
'bpm04@mail.ru'
go
exec inputDataEmployees 'Власова', 'Эльвира', 'Львовна', '+79994670005',
''
go
exec inputDataEmployees 'Силин', 'Бронислав', 'Лаврентьевич', '+79996600001',
'sbl01@sbax.ru'
go
exec inputDataEmployees 'Беспалов', 'Борис', 'Филиппович', '+79996600002',
'bbf02@sbax.ru'
go
exec inputDataEmployees 'Хохлов', 'Тарас', 'Анатольевич', '+79996600003',
''
go
exec inputDataEmployees 'Лихачёв', 'Иосиф', 'Федорович', '+79996600004',
'lif04@sbax.ru'
go
exec inputDataEmployees 'Субботина', 'Веста', 'Иринеевна', '+79996600005',
'svi05@sbax.ru'
go
exec inputDataEmployees 'Павлов', 'Емельян', 'Федотович', '+79993890001',
'pef01mail@peremont.ru'
go
exec inputDataEmployees 'Копылов', 'Дмитрий', 'Артемович', '+79993890002',
'kda02mail@peremont.ru'
go
exec inputDataEmployees 'Николаев', 'Давид', 'Николаевич', '+79993890003',
'ndn03mail@peremont.ru'
go
exec inputDataEmployees 'Доронин', 'Федор', 'Аркадьевич', '+79993890004',
'dfa04mail@peremont.ru'
go
exec inputDataEmployees 'Крюкова', 'Светлана', 'Петровна', '+79993890005',
'ksp05mail@peremont.ru'
go

--drop proc inputDataEmployees
--go


--КомпанииСотрудники
create proc inputDataCompaniesEmployees( @iC int, @iE int )
as
begin
	insert into CompaniesEmployees(ID_company, ID_employee)
	values(@iC, @iE)
end
go

exec inputDataCompaniesEmployees 1, 1
go
exec inputDataCompaniesEmployees 1, 2
go
exec inputDataCompaniesEmployees 1, 3
go
exec inputDataCompaniesEmployees 1, 4
go
exec inputDataCompaniesEmployees 1, 5
go
exec inputDataCompaniesEmployees 2, 6
go
exec inputDataCompaniesEmployees 2, 7
go
exec inputDataCompaniesEmployees 2, 8
go
exec inputDataCompaniesEmployees 2, 9
go
exec inputDataCompaniesEmployees 2, 10
go
exec inputDataCompaniesEmployees 3, 11
go
exec inputDataCompaniesEmployees 3, 12
go
exec inputDataCompaniesEmployees 3, 13
go
exec inputDataCompaniesEmployees 3, 14
go
exec inputDataCompaniesEmployees 3, 15
go

--drop proc inputDataCompaniesEmployees
--go


--Услуги
create proc inputDataServices( @iS int, @nvc nvarchar(250), @iC int,  @m money )
as
begin
	insert into Services(ID_service, Name, ID_company, Price)
	values(@iS, @nvc, @iC, @m)
end
go

exec inputDataServices 1, 'Черновой ремонт', 1, 2350 --за кв. метр
go
exec inputDataServices 2, 'Косметический ремонт', 1, 2790
go
exec inputDataServices 3, 'Капитальный ремонт', 1, 4740
go
exec inputDataServices 4, 'Черновой ремонт', 2, 2500 --за кв. метр
go
exec inputDataServices 5, 'Косметический ремонт', 2, 2600
go
exec inputDataServices 6, 'Капитальный ремонт', 2, 4800
go
exec inputDataServices 7, 'Черновой ремонт', 3, 2350 --за кв. метр
go
exec inputDataServices 8, 'Евроремонт', 3, 6300
go
exec inputDataServices 9, 'Капитальный ремонт', 3, 4750
go

--drop proc inputDataServices
--go


--Договор
create proc inputDataContract( @iCon int, @iCus int, @iS int, @mAdd money,
@dateB date, @dateE date, @mC money )
as
begin
	insert into Contract(ID_contract, ID_customer, ID_service, Additional_expenses,
	Date_beginning, Date_expiration, Cost)
	values(@iCon, @iCus, @iS, @mAdd, @dateB, @dateE, @mC)
end
go

exec inputDataContract 1, 1, 5, 1500, '2020-9-21', '2020-11-20', 92500
go
exec inputDataContract 2, 2, 1, 500, '2020-10-05', '2021-11-04', 81500
go
exec inputDataContract 3, 3, 8, 5000, '2020-10-11', '2020-12-01', 225500
go
exec inputDataContract 4, 4, 9, 4500, '2021-01-21', '2021-03-22', 170750
go
exec inputDataContract 5, 5, 7, 1000, '2020-02-14', '2021-03-17', 93000
go

--drop proc inputDataContract
--go



--		Удаление данных из таблиц


--Заказчик (по диапозону индексов)
create proc deleteDataCustomer_iSiF( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Customer
			where ID_customer = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Customer
			where ID_customer = @iF
			set @iF += 1
		end
end
go

exec deleteDataCustomer_iSiF 1, 5
go

--drop proc deleteDataCustomer_iSiF
--go


--Компании (по диапозону индексов)
create proc deleteDataCompanies_iSiF( @iS int, @iF int )
as
begin
	if @iS <= @iF
	while @iS <= @iF
	begin
		delete from Companies
		where ID_company = @iS
		set @iS += 1
	end
	else
	while @iF <= @iS
	begin
		delete from Companies
		where ID_company = @iF
		set @iF += 1
	end
end
go

exec deleteDataCompanies_iSiF 1, 3
go

--drop proc deleteDataCompanies_iSiF
--go


--Сотрудники (по диапозону индексов)
create proc deleteDataEmployees_iSiF( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Employees
			where ID_employee = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Employees
			where ID_employee = @iF
			set @iF += 1
		end
end
go

exec deleteDataEmployees_iSiF 2, 16
go

--drop proc deleteDataEmployees_iSiF
--go


--КомпанииСотрудники (по диапозону индексов)
create proc deleteDataCompaniesEmployees_iSiF( @iCmpS int, @iCmpF int,
@iEmpS int, @iEmpF int )
as
begin
	declare @x int
	if @iCmpS > @iCmpF
	begin
		set @x = @iCmpS 
		set @iCmpS = @iCmpF
		set @iCmpF = @x
	end
	if @iEmpS > @iEmpF
	begin
		set @x = @iEmpS
		set @iEmpS = @iEmpF
		set @iEmpF = @x
	end
	set @x = @iEmpS
	while @iCmpS <= @iCmpF 
	begin
		while @iEmpS <= @iEmpF
		begin
			delete from CompaniesEmployees
			where ID_company = @iCmpS and ID_employee = @iEmpS
			set @iEmpS += 1
		end
		set @iCmpS += 1
		set @iEmpS = @x
	end
end
go

exec deleteDataCompaniesEmployees_iSiF 1, 3, 1, 15
go

--drop proc deleteDataCompaniesEmployees_iSiF
--go


--Сервисы (по диапозону индексов)
create proc deleteDataServices_iSiF( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Services
			where ID_service = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Services
			where ID_service = @iF
			set @iF += 1
		end
end
go

exec deleteDataServices_iSiF 1, 9
go

--drop proc deleteDataServices_iSiF
--go


--Договор (по диапозону индексов)
create proc deleteDataContract_iSiF( @iS int, @iF int )
as
begin
	if @iS <= @iF
		while @iS <= @iF
		begin
			delete from Contract
			where ID_contract = @iS
			set @iS += 1
		end
	else
		while @iF <= @iS
		begin
			delete from Contract
			where ID_contract = @iF
			set @iF += 1
		end
end
go

exec deleteDataContract_iSiF 1, 9
go

--drop proc deleteDataContract_iSiF
--go


--Сотрудники (по содержимому)
create proc deleteDataEmployees_Content( @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	delete from Employees
	where Surname = @nvcS and Name = @nvcN and Patronymic = @nvcP and Phone = @c 
	and Email = @vc
end
go

exec deleteDataEmployees_Content 'Крюкова', 'Светлана', 'Петровна', '+79993890005',
'ksp05mail@peremont.ru'
go

--drop proc deleteDataEmployees_Content
--go



--		удаление Всех записей из таблиц


--Заказчик
create proc deleteAllRecordsCustomer
as
begin
	delete from Customer
end
go

exec deleteAllRecordsCustomer
go

--drop proc deleteAllRecordsCustomer
--go


--Компании
create proc deleteAllRecordsCompanies
as
begin
	delete from Companies
end
go

exec deleteAllRecordsCompanies
go

--drop proc deleteAllRecordsCompanies
--go


--Сотрудники
create proc deleteAllRecordsEmployees
as
begin
	delete from Employees
end
go

exec deleteAllRecordsEmployees
go

--drop proc deleteAllRecordsEmployees
--go


--КомпанииСотрудники
create proc deleteAllRecordsCompaniesEmployees
as
begin
	delete from CompaniesEmployees
end
go

exec deleteAllRecordsCompaniesEmployees
go

--drop proc deleteAllRecordsCompaniesEmployees
--go


--Услуги
create proc deleteAllRecordsServices
as
begin
	delete from Services
end
go

exec deleteAllRecordsServices
go

--drop proc deleteAllRecordsServices
--go


--Договор
create proc deleteAllRecordsContract
as
begin
	delete from Contract
end
go

exec deleteAllRecordsContract
go

--drop proc deleteAllRecordsContract
--go



--		Обновление данных в таблицах


--Сотрудники
create proc updateDataEmployees_ID( @i int, @nvcS nvarchar(70), @nvcN nvarchar(70),
@nvcP nvarchar(70), @c char(20), @vc varchar(250) )
as
begin
	update Employees
	set Surname = @nvcS, Name = @nvcN, Patronymic = @nvcP, Phone = @c, Email = @vc 
	where ID_employee = @i
end
go

exec updateDataEmployees_ID 15, 'Крюкова', 'Светлана', 'Петровна', '+79993890005',
'ksp05mail@peremont.ru'
go

--drop proc updateDataEmployees_ID
--go


--Заказчик (индекс)
create proc updateDataCustomer_resetID( @i int)
as
begin
	dbcc checkident(Customer, reseed, @i)
end
go

exec updateDataCustomer_resetID 0
go

--drop proc updateDataCustomer_resetID
--go


--Компанни (индекс)
create proc updateDataCompanies_resetID( @i int )
as
begin
	dbcc checkident(Companies, reseed, @i) 
end
go

exec updateDataCompanies_resetID 0
go

--drop proc updateDataCompanies_resetID
--go


--Сотрудники (индекс)
create proc updateDataEmployees_resetID( @i int)
as
begin
	dbcc checkident(Employees, reseed, @i)
end
go

exec updateDataEmployees_resetID 14
go

--drop proc updateDataEmployees_resetID
--go
