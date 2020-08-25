select * from sbfundetf;
alter table sbfundetf add totalamt number(38,10) default 0;

select * from cmdmenu where prid = '925050' for update;


insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('925058', '925050', 4, 'Y', 'O', null, 'FA', 'FA0049', 'Đánh giá chênh lệch chứng khoán ảo', 'Valuation of AP''s securities', 'NNNNYNYNNNN', null, null, 'FA0049', 'B', 'FA', null);

select * from SBACTISUPR;

----
SELECT MT.*, A1.EN_CDCONTENT DESCCFICODE, A4.EN_CDCONTENT EVASTATUS, 
       A2.EN_CDCONTENT FAPRICESTATUS, A3.EN_CDCONTENT SBPRICESTATUS
FROM
  (SELECT E.AUTOID, E.FUNDCODEID,FU.SYMBOL, E.REFSYMBOL, E.TRADINGID, E.TRADEDATE,
       (E.OBLIQTTY-E.BUYQTTY) AVLQTTY, E.PRICE ETFPRICE, M.MBNAME_EN, SB.NAVDATE,
       FN_NAV_SUGGESTEDPRICE(E.FUNDCODEID, E.REFSYMBOL,E.TRADEDATE) SUGGESTEDPRICE,
       INS.BOARD, INS.CFICODE,SB.FAVALUE FAPRICE,E.TOTALAMT,
       (SB.FAVALUE - E.PRICE)*(E.OBLIQTTY-E.BUYQTTY)-E.TOTALAMT EXTRAAMT,
       CASE WHEN (SB.FAVALUE - E.PRICE)*(E.OBLIQTTY-E.BUYQTTY)-NVL(E.TOTALAMT,0) > 0
            THEN (SB.FAVALUE - E.PRICE)*(E.OBLIQTTY-E.BUYQTTY)-NVL(E.TOTALAMT,0)
            ELSE 0 END PROFITAMT,
       CASE WHEN (SB.FAVALUE - E.PRICE)*(E.OBLIQTTY-E.BUYQTTY)-NVL(E.TOTALAMT,0) < 0
            THEN NVL(E.TOTALAMT,0)-(SB.FAVALUE - E.PRICE)*(E.OBLIQTTY-E.BUYQTTY)
            ELSE 0 END  LOSSAMT,
       FN_NAV_EVASTATUS(E.FUNDCODEID, E.REFSYMBOL, SY.CURRDATE) STATUS,
       FN_NAV_PRICESTATUS(E.FUNDCODEID,E.REFSYMBOL,SY.CURRDATE,'FA') FASTATUS,
       FN_NAV_PRICESTATUS(E.FUNDCODEID,E.REFSYMBOL,SY.CURRDATE,'SB') SBSTATUS,
       'Revaluation' || '/' || E.REFSYMBOL || '/' || GETCURRDATE DESCRIPTION  
  FROM SBFUNDETF E,INSTRLIST INS, FUND FU, SBACTISUPR SB, MEMBERS M,
     (SELECT TO_DATE(VARVALUE,'DD/MM/YYYY') CURRDATE FROM SYSVAR 
             WHERE GRNAME = 'SYSTEM' AND VARNAME ='CURRDATE') SY
  WHERE FU.CODEID = E.FUNDCODEID
      AND INS.SYMBOL = E.REFSYMBOL
      AND SB.REFITEM = E.REFSYMBOL
      AND SB.FUNDCODEID = E.FUNDCODEID
      AND SY.CURRDATE = SB.NAVDATE
      AND M.MBCODE = E.DBCODE) MT,
      ALLCODE A1, ALLCODE A2, ALLCODE A3, ALLCODE A4
WHERE MT.CFICODE = A1.CDVAL AND A1.CDNAME = 'CFICODE' AND A1.CDTYPE = 'SB'
      AND MT.FASTATUS = A2.CDVAL AND A2.CDNAME = 'PRICESTATUS' AND A2.CDTYPE = 'FA'
      AND MT.SBSTATUS = A3.CDVAL AND A3.CDNAME = 'PRICESTATUS' AND A3.CDTYPE = 'FA'
      AND MT.STATUS = A4.CDVAL AND A4.CDNAME = 'EVASTATUS' AND A4.CDTYPE = 'FA';
 ------
 select * from allcode where cdname = 'PRICESTATUS';
 select * from allcode where cdname = 'EVASTATUS';
 
 select * from search where searchcode like 'FA0049' for update;
 
select * from search where searchcode like 'FA0048' for update;
 
 select * from searchfld where searchcode like 'FA0049' for update;
 
 ---------
 
 select * from tltx where tltxcd like '9359' for update;
 
  select * from tltx where tltxcd like '9423' for update;
 
 select * from fldmaster where objname = '9423' for update;
 
 select * from search where searchcode = 'FA9423';
  select * from searchfld where searchcode = 'FA9423';
 
 select * from tltxwf where tltxcd = '9349';
 
insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9359', 1, 'V1', 2, 1, 'N', 'A', null, null);

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9359', 2, 'V2', 2, 1, 'Y', 'C', null, null);

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9423', 1, 'V1', 2, 1, 'N', 'A', null, null);

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9423', 2, 'V2', 2, 1, 'Y', 'C', null, null);

-----
select * from fapostmap where tltxcd = '9359';

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9359', 1.0000000000, 'C', '02', '1211', '@STOK', '90', '14', 'Chênh lệch lỗ', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9359', 1.0000000000, 'D', '02', '632', '@DEF', '@NORM', '14', 'Chênh lệch lỗ', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9359', 2.0000000000, 'C', '02', '5113', '@DEF', '90', '12', 'Chênh lệch lãi', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);

insert into fapostmap (TLTXCD, SUBTXNO, DORC, FUNDCODEID, ALIASCD, SUBCD, REFCD, AMTEXP, NAME, REFID, CACFLD, CAMTEXP, AUTOID, EXPECD, INSTCD, ARAPCD, DEALCD, BANKCD, RESRCD, FUNCNMAE, FUNCPARAM)
values ('9359', 2.0000000000, 'D', '02', '1211', '@STOK', '90', '12', 'Chênh lệch lãi', null, null, null, seq_fapostmap.nextval, 'DEF', '90', 'DEF', 'DEF', 'DEF', 'DEF', null, null);



 -----
 
create sequence SEQ_SBFUNDETFLOGVAL
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
nocache;

----
create table SBFUNDETFLOGVAL 
(
  autoid     NUMBER(38,10),
  refkey     NUMBER,
  fundcodeid VARCHAR2(250),
  refsymbol  VARCHAR2(250),
  navdate    DATE,
  tradedate  DATE,
  membername VARCHAR2(250),
  totalqtty  NUMBER(38,10),
  costprice  NUMBER(38,10),
  faprice    NUMBER(38,10),
  profit     NUMBER(38,10),
  loss       NUMBER(38,10),
  txnum      VARCHAR2(250),
  txdate     DATE,
  deltd      VARCHAR2(1) default 'N'
)

----
select * from SBFUNDETFLOGVAL;

select * from sbfundetf where autoid = '88';

select * from gltran where tltxcd = '9359' order by autoid desc;

select * from deferror;

-----

select * from tltx where tltxcd IN ('9363','9423') for update;
 
