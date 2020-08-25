
--FA
-  Change Floating Bond: Thêm type, cho vào reminder ở fund 
-	 Send SSC report: Thêm type, cho vào reminder ở fund (có cần chi tiết cho từng loại báo cáo?) 
-	 Send fee collection notification: Có sẵn (1)
-	 Thanh toán theo dealing cycle: Phí ETF, OEF, PEN... (2)
-	 Process the Year-end closing: Thêm mới
-  Chốt quyền cho sự kiện quyền OTC (9434)
-  HĐ REPO khi đến hạn
-  Remind SB check TE của Quỹ
--SB
-	 Deadline rectification: màn hình work status
-  Lịch AGM/BOR meeting: Fund supervising rule/Tab Regular work rule
-  Approve Payment Instruction (FA0042):

----
-- => vậy là nững cái type phí ví dụ như OEF fee... gì đó, thì cái này  = Yes
--    và nó sẽ lên cả 2 màn hình Reminder của FA và Approve của SB
--    tức là FA0057 sẽ confirm cho cái trạng thái của remind bên fund kia => ok ạ
--    Nhưng màn đó còn có Work status, Regular working và Approve payment instruction => thêm 2 type (bỏ payment instruction)
--    SB approve sbstatus ở màn hình Fa0057 vs các type có is it standing = YES
--    Type gom bảng kê -> cần tách lịch gom và lịch gửi mail
reminder: Add user, group mail
--
select * from search where searchcode = 'FA0057'; --SBSCHDREGU DEALINGCYCLE
--
select * from fldmaster where objname = 'SA.PAYSCHEDULE' for update;

select * from cmdmenu where mnviewcode = 'FA0096' for update;

SELECT * FROM (
       SELECT CDVAL VALUE, CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY 
       FROM ALLCODE where cdname = 'CBTXTYPE' and CDTYPE = 'SB' and CDVAL not in ('TADFS','SEVFEE','CLS','OPN','TATFS') order by LSTODR)
UNION ALL
SELECT * FROM (
       SELECT CDVAL VALUE, CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY
       FROM ALLCODE where cdname = 'REMINDER' and cdtype = 'SB' order by LSTODR)

SELECT * FROM ALLCODE WHERE CDNAME = 'REMINDER' FOR UPDATE;
SELECT * FROM ALLCODE WHERE CDNAME = 'PAYFREQUENCY' FOR UPDATE;

alter table PAYSCHEDULE add anually VARCHAR2(10);
alter table PAYSCHEDULE add semianually VARCHAR2(10);
alter table PAYSCHEDULE add dealingcycle number;

select * from fldmaster where llist like '%PAYFREQUENCY%';
select * from fldmaster where taglist like '%PAYFREQUENCY%'
select * from search where searchcmdsql like '%PAYFREQUENCY%';
SELECT * FROM PAYSCHEDULE for update;
select * from SBSCHDREGU;

select * from search where tltxcd = '9314';

select * from FACOLLECTIONSCHEDULE;

fnc_gen_recievedamt_9349

--searchcode SA.PAYSCHEDULE
select * from search where searchcode = 'PAYSCHEDULE' for update ;
select * from searchfld where searchcode = 'PAYSCHEDULE' order by position for update ;

select * from fldmaster where llist like '%PAYMECHANISM%';
select * from fldmaster where taglist like '%PAYMECHANISM%'
select * from search where searchcmdsql like '%PAYMECHANISM%';
select * from user_source where upper(text) like '%PAYMECHANISM%';

select * from allcode where cdname = 'PAYMECHANISM' for update;

select PAY.AUTOID, PAY.CODEID, FUND.SYMBOL, A1.CDCONTENT DESCPAYTYPE, A2.CDCONTENT DESCFREQUENCY,
       PAY.DEALINGCYCLE, A4.CDCONTENT DESCISSTANDING, PAY.REFAUTHORIZATION, A5.CDCONTENT  DESCMECHANISM, 
       A7.EN_CDCONTENT ISAUTO, A8.EN_CDCONTENT FEETYPE,
       fnc_get_reminderemail(PAY.CODEID,PAY.PAYTYPE,'U') USERMAIL, 
       fnc_get_reminderemail(PAY.CODEID,PAY.PAYTYPE,'G') GROUPEMAIL,
       A3.CDCONTENT DESCSTATUS, A6.CDCONTENT DESCSBSTATUS
from PAYSCHEDULE PAY, FUND, ALLCODE A1, ALLCODE A2, ALLCODE A3, ALLCODE A4, ALLCODE A5, ALLCODE A6, ALLCODE A7, ALLCODE A8
WHERE PAY.CODEID = FUND.CODEID AND PAY.STATUS <> 'D'
and PAY.PAYTYPE = A1.CDVAL and A1.CDTYPE = 'SB' and A1.CDNAME = 'CBTXTYPE'
and PAY.FREQUENCY = A2.CDVAL and A2.CDTYPE = 'SA' and A2.CDNAME = 'PAYFREQUENCY'
and PAY.STATUS = A3.CDVAL and A3.CDNAME = 'MSTATUS' and A3.CDTYPE = 'SA'
and PAY.ISSTANDING = A4.CDVAL and A4.CDNAME = 'YESNO' and A4.CDTYPE = 'SY'
and PAY.MECHANISM = A5.CDVAL and A5.CDNAME = 'PAYMECHANISM' and A5.CDTYPE = 'SA'
and PAY.SBSTATUS = A6.CDVAL and A6.CDNAME = 'DESCSBSTATUS' and A6.CDTYPE = 'SB'
and PAY.ISAUTO = A7.CDVAL and A7.CDNAME = 'YESNO' and A7.CDTYPE = 'SY'
and PAY.FEETYPE = A8.CDVAL and A8.CDNAME = 'IOROFEE' and A8.CDTYPE = 'SA'
--
select * from reminderemail;
--
select *from allcode where cdname = 'PAYMECHANISM';
--
--supervising rule
select * from fldmaster where objname like '%SBSCHDREGU%' for update;

select a.CDVAL VALUECD, a.CDVAL VALUE, a.CDCONTENT DISPLAY, a.EN_CDCONTENT EN_DISPLAY 
from allcode a where a.cdtype='SB' and a.cdname='SCHDREGUTYP' and a.cdval not in ('S') order by a.lstodr

select * from allcode where cdname = 'SCHDREGUTYP' for update;

select * from  SBSCHDREGU;
select * from search where searchcode like '%FA.SBSCHDREGU%';
alter table SBSCHDREGU modify SCHDREGUTYP VARCHAR2(10);

--
SELECT AL.CDVAL VALUE, AL.CDCONTENT DISPLAY, AL.CDCONTENT EN_DISPLAY FROM allcode AL 
WHERE AL.cdname ='ROLECODE' AND AL.CDTYPE ='SA' AND CDVAL IN ('CB','SB','PAX','PAM','TA','PO','SBH','AP')

-----
--ALERT
select * from search where searchcode = 'ALERT';
