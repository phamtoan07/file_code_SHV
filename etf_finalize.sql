select * from tltx where tltxcd in ('9418','9419');

select * from fldmaster where objname in ('9418'); --TRADEDATE Nộp tiền mua chứng khoán ảo ETF
select * from search where searchcode = 'TRADEDATE';


select * from fldmaster where objname in ('9419'); --APETF  Trả tiền chứng khoán AP
select * from search where searchcode = 'APETF';

select * from fapostmap where tltxcd = '9418';
select * from servicecontract;
---
select * from sbfundetf;
ALTER TABLE sbfundetf ADD SELLAMT NUMBER(38,10) DEFAULT 0;
ALTER TABLE sbfundetf ADD ISFINAL VARCHAR2(1) DEFAULT 'N';
ALTER TABLE sbfundetf ADD STATUS VARCHAR2(1) DEFAULT 'A';

ALTER TABLE sbfundetfhist ADD SELLAMT NUMBER(38,10) DEFAULT 0;
ALTER TABLE sbfundetfhist ADD ISFINAL VARCHAR2(1) DEFAULT 'N';
ALTER TABLE sbfundetfhist ADD STATUS VARCHAR2(1) DEFAULT 'A';
---
--> Lamf 9418 isfinal = Y
--> Lam thuc nhan tien -> status = C
--> Sua batch backup hist
--> sua faproc them DK isfinal = 'N' and status = 'A'
--> sua cac form search FA0047,0048,0049,0031,0032
--> sua view dinh gia FA9220, GD 9333
--> sua view securities balance, balance AP
--> sua cac func get_cash, get_stock
--> ra soat lai update etf where DK isfinal, status
--> then CAAMT vao FA0067
---
select * from cmdmenu where mnviewcode = 'FA0067' for update;
select * from tltx where tltxcd = '9418' for update;
SELECT * FROM SEARCH WHERE SEARCHCODE LIKE 'FA0067' for update;
SELECT * FROM SEARCHFLD WHERE SEARCHCODE LIKE 'FA0067' for update;
select * from fldmaster where objname = '9418' for update;
select * from fapostmap where tltxcd = '9418' for update;
---
select * from SEARCH where searchcode like 'FA0071' for update;
select * from SEARCHFLD where searchcode like 'FA0071' for update;

select * from cmdmenu where prid = '925062' for update;

SELECT * FROM (
SELECT T.*, A1.EN_CDCONTENT DORCDESC
FROM
  (SELECT SB.AUTOID,SB.OBLIQTTY - NVL(TR.AMT,0) ORGOBLIQTTY, SB.OBLIQTTY, SB.BUYQTTY,
         (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100) ORGOBLIAMT,SB.BUYAMT,SB.PAIDAMT AMT,   
         CASE WHEN SB.PAIDAMT >=0 THEN SB.PAIDAMT ELSE 0 END PAIDAMTDUONG,
         CASE WHEN SB.PAIDAMT < 0 THEN -SB.PAIDAMT ELSE 0 END PAIDAMTAM,
         SB.REFSYMBOL,SB.FUNDCODEID, SB.TRADINGID, C.SYMBOL, SB.CUSTODYCD, SB.DBCODE MBCODE, FA.CLEARDATE,
         SB.TRADEDATE, M.MBNAME, FA.REFKEY, SB.PRICE, SB.OBLIQTTY - SB.BUYQTTY REMAINQTTY,
         CASE WHEN SB.OBLIQTTY - SB.BUYQTTY > 0 THEN '1' ELSE '0' END NOTEQUAL,
         CASE WHEN SB.OBLIQTTY - SB.BUYQTTY = 0 THEN '1' ELSE '0' END EQUAL,
         CASE WHEN SB.PAIDAMT >=0 THEN 'D' ELSE 'C' END DORC,
         CASE WHEN SB.PAIDAMT >=0 THEN '1' ELSE '0' END isdebit,
         CASE WHEN SB.PAIDAMT <0 THEN '1' ELSE '0' END iscredit
   FROM SBFUNDETF SB, FATANOTICETX FA, FUND C, MEMBERS M,
   (SELECT LOG.REFSBFUNDETF AUTOID , SUM ( DECODE (LOG.DORC,'C',LOG.NVALUE,'D',-LOG.NVALUE )) AMT
                                  FROM SBFUNDETFLOG LOG
                                  WHERE LOG.TBLNAME = 'SBFUNDETF' AND LOG.FLDNAME = 'OBLIQTTY' AND LOG.DELTD <> 'Y'
                                  GROUP BY REFSBFUNDETF ) TR
  WHERE SB.AUTOID = TR.AUTOID(+) AND SB.DELTD <> 'Y' AND SB.TXTYPE = 'S' AND SB.OBLIQTTY - NVL(TR.AMT,0) >0
        AND SB.STATUS = 'A' AND SB.ISFINAL = 'Y'
        AND FA.TXDATE = SB.TXDATE AND FA.TXNUM = SB.TXNUM AND FA.DELTD <> 'Y'
        AND C.CODEID = SB.FUNDCODEID AND M.MBCODE = SB.DBCODE ) T, ALLCODE A1
  WHERE A1.CDTYPE = 'SB' AND A1.CDNAME = 'DORC' AND A1.CDVAL = T.DORC
) WHERE 0=0

