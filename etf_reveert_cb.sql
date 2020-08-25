select * from cbfacanceletf c for update;

select c.autoid, f.autoid, f.status from cb_fatanoticetx c, fatanoticetx f where f.refkey = c.refkey order by c.autoid desc;

select * from cb_fatanoticetx where autoid = '164';

seelct * from sbfundetf where 

select * from fatanoticetx where refkey = '25061100000024';

select * from falogcbtx where objname = 'CB_FATANOTICETX';

update cb_fatanoticetx set status = 'A' where autoid = '164';

create index cbfacanceletf_IDX on cbfacanceletf (AUTOID);
create index cb_fatanoticetx_IDX on cb_fatanoticetx (AUTOID);
create index sbfundetf_IDX on sbfundetf (AUTOID);
create index sbfundetflog_IDX on sbfundetflog(AUTOID);
create index SBFUNDETFCALOG_IDX on  SBFUNDETFCALOG(AUTOID);
create index SBFUNDETFCAHOLDLOG_IDX  on SBFUNDETFCAHOLDLOG(AUTOID);

----
select * from search where searchcode like '%FA00%';

------
select * from vw_revert_etf;
create or replace view vw_revert_etf as
select t.*,nvl(n.NAVDT,f.licensedate) NAVDATE, f.symbol,a1.en_cdcontent DESCSTATUS,
        a2.en_cdcontent desctxstatus, a3.en_cdcontent catype,
        nvl(nvl(s.ticker,t.refsymbol),'') ticker,nvl(s.costprice,0) costprice, 
        nvl(s.avlqtty,0) avlqtty, nvl(s.txqtty,0) txqtty
