select * from search where tltxcd = '9310';

select * from search where searchcode = 'FA0041';

-----

select * from (
 select 'GR'|| to_char(t.autoid) autoid,
       to_char(t.refTXDATE, 'dd/MM/rrrr') TXDATE,
       t.reftxnum txnum,
       '' fundcodeid,
       ''   MBNAME,
       '' txdesc,
       t.txamt,
       '' tradingid,
       a.cdcontent TXTYPE,
       t.txtype txtypecd,
       A1.CDCONTENT STATUS,
       d.symbol,
     d.codeid,
       '' REFSYMBOL,
       t.fundaccount,
       t.beneficiaryaccount,
       t.beneficiaryname,
       t.beneficiarybank,
       to_char(t.settlementdate,'dd/MM/rrrr') settlementdate,
       contract.typecontract
  from fastatementgroup t, fund d, allcode a1,allcode a,
  (select fa.grid ,t.typecontract from fastatement fa ,servicecontract t
 where fa.tradingid = to_char(t.autoid)  group by fa.grid ,t.typecontract) contract
 where
    d.symbol = t.symbol
   and a1.Cdname = 'CBSTATUS'
   AND A1.CDVAL = T.STATUS
   AND A1.CDTYPE = 'SB'
   and a.cdname = 'CBTXTYPE'
   and a.cdtype = 'SB'
   and t.status = 'P'
   and t.autoid = contract.grid(+)
   and a.cdval = t.txtype) where 0=0
   
-----

select * from servicecontract;

select * from fastatementgroup where status = 'P';

--
select * from allcode where cdname = 'TYPECONTRACT';

select * from allcode where cdname = 'CBTXTYPE';---

-------

select autoid,seq_facb_statement.NEXTVAL@FACBLINK,txtype,settlementdate,fundaccount,txamt,
       arrrefautoid, symbol,beneficiaryaccount,beneficiaryname,beneficiarybank
FROM fastatementgroup a;

-----

SELECT * FROM SEARCH WHERE SEARCHCODE ='CBFANOTIFY';

---

select sy.*, A1.EN_CDCONTENT,
case when sy.action ='DELETE' then 'Deleted' else 'Create new' end TRANSTYPE
from syn_cbfa_log_notify sy, ALLCODE A1
WHERE sy.STATUS = A1.CDVAL
      AND A1.CDNAME = 'SYNSTATUS'
      AND A1.CDTYPE = 'FA'
      
-----
select * from allcode where cdname = 'SYNSTATUS' for update;
