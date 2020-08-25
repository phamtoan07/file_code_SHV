9266, 9366 -> glmastext

9223 -> servicecontract

9257,  -> glmastext INTACCRDT
9265   -> fasemast  INTACCRDT
9447 - -> glmastext INTACCRDT
9339   -> faaccruedschd INTACCRUEDDT

di chi lãi loan contract nữa

có cái GD dự thu bất động sản

select * from tltx where tltxcd in ('9447');

select * from faaccruedschd;
select * from fapropertycontr;

select * from search where searchcode = 'FAREALCONTR';
select * from cmdmenu where mnviewcode = 'FA0105';

---
select * from deferror order by errnum for update;

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921400, '[-921400] : Term deposit/Certificate of deposit interest not accrued', '[-921400] : Term deposit/Certificate of deposit interest not accrued', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921401, '[-921401] : Expenditure repo bond not estimated', '[-921401] : Expenditure repo bond not estimated', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921402, '[-921402] : Bond interest not accrued', '[-921402] : Bond interest not accrued', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921403, '[-921403] : Loan contract interest not accrued', '[-921403] : Loan contract interest not accrued', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921404, '[-921404] : Leasing contract not accrued', '[-921404] : Leasing contract not accrued', 'FA', 0);

----
select * from search where searchcode = 'FA0011';
