use master
go

create database ARCs
--основной файл
on primary
(
name = ARCs_dat,
filename = "C:\Program Files\Microsoft SQL Server\
MSSQL10.MSSQLSERVER\MSSQL\DATA\ARCs_dat.mdf",
--filename = "E:\MS SQL Server 2017 Edition\Компоненты\MSSQL14.SQLEXPRESS\
--MSSQL\DATA\ARCs_dat.mdf",
size = 4,--первоначальный размер файла
maxsize = 10,
filegrowth = 1
)
--журнал файл
log on
(
name = ARCs_log,
filename = "C:\Program Files\Microsoft SQL Server\
MSSQL10.MSSQLSERVER\MSSQL\DATA\ARCs_log.ldf",
--filename = "E:\MS SQL Server 2017 Edition\Компоненты\MSSQL14.SQLEXPRESS\
--MSSQL\DATA\ARCs_log.ldf",
size = 2,
maxsize = 5,
filegrowth = 1
)
go

--drop database ARCs
--go