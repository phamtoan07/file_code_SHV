select * from fldmaster where objname = '9264';
select * from glmastexthist;

SELECT * FROM ALLCODE WHERE CDTYPE='FA' AND CDNAME='INVESTACCT.TERMCD'; -- loại kì hạn
SELECT * FROM ALLCODE WHERE CDTYPE='SY' AND CDNAME='INTPERIODCD' AND CDVAL = 'L'; -- chu kỳ trả lãi

-- Marturity date ngày đáo hạn
select * from tltx where tltxcd in ('9311','9267','9392','9431')
-- 9264-->9311-->9266-->9267
FN_GET_INTEREST
---
select * from search where searchcode = 'FA0011';
select * from searchfld where searchcode = 'FA0011';
select * from FLDMASTER where OBJNAME = '9267';
select * from fldmaster where objname = '9445';
select * from FLDVAL where OBJNAME = '9267';
select * from searchtxmapfld where searchcode = 'FA0011' and tltxcd = '9267';
select * from searchtxmapfld where searchcode = 'FA0011' and tltxcd = '9445';

SELECT * FROM USER_SOURCE WHERE UPPER(TEXT) LIKE '%FXINTACCRUED%';
SELECT * FROM SEARCH WHERE TLTXCD LIKE '%9266%';

--FA0011
SELECT DISTINCT A.AUTOID, A.STATUS,CASE WHEN NVL(A.CURRENCY,'VND') ='VND' THEN '0' ELSE '1' END ISCURRENCY,
       A.ACCTNO,
       A.CONTRACTNO,
       A.REFSYMBOL,
       A.QTTY,
       NVL(A.INTACCRUED,0) + NVL(A.INTPAID,0) INTACCR,
       NVL(A.INTACCRUED,0) INTACCRUED,
       C.CODEID FUNDCODEID,
       C.SYMBOL, A.FRDATE, A.TODATE,
       A.TERMVAL,
       A1.EN_CDCONTENT TERMCDNAME,
       A2.EN_CDCONTENT DESCSTATUS,
       A.INTRATE,
       A.BALANCE,
       NVL(O.FULLNAME, '') BANKNAME,
     (case when s.bankcode is null then 'No' else 'Yes' end) VALIDBANK,
       NVL(A.BANKCD,A.IDOBJECT) BANKCODE,
       A1.CDVAL TERMCD,
       A.FXAMT, NVL(A.CURRENCY,'VND') CURRENCY, FN_GET_EXCHANGERATE_BY_CODEID(A.FUNDCODEID,NVL(A.CURRENCY,'VND')) EXCHANGERATE, A.EXRATE EXRATECONTRACT,
       A.FXINTACCRUED,A.FXINTPAID,
       FN_FA_INTACCRTD_FX(A.AUTOID,NVL(A.INTACCRDT+1,A.FRDATE)) - A.FXINTACCRUED FXINTNOTACCRUED,
       (CASE WHEN A.REFAUTOID IS NULL THEN NULL ELSE 'Roll over' END) CTTYPE,
       B.CONTRACTNO OLDCONTRACTNO,
       case when a.fxamt - a.dramt > 0 then 'N' else 'Y' end isfinal
    FROM GLMASTEXT A, GLMASTEXT B, FUND C, ALLCODE A1, ALLCODE A2, FAOBJECT O,
    (select fundcodeid,bankcode from (
    select fundcodeid,bankcode from sbfundbank
    union all
    select fundcodeid,id bankcode from faobject where fundcodeid not in (select fundcodeid from sbfundbank))) S
    WHERE A.ACEXTTYPE = 'TD' AND A.TXDEALTYPE = 'P' AND (A.BALANCE > 0 or A.FXAMT > 0) AND A.bankcd=O.ID (+)
   AND A2.CDVAL = A.STATUS AND A2.CDNAME = 'FATANOTICETX' AND A2.CDTYPE='FA'
   AND A1.CDVAL = A.TERMCD AND A1.CDNAME = 'INVESTACCT.TERMCD' AND A1.CDTYPE='FA'
   AND A.FUNDCODEID = C.CODEID
    AND A.FUNDCODEID = C.CODEID
   and A.FUNDCODEID = s.fundcodeid (+)
   AND A.REFAUTOID = B.AUTOID (+)
   AND A.DELTD <> 'Y'
---FA0056
select * from search where searchcode = 'FA0056';
select * from searchfld where searchcode = 'FA0056';

