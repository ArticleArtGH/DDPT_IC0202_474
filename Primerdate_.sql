use master
go
create database Primer_474_3
--Основной файл
on primary
(
name = Primer_474_3_dat,
filename = "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\ Primer_474_3.mdf",
size = 10,
maxsize = 20,
filegrowth = 2
)
--Журнал файл
log on
(
name = Primer_474_3_log,
filename  = "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\ Primer_474_3_log.ldf",
size = 10,
maxsize = 20,
filegrowth = 2
)
go