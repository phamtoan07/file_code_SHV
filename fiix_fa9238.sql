select * from fldval where objname='9238';

select * from fapostmap where tltxcd = '9268' for update;


SELECT c.owner,c.object_name,c.object_type,b.sid,b.serial#,b.status,b.osuser,b.machine
FROM v$locked_object a,v$session b,dba_objects c
WHERE b.sid = a.session_id AND a.object_id = c.object_id;

alter system kill session '1187,46077';

select * from fapostmap where tltxcd='9238';

select * from search where tltxcd like '%9238%';

select * from searchtxmapfld where searchcode = 'FA1005' and tltxcd = '9238';

select * from fldmaster where objname='9238';

---------
select * from fapostmap where tltxcd='9286';

---------

select * from allcode where cdname = 'IOROFEE';

---------
select * from fldval where objname = '9349';

select * from fldmaster where objname = '9349';

select * from searchfld where searchcode = 'FA0048';

select * from search where searchcode = 'FA0048';

select * from fldval where objname = '9238';

select * from fldmaster where objname = '9238' for update;

---
 -- Thêm 1 trường register for AP, sum trong sbfundetflog or
 


insert into fldmaster (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, FLDWIDTH, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, CTLTYPE, RISKFLD, GRNAME, TAGFIELD, TAGVALUE, TAGLIST, TAGQUERY, PDEFNAME, TAGUPDATE, FLDRND, SUBFIELD, PDEFVAL, DEFDESC, DEFPARAM, SEARCHFLT)
values ('FA', '20', '9238', 'APQTTY', 'Số lượng đặt mua AP', 'AP''s subscription quantities', 9.1, 'N', '#,##0', 'n2', 10, 30, ' ', ' ', '0', 'Y', 'N', 'Y', ' ', ' ', 'N', 'N', null, null, null, null, '##########', null, null, null, null, 'T', 'N', 'MAIN', null, null, null, 'N', null, 'Y', '0', 'N', null, null, null, null);

insert into fldmaster (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, FLDWIDTH, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, CTLTYPE, RISKFLD, GRNAME, TAGFIELD, TAGVALUE, TAGLIST, TAGQUERY, PDEFNAME, TAGUPDATE, FLDRND, SUBFIELD, PDEFVAL, DEFDESC, DEFPARAM, SEARCHFLT)
values ('FA', '21', '9238', 'FUNDAMT', 'Giá trị mua (quỹ)', 'Subscription amount (fund)', 10, 'N', '999g999g999', 'n2', 10, 30, ' ', ' ', '0', 'N', 'Y', 'Y', ' ', ' ', 'N', 'N', null, null, null, null, '##########', '09TXAMT', null, null, null, 'T', 'N', 'MAIN', null, null, null, 'N', 'P_QTTY', 'Y', '0', 'N', null, null, null, null);

insert into fldmaster (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, FLDWIDTH, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, CTLTYPE, RISKFLD, GRNAME, TAGFIELD, TAGVALUE, TAGLIST, TAGQUERY, PDEFNAME, TAGUPDATE, FLDRND, SUBFIELD, PDEFVAL, DEFDESC, DEFPARAM, SEARCHFLT)
values ('FA', '22', '9238', 'APAMT', 'Giá trị ', 'Subscription amount (AP)', 10.1, 'N', '999g999g999', 'n2', 10, 30, ' ', ' ', '0', 'N', 'Y', 'Y', ' ', ' ', 'N', 'N', null, null, null, null, '##########', '09TXAMT', null, null, null, 'T', 'N', 'MAIN', null, null, null, 'N', 'P_QTTY', 'Y', '0', 'N', null, null, null, null);