SELECT A.AUTOID,
       C.CODEID FUNDCODEID,
       A.REFSYMBOL,
       A.CONTRACTNO,
       A.FXAMT,
       (A.BALANCE + A.INTACCRUED) CONTVAL,
       A2.EN_CDCONTENT STATUS,
       NVL(A.CURRENCY, 'VND') CURRENCY,
       TO_CHAR(A.FRDATE, 'dd/MM/rrrr') FRDATE,
       to_char(A.TODATE, 'dd/MM/rrrr') TODATE,
       (A.TODATE - A.FRDATE +1)  TERMCDNAME,
       nvl(A.INTACCRDT, A.FRDATE) INTACCRDT,
       NVL(A.INTACCRUED, 0) INTACCRUED,
       A.FXINTACCRUED,
       ROUND(FN_FA_INTACCRTD_FX(A.AUTOID,TO_CHAR(least(fn_next_nav_date(A.FUNDCODEID,to_char(getcurrdate,'DD/MM/RRRR')),a.todate),'DD/MM/RRRR')),6)*FN_GET_EXCHANGERATE_BY_CODEID(A.FUNDCODEID, NVL(A.CURRENCY, 'VND')) - NVL(A.INTACCRUED, 0) NAVINTACC,
       NVL(A.INTACCRUED, 0) + NVL(A.INTPAID, 0) INTACCR,
       C.SYMBOL,
       ROUND(COALESCE((A.BALANCE + A.INTACCRUED) /nullif((A.FXAMT + A.FXINTACCRUED), 0),1),6) EXCHANGERATE,
       FN_GET_EXCHANGERATE_BY_CODEID(A.FUNDCODEID, NVL(A.CURRENCY, 'VND')) EXCHANGERATEVAL,
       A.FXINTPAID,
       fn_next_nav_date(A.FUNDCODEID, to_char(getcurrdate, 'DD/MM/RRRR')) navdate,
       A.NOTES,
       A.ACEXTTYPE,
       fa.fullname bankcd,
       fa.id objid
  FROM GLMASTEXT A, FUND C, ALLCODE A2, faobject fa
 WHERE A.ACEXTTYPE IN ('TD', 'CD')
   AND A.TXDEALTYPE = 'P'
   AND A.BALANCE > 0
   AND A.STATUS in ('A','E')
   AND A.FUNDCODEID = C.CODEID
   and a.bankcd = fa.id(+)
   AND A2.CDNAME = 'FATANOTICETX'
   AND a2.cdtype = 'FA'
   and a2.cdval = a.status
--------

select * from search where searchcode = 'FA0009';

select * from tltx where tltxcd = '9445' order by tltxcd desc for update;

select * from fldmaster where objname = '9445' for update;
select * from fldval where objname = '9445' for update;

select * from searchtxmapfld where searchcode = 'FA0011' and tltxcd = '9445';

select * from fldmaster where objname = '9445' for update;
select * from fldval where objname = '9445' for update; FNC_IS_CURRENCY FNC_IS_CURRENCY_VND

---
select * from deferror order by errnum for update;

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921397, '[-921397] : Amount must be less than or equal to principal amount', '[-921397] : Amount must be less than or equal to principal amount', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921398, '[-921398] : Principal withdaw must be less than or equal to principal amount', '[-921398] : Principal withdaw must be less than or equal to principal amount', 'FA', 0);
---
select FN_GET_INTREVERSE_9445(1437,1500000,500000) from dual;

FN_GET_TOTALAMTVND_9445 FN_GET_INTWITHDRAW_9445

select * from tlog where luser = 'FUNDSHVDEV'order by id desc;

SELECT G.INTRATE, G.FRDATE FROM GLMASTEXT G WHERE AUTOID = TO_NUMBER('850');
-- 1	8.0000000000	01/08/2019
select (50*8*(getcurrdate-to_date('01/08/2019','DD/MM/RRRR')+1))/(365*100) - 39 from dual;
--
ALTER TABLE GLMASTEXT ADD WITHDRAW NUMBER(30,8) default 0;
ALTER TABLE GLMASTEXT ADD WITHDRAWVND NUMBER(30,8) default 0;

ALTER TABLE GLMASTEXTHIST ADD WITHDRAW NUMBER(30,8) default 0;
ALTER TABLE GLMASTEXTHIST ADD WITHDRAWVND NUMBER(30,8) default 0;

--
select * from fapostmap where tltxcd = '9267' for update;

Nếu Currency = VND
N11210000/C121005050 – Giá trị gốc rút
N 515205050/C13215050 – Lãi thoái thu
N11210000/C515205050 – Lãi thực nhận

Nếu Currency <>VND

N11220000/C121005050 – Giá trị gốc rút
N 515205050/C13215050 – Lãi thoái thu
N11220000/C515205050 – Lãi thực nhận
C007 = Credit advance


insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 1.0000000000, 'C', '02', '12100505', '@DEF', '@NORM', '46**53', 'Giá trị gốc VND', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 1.0000000000, 'D', '02', '11210000', '@DEF', '@NORM', '46**53', 'Giá trị gốc VND', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 2.0000000000, 'C', '02', '12100505', '@DEF', '@NORM', '47**53', 'Giá trị lãi rút VND', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 2.0000000000, 'D', '02', '11210000', '@DEF', '@NORM', '47**53', 'Giá trị lãi rút VND', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 3.0000000000, 'C', '02', '12100505', '@DEF', '@NORM', '48**53', 'Giá trị lãi thoái thu VND', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 3.0000000000, 'D', '02', '11210000', '@DEF', '@NORM', '48**53', 'Giá trị lãi thoái thu VND', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 4.0000000000, 'C', '02', '12100505', '@DEF', '@NORM', '41**52', 'Giá trị gốc nguyên tệ', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 4.0000000000, 'D', '02', '11210000', '@DEF', '@NORM', '41**52', 'Giá trị gốc nguyên tệ', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 5.0000000000, 'C', '02', '12100505', '@DEF', '@NORM', '42**52', 'Giá trị lãi rút nguyên tệ', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 5.0000000000, 'D', '02', '11210000', '@DEF', '@NORM', '42**52', 'Giá trị lãi rút nguyên tệ', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 6.0000000000, 'C', '02', '12100505', '@DEF', '@NORM', '42**52', 'Giá trị lãi thoái thu nguyên tệ', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 6.0000000000, 'D', '02', '11210000', '@DEF', '@NORM', '42**52', 'Giá trị lãi thoái thu nguyên tệ', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9445', 7.0000000000, 'C', '02', '007', '@DEF', '@NORM', '10**52', 'Giá trị gốc nguyên tệ báo có', '99', null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

---
select * from tltxwf where tltxcd = '9445';

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9445', 1, 'V1', 2, 1, 'N', 'A', null, null);

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9445', 2, 'V2', 2, 1, 'Y', 'C', null, null);