from 
(select t.refkey, t.globalid, t.fastatus, f.txnum, f.txdate, tl.tltxcd, '0' priority,
       tl.CCYUSAGE fundcodeid, null camastid, null refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9287
from vw_tllog_all tl, fatanoticetx f,
 (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
  where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = tl.txnum and f.txdate = tl.txdate
UNION ALL
select t.refkey, t.globalid, t.fastatus, f.reftxnum txnum, f.reftxdate txdate, tl.tltxcd, '1' priority,
       tl.CCYUSAGE fundcodeid, null camastid, null refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9285/9286
from vw_tllog_all tl, fatanoticetx f,
 (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
  where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.reftxnum = tl.txnum and f.reftxdate = tl.txdate
      and f.reftxnum is not null and f.reftxdate is not null
UNION ALL
select t.refkey, t.globalid, t.fastatus, sf.txnum, sf.txdate, tl.tltxcd, '2' priority,
       tl.CCYUSAGE fundcodeid, null camastid, sf.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9260
from vw_tllog_all tl, fatanoticetx f, sbfundetf s, fasfnoticetx sf,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and s.autoid = sf.refsbfundetf and sf.deltd <> 'Y' and sf.status <> 'R'
      and sf.txnum = tl.txnum and sf.txdate = tl.txdate
UNION ALL
select t.refkey, t.globalid, t.fastatus, sf.reftxnum txnum, sf.reftxdate txdate, tl.tltxcd, '3' priority,
       tl.CCYUSAGE fundcodeid, null camastid, sf.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9262/9268
from vw_tllog_all tl, fatanoticetx f, sbfundetf s, fasfnoticetx sf,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and s.autoid = sf.refsbfundetf and sf.deltd <> 'Y' and sf.status <> 'R'
      and sf.reftxnum = tl.txnum and sf.reftxdate = tl.txdate
UNION ALL
select t.refkey, t.globalid, t.fastatus, log.txnum, log.txdate, tl.tltxcd, '3' priority,
       tl.CCYUSAGE fundcodeid, null camastid, log.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9359
from vw_tllog_all tl, fatanoticetx f, sbfundetf s,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t,
     (select distinct txnum,txdate,refsbfundetf, refsymbol from sbfundetflog 
             where tblname IN ('SBFUNDETF','SBFUNDETFHIST') AND fldname = 'TOTALAMT' and tltxcd = '9359'
                   and deltd <> 'Y'
             group by txnum, txdate, refsbfundetf, refsymbol) log
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and log.txnum = tl.txnum and log.txdate = tl.txdate
      and log.refsbfundetf = s.autoid
UNION ALL
select t.refkey, t.globalid, t.fastatus, log.txnum, log.txdate, tl.tltxcd, '3' priority,
       tl.CCYUSAGE fundcodeid, log.camastid camastid, log.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9348
from vw_tllog_all tl, fatanoticetx f, sbfundetf s, SBFUNDETFCALOG log,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and log.txnum = tl.txnum and log.txdate = tl.txdate
      and log.refsbfundetf = s.autoid and log.deltd <> 'Y'
UNION ALL
select t.refkey, t.globalid, t.fastatus, log.txnum, log.txdate, tl.tltxcd, '3' priority,
       tl.CCYUSAGE fundcodeid, log.camastid camastid, log.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9349
from vw_tllog_all tl, fatanoticetx f, sbfundetf s, SBFUNDETFCAHOLDLOG log,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and log.txnum = tl.txnum and log.txdate = tl.txdate
      and log.refsbfundetf = s.autoid and log.deltd <> 'Y'
      and log.logtype in('CASH','AP')
UNION ALL
select t.refkey, t.globalid, t.fastatus, log.txnum, log.txdate, tl.tltxcd, '4' priority,
       tl.CCYUSAGE fundcodeid, null camastid, s.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9418/9419/9274
from vw_tllog_all tl, fatanoticetx f, sbfundetf s, FALOGCBTX log,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and log.txnum = tl.txnum and log.txdate = tl.txdate
      and log.refid = s.autoid
      and log.objname = 'SBFUNDETF' and log.tltxcd in ('9418','9419','9274')
UNION ALL
select t.refkey, t.globalid, t.fastatus, log.txnum, log.txdate, tl.tltxcd, '4' priority,
       tl.CCYUSAGE fundcodeid, log.camastid camastid, log.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9378
from vw_tllog_all tl, fatanoticetx f, sbfundetf s, SBFUNDETFCAHOLDLOG log,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and log.txnum = tl.txnum and log.txdate = tl.txdate
      and log.refsymbol = s.refsymbol and log.fundcodeid = s.fundcodeid
      and s.txtype = 'R' and log.logtype IN ('FU','FUCASH') and log.deltd <> 'Y'
UNION ALL
select t.refkey, t.globalid, t.fastatus, log.txnum, log.txdate, tl.tltxcd, '5' priority,
       tl.CCYUSAGE fundcodeid, log.camastid camastid, s.refsymbol refsymbol, tl.BUSDATE, tl.TXSTATUS,
       TL.MSGAMT AMOUNT, TL.MSGACCT, TL.TXDESC --9384
from vw_tllog_all tl, fatanoticetx f, sbfundetf s,
     (select c.refkey, c.globalid, c.status,c.fastatus from cbfacanceletf c, cb_fatanoticetx cb
             where c.refkey = cb.refkey and cb.status = 'A') t,
     (select distinct txnum,txdate,refsbfundetf,camastid from sbfundetflog 
             where tblname IN ('SBFUNDETF','SBFUNDETFHIST') AND fldname = 'HOLDSELL' and tltxcd = '9384'
                   and deltd <> 'Y'
             group by txnum, txdate, refsbfundetf,camastid) log 
where t.refkey = f.refkey and f.deltd <> 'Y'
      and f.txnum = s.txnum and f.txdate = s.txdate and s.deltd <> 'Y'
      and log.txnum = tl.txnum and log.txdate = tl.txdate
      and log.refsbfundetf = s.autoid) T,
(select fundcodeid, max(navdate) navdt from fanavtemp where fastatus = 'C' and deltd = 'N' group by fundcodeid) N,
(
   SELECT D.TXDATE, D.TXNUM, MAX(D.REFSYMBOL) TICKER, MAX(M.COSTPRICE) COSTPRICE,
                       MAX(M.TRADE+M.RECEIVING+M.REPOQTTY) AVLQTTY,
                       SUM (CASE WHEN T.TXTYPE='D' THEN -NAMT ELSE NAMT END) TXQTTY
   FROM VW_FASETRAN_ALL D, FASEMAST M, APPTX T
   WHERE M.ACCTNO=D.ACCTNO AND T.TXCD=D.TXCD
         AND T.TBLNAME='FASEMAST' AND T.FIELD IN ('TRADE','RECEIVING','REPOQTTY','SENDING','OBLIQTTY')
         GROUP BY D.TXDATE, D.TXNUM
 ) S,
 FUND F, ALLCODE A1, ALLCODE A2, FACAMAST CA, ALLCODE A3
WHERE T.FUNDCODEID=N.FUNDCODEID (+) AND F.CODEID = T.FUNDCODEID
      AND T.BUSDATE >= NVL(N.NAVDT,F.LICENSEDATE)
      AND A1.CDTYPE = 'SA' AND A1.CDNAME = 'STATUS' AND A1.CDVAL = T.FASTATUS
      AND A2.CDTYPE = 'SY' AND A2.CDNAME = 'TXSTATUS' AND A2.CDVAL = T.TXSTATUS
      AND CA.CAMASTID(+) = T.CAMASTID 
      AND A3.CDTYPE(+) = 'CA' AND A3.CDNAME(+) = 'CATYPE' AND A3.CDVAL(+) = CA.CATYPE
      AND T.TXDATE=S.TXDATE (+) AND T.TXNUM=S.TXNUM (+);


  

