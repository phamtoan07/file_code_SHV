select * from search where searchcode = 'FA0033' for update;

select * from searchfld where searchcode = 'FA0033' for update;

select * from allcode where cdname = 'STATEMENTSTATUS' for update;

select * from fastatementgroup;

alter table fastatementgroup modify VAT number default 0;

select * from search where searchcode = 'FA0041' for update;

select * from searchfld where searchcode = 'FA0041' for update;

select * from search where searchcode = 'FA0043' for update;

select * from searchfld where searchcode = 'FA0043' for update;

select * from fldmaster where objname = '9304' for update;

------------

SELECT * FROM (
 SELECT 'GR'|| TO_CHAR(T.AUTOID) AUTOID,
       TO_CHAR(T.REFTXDATE, 'dd/MM/rrrr') TXDATE,
       T.REFTXNUM TXNUM,'' FUNDCODEID,'' MBNAME,'' TXDESC,
       NVL(T.TXAMT,0) TXAMT,NVL(T.VAT,0) VAT, NVL(T.TAXAMT,0) TAXAMT,
       '' TRADINGID,A.CDCONTENT TXTYPE,T.TXTYPE TXTYPECD, A1.EN_CDCONTENT STATUS,
       D.SYMBOL, D.CODEID,'' REFSYMBOL,T.FUNDACCOUNT,T.BENEFICIARYACCOUNT,
       T.BENEFICIARYNAME,T.BENEFICIARYBANK,
       TO_CHAR(T.SETTLEMENTDATE,'dd/MM/rrrr') SETTLEMENTDATE,
       CONTRACT.TYPECONTRACT CONTRTYPECD,A3.EN_CDCONTENT TYPECONTRACT,
       T.GLOBALID, T.FEETYPE FEETYPECD, A2.EN_CDCONTENT FEETYPE
  FROM FASTATEMENTGROUP T, FUND D, ALLCODE A1,ALLCODE A,ALLCODE A2,ALLCODE A3,
  (SELECT FA.GRID ,T.TYPECONTRACT,T.NO FROM FASTATEMENT FA ,SERVICECONTRACT T
 WHERE FA.TRADINGID = TO_CHAR(T.AUTOID) AND T.STATUS = 'A' GROUP BY FA.GRID ,T.TYPECONTRACT,T.NO) CONTRACT
 WHERE
    D.SYMBOL = T.SYMBOL
   AND A1.CDNAME = 'SYNCBANKSTATUS'
   AND A1.CDVAL = T.STATUS
   AND A1.CDTYPE = 'SA'
   AND A.CDNAME = 'CBTXTYPE'
   AND A.CDTYPE = 'SB'
   --AND T.STATUS = 'P'
   AND T.AUTOID = CONTRACT.GRID(+)
   AND A.CDVAL = T.TXTYPE
   AND A2.CDTYPE = 'SA'
   AND A2.CDVAL = T.FEETYPE
   AND A2.CDNAME = 'IOROFEE'
   AND A3.CDNAME(+) = 'EXPENSETYPE'
   AND A3.CDVAL(+) = CONTRACT.TYPECONTRACT
   AND A3.CDTYPE(+) = 'FA') WHERE 0=0
