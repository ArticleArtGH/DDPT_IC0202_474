use master
go

----������������� ��, ������
restore database Primer_474_3
from Chernih_Shagin_474_BD
with replace, file = 7, norecovery --���� �� ��������� �������������� �� --with replace, file = ,norecovery
go

--������������� ��, ����������
restore database Primer_474_3
from Chernih_Shagin_474_BD
with file = 8, norecovery
go

--������������� ��, ������
restore log Primer_474_3
from Chernih_Shagin_474_Log
with file = 5, recovery
go--������� ����������� �� �������

