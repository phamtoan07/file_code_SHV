select * from cbfacamast;

alter table cbfacamast add nohold number default 0;

select * from search where searchcode = 'FA1002'; vw_cbfacamast
select * from searchfld where searchcode = 'FA1002' order by position for update;

---
select codeid,symbol, ftype, custodycd from fund where ftype = 'ETF';

select * from fldmaster where objname = '9415' order by odrnum for update;
select * from fldval where objname = '9415';
--postmap
select * from fapostmap where tltxcd = '9415' order by subtxno for update;
select * from fapostmapexp where tltxcd = '9415';
select * from fapostmapval where tltxcd = '9415';
--

select * from search where searchcode = 'FA9415CA' for update;
select * from searchfld where searchcode = 'FA9415CA' order by position for update;

---

------
SELECT CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM ALLCODE WHERE CDNAME='YESNO' AND CDTYPE='SY';

SELECT CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM ALLCODE WHERE CDNAME='CATYPE' AND CDTYPE='CA';

select * from fldmaster where objname = '9349';

select * from searchfld where searchcode = 'FA1002' for update;
select * from searchfld where searchcode = 'FA1002';

select v.autoid,v.STATUS,v.STATUSCONTENT,v.SYNSTATUS,v.SYNSTATUSCONTENT,
       v.fundcodeid,v.SYMBOL,v.REFSYMBOL,v.CATYPE,v.TYPE,v.CAMASTID,
       v.BALANCE,v.NOHOLD,case when v.CATYPE = '014' then v.PBALANCE else v.QTTY end QTTY,
       v.AMT,v.EXDIVIDEND,v.OPTSYMBOL,v.PBALANCE,v.CADESC,
       nvl(c.BALANCE,0) PRVBALANCE, nvl(c.NOHOLD,0) PRVNOHOLD, 
       nvl(c.QTTY,0) PRVQTTY, nvl(c.AMT,0) PRVAMT, nvl(c.PBALANCE,0) PRVPBALANCE,
       nvl(c.autoid,0) prvautoid,
       nvl(c.AMT,0) - ROUND(FNC_ETFOBLI_CACALC(v.CAMASTID,'C',nvl(c.NOHOLD,0),0,'R'),0) GLOLD,
       v.AMT - ROUND(FNC_ETFOBLI_CACALC(v.CAMASTID,'C',v.NOHOLD,0,'R'),0) GLNEW
       --12500000 GLOLD,
       --15800000 GLNEW
from vw_cbfacamast v,
     (select t.* from 
     (select autoid, STATUS, SYNSTATUS,FUNDCODEID,REFSYMBOL,CAMASTID,
             BALANCE, NOHOLD, QTTY, AMT,PBALANCE,
             RANK() over( PARTITION BY FUNDCODEID, CAMASTID ORDER BY autoid DESC) RANK
      from vw_cbfacamast where catype <> '023' and status = 'A' and SYNSTATUS = 'U') t
      where t.rank = 1 ) c
where v.catype <> '023' and v.status = 'P' and v.SYNSTATUS = 'C'
      and c.fundcodeid = v.FUNDCODEID and c.camastid = v.CAMASTID

select * from  allcode where cdname = 'SYNSTATUS';

select * from cbfacamast where autoid in ('477','480');

----
select * from fapostmap where tltxcd = '9378' for update;
select * from fapostmapexp where tltxcd = '9378' for update;
select * from fapostmapval where tltxcd = '9378' for update;


select * from fldmaster where objname = '9378';
select * from fldval where objname = '9378';
FN_GETHOLDSELL_9378_CASH ROUND(FNC_ETFOBLI_CACALC(pv_camastid,'C',v_holdsell - v_sellqtty,0,'R'),0)
----
FN_GETHOLDSELL_9378_CASH

------
--9415, postmap 9415, search FA9415CA, 9349 ex, defferror

select *
