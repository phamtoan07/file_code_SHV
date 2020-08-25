SELECT T.REFSYMBOL,
  FN_GET_EXCHANGERATE_BY_CODEID(T.FUNDCODEID,NVL(T.CURRENCY,'VND')) EXCHANGERATE, 'A' CONTRSTS,
  (CASE WHEN T.STATUS='P' THEN 'APRV'
  WHEN T.STATUS='V' AND T.TXDEALTYPE='B' AND T.FXAMT-T.FXCRAMT>0 THEN 'CASH'
  WHEN T.STATUS='V' AND T.TXDEALTYPE='B' AND T.FXAMT-T.FXCRAMT=0 THEN 'SECU'
  WHEN T.STATUS='V' AND T.TXDEALTYPE='S' AND T.FXAMT=0 THEN 'CASH'
  WHEN T.STATUS='V' AND T.TXDEALTYPE='S' AND T.FXAMT>0 AND T.FXAMT-T.FXCRAMT=0 THEN 'SECU'
    ELSE 'NONE' END) TXTYPECD,
  (CASE WHEN T.TXDEALTYPE='B' THEN 'C' ELSE 'D' END) CBTYPE,
    T.TXDATE, B.CFICODE, B.FULLNAME_EN ISSUERNAME, D.SYMBOL FUND,
  (CASE WHEN T.TXDEALTYPE='B' THEN T.SELLER ELSE T.BUYER END) COUNTERPARTY,
    T.CUSTODYCD, T.BALANCE, T.FXCRAMT PAIDAMT, T.FXAMT TXAMT, T.FXAMT-T.FXCRAMT SETTLEAMT, T.QTTY TXQTTY, T.FEE FEEAMT, T.STATUS,
  (CASE WHEN T.TXDEALTYPE='B' THEN 0 ELSE ROUND(NVL(FASE.COSTPRICE, 0), 2) END) TPRICE,
    (CASE WHEN T.TXDEALTYPE='B' THEN T.BALANCE ELSE NVL(FASE.COSTPRICE, 0) * T.QTTY END) TAMT,
  (CASE WHEN T.TXDEALTYPE='B' THEN 0
  ELSE (CASE WHEN NVL(FASE.COSTPRICE, 0)*T.QTTY > T.BALANCE THEN NVL(FASE.COSTPRICE, 0)*T.QTTY-T.BALANCE ELSE 0 END) END) LOSSAMT,
  (CASE WHEN T.TXDEALTYPE='B' THEN 0
  ELSE (CASE WHEN NVL(FASE.COSTPRICE, 0)*T.QTTY < T.BALANCE THEN T.BALANCE-NVL(FASE.COSTPRICE, 0)*T.QTTY ELSE 0 END) END) PROFITAMT,
  T.BALANCE CLEANAMT,
  A.CDCONTENT DESCSTATUS, A0.CDCONTENT DESCCFICODE,
    T.AUTOID, T.AUTOID REFAUTOID, T.NOTES TXDESC,
  T.REFSYMBOL REFFUNDSFID, T.TXDEALTYPE BORS, T.FUNDCODEID, T.REFSYMBOL REFKEY,
  T.BUYER BUYINFOR, T.SELLER SELLINFOR,
    T.IDOBJECT OBJFULLNAME, NULL SIDE,A1.CDCONTENT TXDEALTYPE, T.CONTRACTNO, T.FRDATE, NVL(T.CURRENCY,'VND') CURRENCY
FROM GLMASTEXT T, INSTRLIST B, FUND D, ALLCODE A, ALLCODE A0, ALLCODE A1, FASEMAST FASE
WHERE T.REFSYMBOL = B.SYMBOL
AND B.CFICODE IN ('OF') AND B.FUNDCODEID IS NULL AND T.ACEXTTYPE IN ('US','UB')
AND T.FUNDCODEID = FASE.FUNDCODEID(+) AND T.REFSYMBOL = FASE.REFSYMBOL (+)
AND D.CODEID = T.FUNDCODEID
AND (T.STATUS='V' OR T.STATUS='P')
AND A.CDVAL = T.STATUS AND A.CDNAME = 'FATANOTICETX' AND A.CDTYPE='FA'
AND A0.CDVAL = B.CFICODE AND A0.CDNAME = 'CFICODE' AND A0.CDTYPE='SB'
AND A1.CDVAL = T.TXDEALTYPE AND A1.CDNAME='OEFTYPE' AND A1.CDTYPE='FA'
AND (B.BOARD='OTC' OR B.BOARD='VSD')
