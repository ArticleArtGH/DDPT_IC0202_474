use master
go

----Востановление БД, полное
restore database Primer_474_3
from Chernih_Shagin_474_BD
with replace, file = 7, norecovery --пока не закончили востанавливать БД --with replace, file = ,norecovery
go

--Востановление БД, разностное
restore database Primer_474_3
from Chernih_Shagin_474_BD
with file = 8, norecovery
go

--Востановление БД, журнал
restore log Primer_474_3
from Chernih_Shagin_474_Log
with file = 5, recovery
go--журналы востановить не удалось

