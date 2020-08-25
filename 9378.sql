select * from search where searchcode = 'FACAMAST';
select * from search where searchcode = 'CBFACAMAST' for update;
select * from searchfld where searchcode = 'FACAMAST'

select * from search where searchcode = 'FA9378' for update;
select * from searchfld where searchcode = 'FA9378' for update;

select * from searchtxmapfld where tltxcd = '9232';

select * from searchtxmapfld where searchcode = 'CBFACAMAST' and tltxcd IN ('9378','9232', '9236','9308','9336') for update;

select * from searchtxmapfld where searchcode = 'CBFACAMAST' and tltxcd IN ('9378') for update;
-----
9230/9232/9236

select * from fldmaster where objname = '9230';
select * from fldval where objname = '9230'; PARVALUE, INTRATE 10 = 14DEVIDENTRATE * 18BALACE 84PARVALUE/100
select * from fapostmap where tltxcd IN ('9230','9232','9308','9236');

select * from fldmaster where objname = '9232'; --EXCHANGE ROUNDTYPE PRICE ODDAMT
select * from fldval where objname = '9232'; 

select * from fldmaster where objname = '9236';
select * from fldval where objname = '9236';

select * from fldmaster where objname = '9322';

select * from fldmaster where objname = '9308';

select * from fldmaster where objname = '9336';

----------
SELECT * FROM ALLCODE where cdname = 'CATYPE';
select * from tltxwf for update;

select* from tltx where tltxcd = '9378' for update;

------
select *from fldmaster where objname = '9378' for update; --9322/9308/9336

select *from fldval where objname = '9378' for update;
select * from fldval where tagfield is not null;

---
select * from fldval where objname in ('9230','9232','9320','9321','9236','9322','9308','9336') and fldname = '10';

-----------
select * from fapostmap where tltxcd = '9378';

----
select * from fldval where tagfield is not null;

-------

select * from fldmaster where objname = '5051';

----

select v.*, t.txnum, t.txdate from vw_cbfacamast v, 
(select tl.TXNUM, tl.TXDATE, fl.FLDCD, TO_NUMBER(fl.CVALUE) AUTOID, fl.TXDESC 
from vw_tllog_all tl, vw_tllogfld_all fl 
where tl.tltxcd = '9378' and deltd = 'N'
      and fl.TXNUM = tl.TXNUM
      and fl.txdate = tl.txdate
      and fl.fldcd = '01') t
where v.AUTOID = t.AUTOID
;


select v.*, t.txnum, t.txdate from vw_cbfacamast v,
(select tl.TXNUM, tl.TXDATE, fl.FLDCD, fl.NVALUE AUTOID, fl.TXDESC 
from vw_tllog_all tl, vw_tllogfld_all fl 
where tl.tltxcd = '9378' and deltd = 'N'
      and fl.TXNUM = tl.TXNUM
      and fl.txdate = tl.txdate
      and fl.fldcd = '01') t
where v.AUTOID = t.autoid(+)
;

----
