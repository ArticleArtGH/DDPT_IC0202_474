--создание уч. зап.
create login anna_474_3
with password = 'anna4743'
go
create login karl_474_3
with password = 'karl4743'
go
create login max_474_3
with password = 'max4743'
go

--создание пользователей
create user s_anna_474_3
for login anna_474_3
go
create user s_karl_474_3
for login karl_474_3
go
create user s_max_474_3
for login max_474_3
go
--drop user s_max_474_3
--go

--создание роли
create role Managers_474_3
--добавление членов в роль
exec sp_addrolemember @rolename = 'Managers_474_3', 
@membername = 's_anna_474_3'
exec sp_addrolemember @rolename = 'Managers_474_3',
@membername = 's_karl_474_3'
exec sp_addrolemember @rolename =  'Managers_474_3',
@membername = 's_max_474_3'
--инфо о роли
exec sp_helprole @rolename = 'Managers_474_3' 
go
exec sp_helpuser 's_anna_474_3' 
go
exec sp_helpuser 's_karl_474_3'
go
exec sp_helpuser 's_max_474_3'
go

--разрешения на создание таблиц
use Primer_474_3
go
grant create table
to s_karl_474_3
go
--разрешения на создание процедур
grant create procedure
to s_anna_474_3
go

--разрешения измениять значения столбцов Project_name
-- и Budget таблицы Project
use Primer_474_3
go
grant update(Project_name, Budget) on Project
to s_max_474_3
go

--разрешения читать столбцы Dept_name, location 
--таблицы Departament
use Primer_474_3
go

--разрешение на чтение столбцов
grant select(Dept_name, location) on Departament
to s_karl_474_3, s_anna_474_3
go

--разрешение на вставку строк значений
grant insert on Table_Try
to s_karl_474_3, s_anna_474_3
go

--отменить разрешения на чтение (select)
revoke select on Departament
to s_karl_474_3
go

--запрет на добавление новых строк
deny insert  on Table_Try
to s_anna_474_3
go

sp_helpuser s_anna_474_3
go

--разрешение для роли
grant select, insert on Departament
to Managers_474_3
go

--просмотр прав у пользователя или роли
sp_helprotect null, s_anna_474_3--Managers_474_3
go