use master
go

----������������� ��, ������
restore database Primer_474_3
from Chernih_Shagin_474_BD
with norecovery --���� �� ��������� �������������� ��
go

--������������� ��, ����������
restore database Primer_474_3
from Chernih_Shagin_474_BD
with file = 5, norecovery
go

--������������� ��, ������
restore log Primer_474_3
from Chernih_Shagin_474_Log
with file = 2, recovery
go--������� ����������� �� �������
