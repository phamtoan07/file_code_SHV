select * from cmdmenu where prid = '927230' for update; like '%CA%';

------

insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('927240', '927230', 2, 'Y', 'A', null, 'FA', null, 'Ghi nhận lãi trái phiếu', 'Bond interest dividend', 'YYYYYYYYYY', '9320', null, null, null, 'FA', null);

insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('927241', '927230', 2, 'Y', 'A', null, 'FA', null, 'Ghi nhận phải thu đáo hạn trái phiếu', 'Maturity bond dividend booking', 'YYYYYYYYYY', '9321', null, null, null, 'FA', null);
---

select * from fldmaster where objname = '9320';

select * from fldval where objname = '9320';




select * from searchtxmapfld where tltxcd = '9320';

--search FA9320
SELECT * FROM
(SELECT AUTOID, CATYPE, SYMBOL, REFSYMBOL, AMT, REPORTDATE, ACTIONDATE, DEVIDENTRATE, INTAMT,
        FUNDCODEID, STATUS,STATUSCONTENT, TYPE, CAMASTID, EXDIVIDEND, SYNSTATUS, SYNSTATUSCONTENT
 FROM VW_CBFACAMAST
 WHERE  CATYPE = '015' AND SYNSTATUS = 'C' AND STATUS = 'P'
 )
WHERE 0=0;
----
select * from search where searchcode = 'FA9320' for update;
select * from searchfld where searchcode = 'FA9320' for update;

---
select * from searchtxmapfld where tltxcd = '9320';
select * from fldmaster where objname = '9320' for update;
select * from searchfld where searchcode = 'FA9320' for update

--------

select * from cbfacamast where camastid = '0001004370007005' for update;

------------------------------------------------------------------------

select * from searchtxmapfld where tltxcd = '9321';

SELECT * FROM
(SELECT AUTOID, CATYPE, SYMBOL, REFSYMBOL, AMT, REPORTDATE, ACTIONDATE, DEVIDENTRATE, INTAMT,
        FUNDCODEID, STATUS,STATUSCONTENT, TYPE, CAMASTID, EXDIVIDEND, SYNSTATUS, SYNSTATUSCONTENT
 FROM VW_CBFACAMAST
 WHERE  CATYPE = '016' AND SYNSTATUS = 'C' --AND STATUS = 'P'
 )
WHERE 0=0;

select * from searchtxmapfld where searchcode = 'CBFACAMAST' and tltxcd = '9321';
select * from searchfld where searchcode = 'FA9321' for update;

select * from search where searchcode = 'FA9321' for update;

select * from fldmaster where objname = '9321' for update;

------

select * from allcode where cdname = 'CATYPE' and cdtype = 'CA';

select * from allcode where cdname = 'SYNSTATUS' and cdtype = 'FA';

select * from allcode where cdname = 'CBFASTATUS' and cdtype = 'FA';