select * from tltx where tltxcd = '9421' for update;

select * from fldmaster where objname = '9421' for update;
select * from SEARCHFLD where searchcode like 'FA0071' for update;
select * from SEARCH where searchcode like 'FA0071';
select * from deferror order by errnum for update;
select * from fapostmap where tltxcd = '9418' for update;


insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 1.0000000000, 'D', '02', '11200000', '@DEF', '@NORM', '19**23', 'Số tiền NĐT nộp (mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 1.0000000000, 'C', '02', '33101001', '@DEF', '@NORM', '19**23', 'Số tiền NĐT nộp (mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 2.0000000000, 'D', '02', '33101001', '@DEF', '@NORM', '19**22', 'Số tiền quỹ trả NĐT (mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 2.0000000000, 'C', '02', '11210000', '@DEF', '@NORM', '19**22', 'Số tiền quỹ trả NĐT (mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 3.0000000000, 'D', '02', '11200000', '@DEF', '@NORM', '17**23', 'Số tiền NĐT nộp (chưa mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 3.0000000000, 'C', '02', '13800000', '@DEF', '@NORM', '17**23', 'Số tiền NĐT nộp (chưa mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 4.0000000000, 'D', '02', '33880000', '@DEF', '@NORM', '17**22', 'Số tiền quỹ trả NĐT (chưa mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9421', 4.0000000000, 'C', '02', '11200000', '@DEF', '@NORM', '17**22', 'Số tiền quỹ trả NĐT (chưa mua hết)', null, null, null, seq_fapostmap.nextval, 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', 'DEF', null, null);


insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921390, '[-921390] : Payment amount is not equal to debit/credit amount ', '[-921390] : Payment amount is not equal to debit/credit amount ', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921391, '[-921391] : Not the same trading id', '[-921391] : Not the same trading id ', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921392, '[-921392] : Not the same AP', '[-921392] : Not the same AP', 'FA', 0);



---
SELECT * FROM (
SELECT SB.AUTOID,SB.OBLIQTTY - NVL(TR.AMT,0) ORGOBLIQTTY, SB.OBLIQTTY, SB.BUYQTTY,
       (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100) ORGOBLIAMT,SB.BUYAMT,SB.PAIDAMT,
       (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100) - SB.BUYAMT - NVL(CA.AMT,0) AMT,   
       CASE WHEN (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100) - SB.BUYAMT - NVL(CA.AMT,0) >=0
            THEN (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100) - SB.BUYAMT - NVL(CA.AMT,0) ELSE 0 END AMTDUONG,
       CASE WHEN (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100) - SB.BUYAMT - NVL(CA.AMT,0) < 0 
            THEN  SB.BUYAMT + NVL(CA.AMT,0)- (SB.OBLIQTTY - NVL(TR.AMT,0))*SB.PRICE*(110/100)  ELSE 0 END AMTAM,
       SB.REFSYMBOL,SB.FUNDCODEID, SB.TRADINGID, C.SYMBOL, SB.CUSTODYCD, SB.DBCODE MBCODE, FA.CLEARDATE,
       SB.TRADEDATE, M.MBNAME, FA.REFKEY, SB.PRICE, SB.OBLIQTTY - SB.BUYQTTY REMAINQTTY,
       CASE WHEN SB.OBLIQTTY - SB.BUYQTTY > 0 THEN '1' ELSE '0' END NOTEQUAL
 FROM SBFUNDETF SB, FATANOTICETX FA, FUND C, MEMBERS M,
 (SELECT LOG.REFSBFUNDETF AUTOID , SUM ( DECODE (LOG.DORC,'C',LOG.NVALUE,'D',-LOG.NVALUE )) AMT
                                FROM SBFUNDETFLOG LOG
                                WHERE LOG.TBLNAME = 'SBFUNDETF' AND LOG.FLDNAME = 'OBLIQTTY' AND LOG.DELTD <> 'Y'
                                GROUP BY REFSBFUNDETF ) TR,
 (SELECT LOG.REFSBFUNDETF AUTOID , SUM ( DECODE (LOG.DORC,'C',LOG.NVALUE,'D',-LOG.NVALUE )) AMT
                                FROM SBFUNDETFLOG LOG
                                WHERE LOG.TBLNAME = 'SBFUNDETF' AND LOG.FLDNAME = 'OBLIAMT'
                                      AND LOG.DELTD <> 'Y' AND LOG.TLTXCD = '9348'
                                GROUP BY REFSBFUNDETF ) CA
WHERE SB.AUTOID = TR.AUTOID(+) AND SB.DELTD <> 'Y' AND SB.TXTYPE = 'S' AND SB.OBLIQTTY - NVL(TR.AMT,0) >0
      AND SB.STATUS = 'A' AND SB.ISFINAL = 'N'
      AND FA.TXDATE = SB.TXDATE AND FA.TXNUM = SB.TXNUM AND FA.DELTD <> 'Y'
      AND C.CODEID = SB.FUNDCODEID AND M.MBCODE = SB.DBCODE
      AND SB.AUTOID = CA.AUTOID(+)) WHERE 0=0

-----VIEW 9419
SELECT SB.AUTOID,SB.OBLIQTTY - NVL(TR.AMT,0) OBLIQTTY, SB.BUYQTTY,SB.BUYAMT, SB.HOLDSELL, SB.SELLQTTY,SB.SELLAMT, SB.PAIDAMT,
       SB.OBLIAMT,SB.OBLIAMT - SB.BUYAMT AMT, CASE WHEN SB.OBLIAMT - SB.BUYAMT >= 0 THEN SB.OBLIAMT - SB.BUYAMT ELSE 0 END AMTDUONG,
       CASE WHEN SB.OBLIAMT - SB.BUYAMT < 0 THEN SB.BUYAMT - SB.OBLIAMT ELSE 0 END AMTAM,
       SB.REFSYMBOL,SB.FUNDCODEID, SB.TRADINGID, C.SYMBOL, SB.CUSTODYCD, SB.DBCODE MBCODE, FA.CLEARDATE, SB.TRADEDATE, M.MBNAME,
       CASE WHEN SB.OBLIQTTY - NVL(TR.AMT,0) - SB.BUYQTTY >= 0 AND SB.STATUS = 'A' AND SB.ISFINAL = 'N' THEN '9418'
       END TLTXCD
 FROM SBFUNDETF SB, FATANOTICETX FA, FUND C, MEMBERS M,
 (SELECT LOG.REFSBFUNDETF AUTOID , SUM ( DECODE (LOG.DORC,'C',LOG.NVALUE,'D',-LOG.NVALUE )) AMT
                                FROM SBFUNDETFLOG LOG, VW_TLLOG_ALL VW
                                WHERE LOG.TBLNAME = 'SBFUNDETF' AND LOG.FLDNAME = 'HOLDSELL'
                                      AND LOG.DELTD <> 'Y' AND VW.TXNUM = LOG.TXNUM AND VW.TXDATE = LOG.TXDATE
                                GROUP BY REFSBFUNDETF ) TR
WHERE SB.AUTOID = TR.AUTOID(+) AND SB.DELTD <> 'Y' AND SB.TXTYPE = 'S' AND SB.OBLIQTTY - NVL(TR.AMT,0) >0
      AND SB.STATUS = 'A' AND SB.ISFINAL = 'N' 
      AND FA.TXDATE = SB.TXDATE AND FA.TXNUM = SB.TXNUM AND FA.DELTD <> 'Y'
      AND C.CODEID = SB.FUNDCODEID AND M.MBCODE = SB.DBCODE
-------
select * from search where searchcode like 'FA0071' for update;

-------
select * from SBFUNDETFLOG log where LOG.TBLNAME = 'SBFUNDETF' AND LOG.FLDNAME = 'OBLIQTTY' and deltd <> 'Y';
select * from SBFUNDETF where autoid = '503';

update sbfundetf set status = 'A', isfinal = 'N' where DELTD <> 'Y';
update sbfundetfhist set status = 'A', isfinal = 'N' where DELTD <> 'Y';

-------
select * from tlog where luser = user order by id desc;

select * from sbfundetf where autoid = '706';

-------
select * from search where searchcode like 'FA0047';
select * from search where searchcode like 'FA0048';
select * from search where searchcode like 'FA0049';
VW_SBFUNDETF_VAL


