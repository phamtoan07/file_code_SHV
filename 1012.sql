select * from tltx where tltxcd = '1012' for update;

select * from fldmaster where objname = '1012' for update;

select * from fldval where objname = '1012' for update;

SELECT AL.CDVAL VALUE, AL.CDCONTENT DISPLAY, AL.CDCONTENT EN_DISPLAY FROM ALLCODE AL WHERE AL.CDNAME ='YESNO' AND AL.CDTYPE ='SY';


select * from allcode where cdname = 'SYNSTATUS' for update;


select sy.*,  from syn_cbfa_log_notify sy, ALLCODE A1
WHERE sy.STATUS = A1.CDVAL
      AND A1.CDNAME = 'SYNSTATUS'
      AND A1.CDTYPE = 'FA'
      
------------

select * from cmdmenu where prid = '001000' for update;

select * from cmdmenu where lower(EN_CMDNAME) like '%confirm%'

----

select * from tltx where tltxcd in ('9238','1012') for update;

--
select * from tlog where LUSER = 'FUNDSHVTEST' order by id desc;

---
select * from tltxwf where tltxcd = '1012' for update; 9060
