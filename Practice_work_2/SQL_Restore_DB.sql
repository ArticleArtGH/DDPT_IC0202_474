use master
go

----Востановление БД, полное
restore database Primer_474_3
from Chernih_Shagin_474_BD
with norecovery --пока не закончили востанавливать БД
go

--Востановление БД, разностное
restore database Primer_474_3
from Chernih_Shagin_474_BD
with file = 5, norecovery
go

--Востановление БД, журнал
restore log Primer_474_3
from Chernih_Shagin_474_Log
with file = 2, recovery
go--журналы востановить не удалось
