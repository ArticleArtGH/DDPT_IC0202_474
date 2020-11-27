use ARCs
go

--создание устройств резерного копирования

--для БД
exec sp_addumpdevice 'disk', 'deviceARCs_DB', 'E:\MS SQL Server 2017 Edition\Компоненты\
MSSQL14.SQLEXPRESS\MSSQL\Backup\deviceARCs_DB.bak'
--для Журналов транзакций
exec sp_addumpdevice 'disk', 'deviceARCs_Log', 'E:\MS SQL Server 2017 Edition\Компоненты\
MSSQL14.SQLEXPRESS\MSSQL\Backup\deviceARCs_Log.bak'
go

--exec sp_dropdevice 'deviceARCs_DB'
--go
--exec sp_dropdevice 'deviceARCs_Log'
--go


--Резерное копирование

--БД
backup database ARCs to deviceARCs_DB
go

--Журналов транзакций
backup log ARCs to deviceARCs_Log
go

--Разностная
backup database ARCs to deviceARCs_DB with differential
go
