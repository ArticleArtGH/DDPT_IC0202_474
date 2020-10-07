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
--создание роли
create role Managers_474_3
--добавление членов в роль
exec sp_addrolemember @rolename = 'Managers_474_3', 
@membername = 'anna_474_3'
exec sp_addrolemember @rolename = 'Magagers_474_3',
@membername = 'karl_474_3'
exec sp_addrolemember @rolename =  'Managers_474_3',
@membername = 'max_474_3'
--инфо о роли
exec sp_helprole @rolename = 'Managers_474_3'
go