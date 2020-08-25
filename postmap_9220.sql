ALTER TABLE SBFUNDETFHIST ADD DELTD VARCHAR2(1) DEFAULT 'N';

/
select * from fapostmapval where tltxcd = '9220';

--------

prompt Importing table fapostmapval...
set feedback off
set define off
insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9220', 'C', '12110101', '12110102', 'DEF', 'RC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', 2585, 3689);

insert into fapostmapval (TLTXCD, DORC, ALIAS, GLREF, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, AUTOID, REFID)
values ('9220', 'D', '12110101', '12110102', 'DEF', 'RC.EXC', 'DEF', 'DEF', 'DEF', 'DEF', 2584, 3692);

prompt Done.
