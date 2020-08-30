select * from search where searchcode = 'ALERT' for update;
select * from searchfld where searchcode = 'ALERT' for update;

select * from search where searchcode='PAYSCHEDULE' for update;

SELECT ROWNUM STT, V.* FROM VW_NOTIFY_ALERT V WHERE 0=0 AND INSTR(v.tlid,'0001' || '|') > 0;
SELECT ROWNUM STT, V.* FROM VW_NOTIFY_ALERT V WHERE 0=0 AND INSTR(v.tlid,'<@KEYVALUE>' || '|') > 0;

VW_REMINDER_CREATE_TIME update

select * from payschedule where codeid = '000009' for update;
select * from reminderemail where fundcodeid = '000009' for update;

select * from allcode where cdname = 'PAYFREQUENCY';
select to_char(TO_DATE('02-SEP-2020'), 'dd') from dual;
select to_char(TO_DATE('30-SEP-2020'), 'mm') from dual;

select to_char(pck_cldr.fn_get_num_month_of_q(TO_DATE('30-JUN-2020'))) from dual;
select to_char(pck_cldr.fn_get_num_month_of_halfyear(TO_DATE('30-SEP-2020'))) from dual;

select substr('Q3|M30',5,2) from dual;

select getcurrdate from dual;

select * from search where searchcode = 'FA0057';


SELECT DISTINCT FU.CODEID FUNDCODEID, FU.SYMBOL, A1.EN_CDCONTENT REMINDTYPE, P.PAYTYPE REMINDCD, 
       P.FREQUENCY FREQUENCYCD, A2.EN_CDCONTENT FREQUENCY, 'Auto' TYPEALERT, 
       OBJ.TXDATE||' '||OBJ.OFFTIME CREATEDTIME, OBJ.TXDATE, OBJ.OFFTIME
FROM FUND FU, PAYSCHEDULE P, ALLCODE A2,
 (SELECT * FROM VW_OBJLOGHIST_ALL 
  WHERE CHILTABLE = 'PAYSCHEDULE' AND ACTIONFLAG = 'ADD' AND TXSTATUS = 1) OBJ,
  (SELECT CDVAL, CDCONTENT, EN_CDCONTENT FROM ALLCODE WHERE CDTYPE IN ('SB') AND CDNAME = 'CBTXTYPE' 
          AND CDVAL NOT IN ('TADFS','SEVFEE','CLS','OPN','TATFS')
   UNION ALL
   SELECT CDVAL, CDCONTENT, EN_CDCONTENT FROM ALLCODE WHERE CDTYPE IN ('SB') AND CDNAME = 'REMINDER') A1
WHERE OBJ.PARENTVALUE = FU.CODEID AND P.AUTOID = OBJ.CHILDVALUE
      AND A1.CDVAL = P.PAYTYPE AND P.CODEID = OBJ.PARENTVALUE
      AND A2.CDNAME = 'PAYFREQUENCY' AND A2.CDTYPE = 'SA' AND A2.CDVAL = P.FREQUENCY


select * from vw_objloghist_all WHERE CHILTABLE = 'PAYSCHEDULE' AND TXSTATUS = 1;
select * from allcode where cdname = 'PAYFREQUENCY';

select * from allcode where cdname = 'REMINDER' for update;

select * 
from vw_objloghist_all where autoid = 1933 and txstatus = 1;

/*
1 TASU  Payment to subscribe OEF  Payment to subscribe OEF
2 TARD  Redemption payment OEF  Redemption payment OEF
3 TAEX  Payment of excess subscription (OEF)  Payment of excess subscription (OEF)
4 TAFSR Fee payment OEF Fee payment OEF
5 TATAX Tax payment OEF Tax payment OEF
6 ETFRD Redemption payment ETF  Redemption payment ETF
7 ETFEX Payment of excess subscription (ETF)  Payment of excess subscription (ETF)
8 ETFFSR  Fee payment (ETF) Fee payment (ETF)
9 ETFTAX  Tax payment (ETF) Tax payment (ETF)
10  PENFSR  Fee payment pension fund  Fee payment pension fund
11  PENTAX  Tax payment pension fund  Tax payment pension fund
12  PENVI Violet payment pension fund Violet payment pension fund
13  PENRD Redemption payment pension fund Redemption payment pension fund
14  SLPAY Short loan payment  Short loan payment
15  FASSCW  Send SSC report weekly  Send SSC report weekly
16  FAOTHR  Send others report  Send others report
17  FACFB Change floating bond  Change floating bond
18  FASSCW  Send SSC report weekly  Send SSC report weekly
19  FAFCN Send fee collection notification  Send fee collection notification
20  FAPYC Process the Year-end closing  Process the Year-end closing
21  FAOTC CA entitlement process (OTC)  CA entitlement process (OTC)
22  FAREPO  Repo contract expired Repo contract expired
23  FASSCD  Send SSC report daily Send SSC report daily
24  FASSCM  Send SSC report monthly Send SSC report monthly
25  FASSCQ  Send SSC report quarterly Send SSC report quarterly
26  FASSCS  Send SSC report semi annually Send SSC report semi annually
27  FASSCY  Send SSC report annually  Send SSC report annually
28  SBDR  Deadline rectification  Deadline rectification
29  SBRW  Regular working Regular working
30  SBAPI Approve payment instruction   Approve payment instruction 
*/



--====Change Floating Bond: INTFLOATCD = 'Y', remind at Next coupon date – 10
-->	Change Floating Bond: check Fund sở hữu trái phiếu có trường Floating rate = Yes,
    
