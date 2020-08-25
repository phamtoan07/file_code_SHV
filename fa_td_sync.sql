select * from fldmaster where objname = '9403';

select * from search where searchcode = 'FA0011' for update;
select * from searchfld where searchcode = 'FA0011' for update;

select * from searchtxmapfld where searchcode = 'FA0011' and tltxcd = '9431';


select * from user_source where upper(text) like '%UPDATE GLMASTEXT SET STATUS =%';

-------
select * from fastatement where txdate = to_date('07/08/2025','DD/MM/RRRR') and txnum = '000001000135';

select * from  tllogfld where txdate = to_date('07/08/2025','DD/MM/RRRR') and txnum = '000001000135';
fn_aidiffgl_9431_9433
-------
select * from fldmaster where objname = '9431';
select * from fldval where objname = '9431';


insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921399, '[-921399] : Roll over contract not found', '[-921399] : Roll over contract not found', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-930009, '[-930009] : Error when excecute transaction id 9264/9276/9431', '[-930009] : Error when excecute transaction id 9264/9276//9431', 'FA', 0);

----
select * from fund where symbol = 'ETF02'; --001278

select * from fafundacctbnk where fundcodeid = '001278';

select * from syn_cbfa_log_notify order by autoid desc for update;

select * from syn_cbfa_glmastext where refnotifyid = '244883';

select * from glmastext where fundcodeid = '001278' and acexttype = 'TD' for update;
-----
fn_aidiffgl_9431_9433

select * from deferror where errnum = '-930009' for update;

---
select * from tlog where luser = user order by id desc; --11/08/2025 

select * from tllogfld where txnum = '000001000075'  and txdate = to_date('11/08/2025','dd/mm/rrrr')
