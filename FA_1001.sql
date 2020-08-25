select * from allcode where cdname = 'FATANOTICETX'

select * from allcode where cdname like '%STATUS%';

select * from fund where codeid = '000601';

--------
select * from search where searchcode = 'FA1001' for update;

select * from searchfld where searchcode = 'FA1001' for update;
 
----

SELECT G.*, T.AUTOID CONFIRM,
       CASE WHEN T.AUTOID IS NOT NULL THEN 'A' ELSE 'P' END DOCSTATUS,
       CASE WHEN T.AUTOID IS NOT NULL THEN (SELECT EN_CDCONTENT FROM ALLCODE WHERE CDNAME = 'STATUS' AND CDTYPE = 'SA' AND CDVAL = 'A')
            ELSE (SELECT EN_CDCONTENT FROM ALLCODE WHERE CDNAME = 'STATUS' AND CDTYPE = 'SA' AND CDVAL = 'P')
       END DOCSTATUSCONTENT
FROM (SELECT GL.AUTOID,GL.ACEXTTYPE,GL.FUNDCODEID,F.SYMBOL,F.CUSTODYCD, GL.TXDATE, GL.CONTRACTNO, GL.TXDEALTYPE,
        CASE WHEN GL.TXDEALTYPE = 'B' THEN 'C' ELSE 'D' END DORC,
        A1.CDCONTENT TXDEALTYPECONTENT, GL.CAREFID,GL.BUYER, GL.SELLER,
        FA.FULLNAME BUYERCONTENT, FA1.FULLNAME SELLERCONTENT,
        GL.FRDATE, GL.TODATE, GL.REFSYMBOL, GL.QTTY, GL.PRICE, GL.BALANCE, GL.PAIDBALANCE,
        (GL.BALANCE - GL.PAIDBALANCE) SETTLEMENT,
        GL.FEE, GL.TAX, GL.NOTES, A3.EN_CDCONTENT STATUS,
        CASE WHEN (GL.BALANCE - GL.PAIDBALANCE) > 0 THEN 'Y' ELSE 'N' END PAYSTATUS,
        CA.CATYPE, CA.REPORTDATE, CA.EXDIVIDEND, NVL(GL.CURRENCY, 'VND') CURRENCY,
        FN_GET_EXCHANGERATE_BY_CODEID(GL.FUNDCODEID,NVL(GL.CURRENCY,'VND')) EXCHANGERATE
 FROM GLMASTEXT GL, ALLCODE A1, ALLCODE A3, FAOBJECT FA , FAOBJECT FA1, FUND F, FACAMAST CA
      WHERE GL.ACEXTTYPE = 'RT'
       AND GL.STATUS = 'A'
       AND A1.CDNAME = 'TXDEALTYPE'
       AND A1.CDTYPE = 'FA'
       AND A1.CDVAL = GL.TXDEALTYPE
       AND A3.CDNAME = 'STATUS'
       AND A3.CDTYPE = 'FA'
       AND GL.STATUS = A3.CDVAL
       AND GL.BUYER = FA.ID(+)
       AND GL.SELLER = FA1.ID(+)
       AND GL.FUNDCODEID = F.CODEID
       AND CA.CAMASTID = GL.CAREFID
       ) G, 
       (SELECT CA.AUTOID, F.CODEID, CA.CAMASTID, CA.TYPEOFACC FROM CBFACONFIRMCA CA, FUND F
       WHERE CA.CUSTODYCD = F.CUSTODYCD
             AND CA.CATYPECF = 'T'
             AND CA.STATUS = 'P') T
WHERE G.CAREFID = T.CAMASTID(+)
      AND G.FUNDCODEID = T.CODEID(+)
      AND G.DORC = T.TYPEOFACC(+)
