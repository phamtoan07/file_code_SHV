select * from search where searchcode = 'ALERT';
select * from search where searchcode = 'FA0057';

SELECT ROWNUM STT,SYMBOL,DES,TLID
FROM
(
SELECT des, tlid, symbol FROM VW_ALERT_FOR_ADMIN
union
select notes des, '0001' tlid, refsymbol from alert_temp where txdate >= getcurrdate - 5
union
select notes des, '0001' tlid, symbol
from (select symbol
             (case when intfloatcd = 'Y' then 
                   (case when INTNEXTDT - getcurrdate <= 10 and INTNEXTDT - getcurrdate >= 0 
                         then 'Payment date is approaching, change interest rate if necessary' end) 
              end) notes 
      from instrlist)
where notes is not null
)
WHERE 0=0

SELECT DISTINCT FU.CODEID FUNDCODEID, FU.SYMBOL, A1.EN_CDCONTENT REMINDTYPE, P.PAYTYPE REMINDCD,
'Auto' TYPEALERT, OBJ.TXDATE||' '||OBJ.OFFTIME CREATEDTIME, OBJ.TXDATE, OBJ.OFFTIME
FROM FUND FU, PAYSCHEDULE P,
 (SELECT * FROM VW_OBJLOGHIST_ALL 
  WHERE CHILTABLE = 'PAYSCHEDULE' AND ACTIONFLAG = 'ADD' AND TXSTATUS = 1) OBJ,
  (SELECT CDVAL, CDCONTENT, EN_CDCONTENT FROM ALLCODE WHERE CDTYPE IN ('SB') AND CDNAME = 'CBTXTYPE' 
          AND CDVAL NOT IN ('TADFS','SEVFEE','CLS','OPN','TATFS')
   UNION ALL
   SELECT CDVAL, CDCONTENT, EN_CDCONTENT FROM ALLCODE WHERE CDTYPE IN ('SB') AND CDNAME = 'REMINDER') A1
WHERE OBJ.PARENTVALUE = FU.CODEID AND P.AUTOID = OBJ.CHILDVALUE
      AND A1.CDVAL = P.PAYTYPE AND P.CODEID = OBJ.PARENTVALUE

select * from vw_objloghist_all WHERE CHILTABLE = 'PAYSCHEDULE' AND TXSTATUS = 1;

select *
from vw_objloghist_all where autoid = 1933 and txstatus = 1;


select * from PAYSCHEDULE;


--====Change Floating Bond: INTFLOATCD = 'Y', remind at Next coupon date – 10
-->	Change Floating Bond: check Fund sở hữu trái phiếu có trường Floating rate = Yes,
    
select v.symbol || ' - ' || v.remindtype || ' - ' || i.intnextdt des, 
       '0001' tlid, v.symbol, v.createdtime
from fasemast fa, instrlist i, vw_reminder_create_time v
where i.intfloatcd = 'Y' and i.intnextdt - getcurrdate <= 10 and i.intnextdt - getcurrdate >= 0
      and fa.refsymbol = i.symbol and nvl(fa.trade,0) + nvl(fa.repoqtty,0) + nvl(fa.receiving,0) > 0
      and fa.fundcodeid = v.fundcodeid

----
