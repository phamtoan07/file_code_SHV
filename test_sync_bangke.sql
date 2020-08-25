-----CB

SELECT * FROM syn_facb_log_notify WHERE objname ='FACBSTATEMENT';

delete from syn_facb_log_notify WHERE objname ='FACBSTATEMENT';

select * from FACB_STATEMENTGROUP where refnotifyid = '68'; FA.20200311.000001014623

delete from FACB_STATEMENTGROUP;

select * from crbtxreq where reqtxnum = 'FA.20200311.000001014623' for update; 03012020000081
update FACB_STATEMENTGROUP  set bankstatus = 'S'   WHERE GLOBALID = 'FA.20200311.000001014623';
update crbtxreq  set status = 'C'   WHERE reqtxnum = 'FA.20200311.000001014623';

delete from crbtxreq where reqtxnum like 'FA.%';

update FACB_STATEMENTGROUP set bankstatus = 'S' where globalid = 'FA.20200311.000001014604';

select * from log_notify_cbfa where objname = 'FACBSTATEMENT_RESULT';

delete log_notify_cbfa where objname = 'FACBSTATEMENT_RESULT';
-------CBSYN
select * from FACB_STATEMENTGROUP t;

alter table FACB_STATEMENTGROUP rename column STATUS TO SYNSTATUS;

alter table FACB_STATEMENTGROUP rename column SBSTATUS TO BANKSTATUS;

select * from cbfa_bankadvicetx@CBFALINK where banktxnum = 'FA.20200311.000001014604';


delete FACB_STATEMENTGROUP t;
select  cr.objkey, cr.txdate, cr.objname from crbtxreq cr where cr.reqtxnum = 'FA.20200311.000001014599';
-----FASYN
select * from CB_FASTATEMENT t

RENAME CB_FABANKPAYMENT TO CBFA_BANKPAYMENT;

select * from CBFA_BANKPAYMENT;

------

select * from cbfa_bankadvicetx;


-------FA

select * from log_notify_facb where objname = 'FACBSTATEMENT';

select * from crbtxreq where reqtxnum = 'FA.20200311.000001014599';

delete log_notify_facb where objname = 'FACBSTATEMENT';


select * from fastatementgroup where symbol = 'VFMVF4' and status = 'S';

select * from fastatement where grid = '789';

update fastatementgroup set status = 'P' where autoid = '789';

update fastatement set status='P'  where grid = '789';


-----
SELECT  * from FAFUNDACCTBNK;

SELECT * FROM FABANKADVICETX;

---
select * from allcode where cdname = 'CBTXTYPE';-- FEERED

---
select * from search where searchcode = 'FA0042' for update;

select * from searchfld where searchcode = 'FA0042' for update;

select * from search where searchcode = 'FA0041';

select * from searchfld where searchcode = 'FA0041'; fastatementgroup

RENAME FACBSTATEMENT TO CBFABANKPAYMENT;

----
   
-----
select * from fldmaster where objname = '9305';

---
select * from vw_tllog_all where tltxcd = '9305';
select * from vw_tllogfld_all where txnum = '000001003084';

---
select * from fastatementgroup where status = 'S';

---
select * from fund where symbol = 'VFMVF4';
