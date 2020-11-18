select * from allcode where cdname = 'CBTXTYPE' and cdtype = 'SB'; -- TASU TARD TAEX ETFEX ETFRD PENRD --SLPAY

select v.remindtype || ' - ' || v.symbol || ' - ' || v.frequency  des,
       CASE WHEN INSTR(FNC_GET_REMINDID(v.FUNDCODEID,v.REMINDCD),'0001' || '|') <=0 THEN
         '0001|' || FNC_GET_REMINDID(v.FUNDCODEID,v.REMINDCD)
       ELSE FNC_GET_REMINDID(v.FUNDCODEID,v.REMINDCD) END tlid, v.symbol, v.createdtime,
       'Reminder FA - ' || v.REMINDTYPE subject, v.REMINDTYPE,
       fn_date_reminder(v.autoid,t.tradingdate) EMAILDATE, v.REMINDCD, t.AUTOID
from   vw_reminder_create_time v,
      (select f.autoid,f.txtype, f.fundcodeid,
               case when f.txtype <> 'SEVFEE' then fn_get_tradedate_reminder(f.autoid) 
               else f.settlementdate end tradingdate
       from fastatement f where f.status = 'P' and f.deltd <>'Y' and f.txtype not in ('TDM')
       union all
       select f.autoid,f.txtype, f.fundcodeid,
              case when f.txtype <> 'SEVFEE' then fn_get_tradedate_reminder(f.autoid) else f.settlementdate end tradingdate
      from fastatement f, fastatementgroup g
      where f.status = 'G' and g.autoid = f.grid and g.status = 'N' and f.txtype not in ('TDM')
      and g.deltd <>'Y' and f.deltd<> 'Y'
      select from fata
      ) t
where t.fundcodeid = v.FUNDCODEID and t.txtype = v.REMINDCD
      and v.REMINDCD IN
      (SELECT CDVAL FROM ALLCODE WHERE CDTYPE IN ('SB') AND CDNAME = 'CBTXTYPE'
                                 AND CDVAL NOT IN ('TADFS','TATFS') )
      and fn_date_reminder(v.autoid,t.tradingdate) = getcurrdate