select v.remindtype || ' - ' || v.symbol || ' - ' || i.intnextdt des, 
       '0001' tlid, v.symbol, v.createdtime
from fasemast fa, instrlist i, vw_reminder_create_time v
where i.intfloatcd = 'Y' 
      and i.intnextdt - getcurrdate <= 10 and i.intnextdt - getcurrdate >= 0
      and fa.refsymbol = i.symbol  
      and nvl(fa.trade,0) + nvl(fa.repoqtty,0) + nvl(fa.receiving,0) > 0
      and fa.fundcodeid = v.fundcodeid
      and v.REMINDCD = 'FACFB'
     
--====-	Send SSC report:
--> Rule gửi: chọn Frequency chỉ hiển thị cho chọn theo Weekly, Monthly, Quarterly 
--> và gửi theo ngày trong tuần/tháng/quý đã nhập vào. Ví dụ: Frequency = Monthly.

select v.remindtype || ' - ' || v.symbol || ' - ' || v.frequency  des, 
       '0001' tlid, v.symbol, v.createdtime
from   vw_reminder_create_time v
where v.REMINDCD IN ('FASSCD','FASSCW','FASSCM','FASSCQ','FASSCS','FASSCY','FAOTHR')

--====-	Send fee collection notification:
--> Rule gửi: chọn Frequency chỉ hiển thị cho chọn theo Weekly, Monthly, Quarterly 
--> và gửi theo ngày trong tuần/tháng/quý đã nhập vào. Ví dụ: Frequency = Monthly.

select v.remindtype || ' - ' || v.symbol || ' (FA0055) - ' || v.frequency  des, 
       '0001' tlid, v.symbol, v.createdtime
from   vw_reminder_create_time v
where v.REMINDCD IN ('FAFCN')

--====-	Process the Year-end closing:
--> Rule gửi: chọn Frequency chỉ hiển thị cho chọn theo Weekly, Monthly, Quarterly 
--> và gửi theo ngày trong tuần/tháng/quý đã nhập vào. Ví dụ: Frequency = Monthly.

select v.remindtype || ' - ' || v.symbol || ' - ' || v.frequency  des, 
       '0001' tlid, v.symbol, v.createdtime
from   vw_reminder_create_time v
where v.REMINDCD IN ('FAPYC')

--====-	Thanh toán theo dealing cycle:
--> Rule gửi: chọn Frequency chỉ hiển thị cho chọn theo Weekly, Monthly, Quarterly 
--> và gửi theo ngày trong tuần/tháng/quý đã nhập vào. Ví dụ: Frequency = Monthly.

select v.remindtype || ' - ' || v.symbol || ' - ' || v.frequency  des, 
       '0001' tlid, v.symbol, v.createdtime
from   vw_reminder_create_time v
where v.REMINDCD IN 
      (SELECT CDVAL FROM ALLCODE WHERE CDTYPE IN ('SB') AND CDNAME = 'CBTXTYPE' 
                                 AND CDVAL NOT IN ('TADFS','SEVFEE','CLS','OPN','TATFS') )
                                 
--====-	Approve Payment Instruction (FA0042):

SELECT FU.SYMBOL, A0.CDCONTENT DES, '0001' tlid, 
       CB.TXDATE||' '||TO_CHAR(SY.LOGTIME,'HH24:MI:SS') CREATEDTIME
FROM CBFABANKPAYMENT CB, SYN_CBFA_LOG_NOTIFY SY, FUND FU, ALLCODE A0
WHERE CB.GLOBALID = SY.GLOBALID AND CB.FUNDCODEID = FU.CODEID AND CB.STATUS = 'P'
AND CB.INSTRUCTTYPE = A0.CDVAL AND A0.CDNAME ='CBTXTYPE' AND A0.CDTYPE IN ('SB','CF','CB')

--====-	Lịch AGM/BOR meeting:

SELECT FU.SYMBOL, SB.NOTES DES, '0001' tlid,
       OBJ.TXDATE||' '||OBJ.OFFTIME CREATEDTIME
FROM (SELECT * FROM VW_OBJLOGHIST_ALL WHERE AUTOID IN (SELECT MAX(AUTOID) FROM VW_OBJLOGHIST_ALL WHERE CHILTABLE = 'SBSCHDREGU' AND TXSTATUS = 1 GROUP BY CHILDVALUE)) OBJ, FUND FU, SBSCHDREGU SB
WHERE OBJ.PARENTVALUE = FU.CODEID AND OBJ.CHILDVALUE = TO_CHAR(SB.AUTOID)
AND FN_DATE_SBSCHDREGU(SB.AUTOID) = GETCURRDATE

--====-	Deadline rectification:

SELECT FU.SYMBOL, TO_DATE(SB.CREATEDT,'DD/MM/RRRR') || ' - ' || A2.EN_CDCONTENT || ' - ' || SB.TITLE_EN  DES, 
       '0001' tlid, TO_DATE(SB.CREATEDT,'DD/MM/RRRR') CREATEDTIME
FROM SBACTIMST SB, FUND FU, ALLCODE A2
WHERE SB.REFCODE = FU.CODEID AND SB.STATUS NOT IN ('C','F','D') AND SB.DELTD <> 'Y'
      AND nvl(SB.PRIORITY,'I') = A2.CDVAL AND A2.CDTYPE = 'SB' AND A2.CDNAME = 'PRIORITY';
