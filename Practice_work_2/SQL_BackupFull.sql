use Primer_474_3
go

--������ ����� ��
backup database Primer_474_3
to Chernih_Shagin_474_BD
go

--����� �������
backup log Primer_474_3
to Chernih_Shagin_474_Log
go

--������������������ �����
insert into Departament(Dept_no, Dept_name)
values('D4', 'Economic')
go
--�����
backup database Primer_474_3
to Chernih_Shagin_474_BD
with differential
go
