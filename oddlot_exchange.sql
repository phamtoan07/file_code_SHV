select * from semast where acctno = '0001000028002034';

select * from sepitlog;

select * from sesendout;

select * from user_source where upper(text) like '%INSERT INTO SESENDOUT%';
select * from user_source where upper(text) like '%UPDATE SESENDOUT%';

select * from tltx where tltxcd in ('2244','2254','2255','2265','2266');

select * from fldmaster where objname = '2245';

select * from fldmaster where objname = '2266';

select * from fldmaster where objname = '2244';

select * from tltx where tltxcd = '9425';


SELECT  * FROM ALLCODE WHERE CDTYPE = 'SE' AND CDNAME = 'TRTYPE' ORDER BY LSTODR



select * from search where searchcode = 'SE2244';

select * from searchfld where searchcode = 'SE2244';

select * from fldmaster where objname= '2244';
select * from fldval where objname= '2244';

v_se2244

select * from v_appmap_by_tltxcd where tltxcd = '2244';

select * from allcode where cdname = 'TXSTATUS';

select * from tllog order by length(txnum) desc, txdate desc;

--=================
select * from cfmast where custodycd = 'SHVB000309' and supebank = 'Y';

select * from vw_setran_all where tltxcd = '2245';


select v.CUSTODYCD,v.ACCTNO,v.SYMBOL,SUM(NAMT) TRADE,v.TXNUM,v.TXDATE
from vw_setran_gen v,cfmast c 
where tltxcd = '2245' and v.FIELD in('TRADE','BLOCKED','EMKQTTY') and txtype = 'C'
      and c.custodycd = v.CUSTODYCD and c.supebank = 'Y'
group by v.CUSTODYCD,v.ACCTNO,v.SYMBOL,v.TXNUM,v.TXDATE;

select * from sesendout;

select se.*, dd.acctno ddacctno, dd.afacctno ddaf from semast se,ddmast dd 
where se.afacctno = dd.afacctno and se.acctno  ='0001000005000021';

select * from ddmast where afacctno IN (select afacctno from semast);

select * from ddmast;

select t.*, cf.custodycd,s.symbol from sesendout t, semast se, cfmast cf, sbsecurities s
  where t.acctno = se.acctno
        and se.custid = cf.custid
        and s.codeid = t.codeid

select t.strade + t.blocked trade, t.sblocked, t.scaqtty,t.recustodycd tocustodycd, null toseacctno from sesendout t
where autoid  = p_autoid

select * from vw_setran_gen where tltxcd = '2255';

select * from v_appmap_by_tltxcd where tltxcd = '2244';

select * from vw_setran_gen;

select * from setrana;

select * from CBFA_ODDEXCHANGE@CBFALINK;

select * from apptx where txcd = '0087';
