use Primer_474_3
go

--Полная копия БД
backup database Primer_474_3
to Chernih_Shagin_474_BD
go

--Копия Журнала
backup log Primer_474_3
to Chernih_Shagin_474_Log
go

--Дифференцированная копия
insert into Departament(Dept_no, Dept_name)
values('D4', 'Economic')
go
--копия
backup database Primer_474_3
to Chernih_Shagin_474_BD
with differential
go
