use ARCs
go

create table dbo.Customer-- Заказчик
(
	ID_customer int identity(1,1) not null,--ID заказчика
	constraint PK_Customer primary key clustered (ID_customer),
	Surname nvarchar(70) not null,--Фамилия
	Name nvarchar(70) not null,
	Patronymic nvarchar(70) not null,--Отчество
	Phone char(20) not null,
	Email varchar(250) null
)
go

create table dbo.Companies-- Компании
(
	ID_company int identity(1,1) not null,
	constraint PK_Companies primary key clustered (ID_company),
	Name nvarchar(250) not null,
	Phone char(20) not null,
	Email varchar(250) null
)
go

create table dbo.Employees-- Сотрудники
(
	ID_employee int identity(1,1) not null,
	constraint PK_Employees primary key clustered (ID_employee),
	Surname nvarchar(70) not null,
	Name nvarchar(70) not null,
	Patronymic nvarchar(70) not null,
	Phone char(20) not null,
	Email varchar(250) null
)
go

create table dbo.CompaniesEmployees-- КомпанииСотрудники
(
	ID_company int not null,
	ID_employee int not null,
	constraint PK_CompaniesEmployees primary key nonclustered (ID_company, ID_employee),
	constraint FK_CompaniesEmployees_Company foreign key (ID_company)
	references dbo.Companies (ID_company)
	on delete cascade
	on update cascade,
	constraint FK_CompaniesEmployees_Employee foreign key (ID_employee)
	references dbo.Employees (ID_employee)
	on delete cascade
	on update cascade
)
go

create table dbo.Services-- Услуги
(
	ID_service int not null,
	constraint PK_Services primary key nonclustered (ID_service),
	Name nvarchar(250) not null,
	ID_company int not null,
	constraint FK_Services_Company foreign key (ID_company)
	references dbo.Companies (ID_company)
	on delete cascade
	on update cascade,
	Price money not null
)
go

create table dbo.Contract-- Договор
(
	ID_contract int not null,
	constraint PK_Contract primary key nonclustered (ID_contract),
	ID_customer int not null,
	constraint FK_Contract_Customer foreign key (ID_customer)
	references dbo.Customer (ID_customer)
	on delete cascade
	on update cascade,
	ID_service int not null,
	constraint FK_Contract_Service foreign key (ID_service)
	references dbo.Services (ID_service)
	on delete cascade
	on update cascade,
	Additional_expenses money not null,--дополнительные расходы
	Date_beginning date not null,--дата начала
	Date_expiration date not null,--дата окончания
	Cost money not null
)
go

--drop table if exists example