use ARCs
go

--		создание Уч. записей

create login Manager_ARCs
with password = 'logM474',
default_database = ARCs,
default_language = русский,
check_expiration = off,--проверять ли срок использования пароля
check_policy=off--политика паролей
go

create login Employee_ARCs
with password = 'logE474',
default_database = ARCs,
default_language = русский,
check_expiration = off,
check_policy = off
go

create login Client_ARCs
with password = 'logC474',
default_database = ARCs,
default_language = русский,
check_expiration = off,
check_policy = off
go

--alter login Client_ARCs
--with password = 'logC474',
--check_policy = off
--go

--drop login  Employee_ARCs
--go


--		создание Пользователей

create user uManager_ARCs
for login Manager_ARCs
go

create user uEmployee_ARCs
for login Employee_ARCs
go

create user uClient_ARCs
for login Client_ARCs
go

--drop user uEmployee_ARCs
--go


--		создание Ролей

create role rManager_ARCs--Менеджеры
create role rEmployee_ARCs--Сотрудники
create role rClient_ARCs--Клиенты

--drop role rEmployee_ARCs

--добавление пользователей в роль

exec sp_addrolemember @rolename = rManager_ARCs,
@membername = uManager_ARCs
exec sp_addrolemember @rolename = rEmployee_ARCs,
@membername = uEmployee_ARCs
exec sp_addrolemember @rolename = rClient_ARCs,
@membername = uClient_ARCs

--exec sp_addrolemember @rolename = db_owner,
--@membername = uManager_ARCs
--exec sp_droprolemember @rolename = db_owner,
--@membername = uManager_ARCs

--exec sp_droprolemember @rolename = rEmployee_ARCs,
--@membername = uEmployee_ARCs

--		Информация

-- о Роли

exec sp_helprole @rolename = rManager_ARCs
go
exec sp_helprole @rolename = rEmployee_ARCs
go
exec sp_helprole @rolename = rClient_ARCs
go

-- о Пользователях

exec sp_helpuser uManager_ARCs
go
exec sp_helpuser uEmployee_ARCs
go
exec sp_helpuser uClient_ARCs
go


--		Разрешения


--Заказчик (клиент)

--Чтение таблицы услуги и компании
grant select on Services to rClient_ARCs
go
grant select on Companies to rClient_ARCs
go
--представление
grant select on CompaniesTheirServices to rClient_ARCs 
go
--revoke select on CompaniesTheirServices to rClient_ARCs
--go

--Сотрудник

--на Чтение, Добавление и Удаление
--grant select, 

--на создание Резервного копирования, также дать возможность это делать Менеджеру
--сотруднику не надо наверное довать возможнность создавать устройство резервного
--копирования, а сохранять в существующие,
--созданное Менеджером или Админом.

--Менеджер

grant all on Companies to rManager_ARCs
go
grant all on Employees to rManager_ARCs
go
grant all on Customer to rManager_ARCs
go
grant all on CompaniesEmployees to rManager_ARCs
go
grant all on Services to rManager_ARCs
go
grant all on Contract to rManager_ARCs
go


--просмотр прав у Пользователя или Роли

sp_helprotect null, rManager_ARCs
go
sp_helprotect null, rEmployee_ARCs
go
sp_helprotect null, rClient_ARCs
go

--sp_helprotect @name = Companies/*null*/, @username = null--uManager_ARCs
--go
sp_helprotect Services, null
go
--всё обо всех
sp_helprotect null, null
go