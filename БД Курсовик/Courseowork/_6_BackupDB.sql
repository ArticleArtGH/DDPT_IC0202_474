use ARCs
go

--�������� ��������� ��������� �����������

--��� ��
exec sp_addumpdevice 'disk', 'deviceARCs_DB', 'E:\MS SQL Server 2017 Edition\����������\
MSSQL14.SQLEXPRESS\MSSQL\Backup\deviceARCs_DB.bak'
--��� �������� ����������
exec sp_addumpdevice 'disk', 'deviceARCs_Log', 'E:\MS SQL Server 2017 Edition\����������\
MSSQL14.SQLEXPRESS\MSSQL\Backup\deviceARCs_Log.bak'
go

--exec sp_dropdevice 'deviceARCs_DB'
--go
--exec sp_dropdevice 'deviceARCs_Log'
--go


--�������� �����������

--��
backup database ARCs to deviceARCs_DB
go

--�������� ����������
backup log ARCs to deviceARCs_Log
go

--����������
backup database ARCs to deviceARCs_DB with differential
go
