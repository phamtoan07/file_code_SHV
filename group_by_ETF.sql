SELECT H.*, CASE WHEN H.TRADINGACCOUNTCD <> '$$' THEN H.TRADINGACCOUNTCD ELSE '' END TRADINGACCOUNT
FROM
(SELECT MAX(T.CUSTODYCD) CUSTODYCD,MAX(T.TRANSDATE) TRANSDATE, MAX(T.FUNDCODEID) FUNDCODEID, MAX(T.TRADINGID) TRADINGID,
       MAX(T.TYPE) TYPE, MAX(T.AP) AP, MAX(T.NAV) NAV, SUM(T.QUANTITY) QUANTITY, SUM(T.VALUE) VALUE, SUM(NVL(T.DIFFERENCE,0)) DIFFERENCE,
       MAX(T.TRADINGFEE) TRADINGFEE, MAX(T.TAX) TAX, MAX(T.SERCURITIES) SERCURITIES, SUM(NVL(T.SECQTTY,0)) SECQTTY,
       MAX(T.SECPRICE) SECPRICE, SUM(NVL(T.SECVALUE,0)) SECVALUE, MAX(NVL(T.ERRMSG,'')) ERRMSG, MAX(T.MBID) MBID,
       MAX(T.IMPTLID) IMPTLID, MAX(T.FILEID) FILEID, MAX(T.STATUS) STATUS, MAX(T.CLEARDATE) CLEARDATE,
       SUM(NVL(T.AP_SERCURITIES,0)) AP_SERCURITIES, MAX(T.TLIDOVR) TLIDOVR, MAX(T.OVRSTATUS) OVRSTATUS, MAX(T.VIA) VIA,
       SUM(NVL(T.HOLDFORSELL,0)) HOLDFORSELL, MAX(T.TRADINGACCOUNT) TRADINGACCOUNTCD
FROM
(
SELECT C.CUSTODYCD,C.TRANSDATE,C.FUNDCODEID,C.TRADINGID,C.TYPE,C.AP,C.NAV,C.QUANTITY,C.VALUE,C.DIFFERENCE,
       C.TRADINGFEE,C.TAX,C.SERCURITIES,C.SECQTTY,C.SECPRICE,C.SECVALUE,C.ERRMSG,C.MBID,
       C.IMPTLID,C.FILEID,C.STATUS,C.CLEARDATE,C.AP_SERCURITIES,C.TLIDOVR,C.OVRSTATUS,C.VIA,C.HOLDFORSELL,
       CASE WHEN C.TRADINGACCOUNT  IS NULL OR LENGTH( C.TRADINGACCOUNT ) = 0 THEN '$$' ELSE  C.TRADINGACCOUNT END TRADINGACCOUNT
FROM ETFRESULT_TEMPHIST C WHERE C.FILEID = '22467') T
GROUP BY T.FILEID,T.FUNDCODEID,T.TRADINGID,T.AP,T.TYPE,T.SERCURITIES,T.TRADINGACCOUNT) H;

------
                                SELECT
                                       CUSTODYCD,
                                       TRANSDATE,
                                       FUNDCODEID,
                                       TRADINGID,
                                       TYPE,
                                       AP,
                                       MAX(NAV) NAV,
                                       SUM(QUANTITY) QUANTITY,
                                       SUM(VALUE) VALUE,
                                       MAX(DIFFERENCE) DIFFERENCE,
                                       MAX(TRADINGFEE) TRADINGFEE,
                                       MAX(TAX) TAX,
                                       MAX(CLEARDATE) CLEARDATE,
                                       LISTAGG(DETAIL,'#') WITHIN GROUP(ORDER BY TT.FILEID,CUSTODYCD,FUNDCODEID,TRADINGID,TYPE,AP,TRANSDATE,CLEARDATE) AS DETAIL,
                                       MAX(ACCTNO) ACCTNO,
                                      -- BROKER,
                                       MAX(FULLNAME) FULLNAME
                                FROM (
                                         SELECT
                                               MST.CUSTODYCD,
                                               MST.TRANSDATE,
                                               MST.FUNDCODEID,
                                               MST.TRADINGID,
                                               MST.TYPE,
                                               MST.AP,
                                               MST.NAV,
                                               MST.QUANTITY,
                                               MST.VALUE,
                                               MST.DIFFERENCE,
                                               MST.TRADINGFEE,
                                               MST.TAX,
                                               MST.FILEID,
                                               MST.CLEARDATE,
                                               SB.CODEID || '|' || MST.SECQTTY|| '|' || MST.AP_SERCURITIES|| '|' || MST.HOLDFORSELL || '|' || MST.SECPRICE|| '|' ||MST.SECVALUE|| '|' ||TRADINGACCOUNT  DETAIL,
                                               AF.ACCTNO,
                                              -- CU.value AS BROKER,
                                               CF.FULLNAME
FROM CFMAST CF, AFMAST AF, SBSECURITIES SB,
(
SELECT * FROM 
(SELECT H.*, CASE WHEN H.TRADINGACCOUNTCD <> '$$' THEN H.TRADINGACCOUNTCD ELSE '' END TRADINGACCOUNT
FROM
(SELECT MAX(T.CUSTODYCD) CUSTODYCD,MAX(T.TRANSDATE) TRANSDATE, MAX(T.FUNDCODEID) FUNDCODEID, MAX(T.TRADINGID) TRADINGID,
       MAX(T.TYPE) TYPE, MAX(T.AP) AP, MAX(T.NAV) NAV, SUM(T.QUANTITY) QUANTITY, SUM(T.VALUE) VALUE, SUM(NVL(T.DIFFERENCE,0)) DIFFERENCE,
       MAX(T.TRADINGFEE) TRADINGFEE, MAX(T.TAX) TAX, MAX(T.SERCURITIES) SERCURITIES, SUM(NVL(T.SECQTTY,0)) SECQTTY,
       MAX(T.SECPRICE) SECPRICE, SUM(NVL(T.SECVALUE,0)) SECVALUE, MAX(NVL(T.ERRMSG,'')) ERRMSG, MAX(T.MBID) MBID,
       MAX(T.IMPTLID) IMPTLID, MAX(T.FILEID) FILEID, MAX(T.STATUS) STATUS, MAX(T.CLEARDATE) CLEARDATE,
       SUM(NVL(T.AP_SERCURITIES,0)) AP_SERCURITIES, MAX(T.TLIDOVR) TLIDOVR, MAX(T.OVRSTATUS) OVRSTATUS, MAX(T.VIA) VIA,
       SUM(NVL(T.HOLDFORSELL,0)) HOLDFORSELL, MAX(T.TRADINGACCOUNT) TRADINGACCOUNTCD
FROM
(
SELECT C.CUSTODYCD,C.TRANSDATE,C.FUNDCODEID,C.TRADINGID,C.TYPE,C.AP,C.NAV,C.QUANTITY,C.VALUE,C.DIFFERENCE,
       C.TRADINGFEE,C.TAX,C.SERCURITIES,C.SECQTTY,C.SECPRICE,C.SECVALUE,C.ERRMSG,C.MBID,
       C.IMPTLID,C.FILEID,C.STATUS,C.CLEARDATE,C.AP_SERCURITIES,C.TLIDOVR,C.OVRSTATUS,C.VIA,C.HOLDFORSELL,
       CASE WHEN C.TRADINGACCOUNT  IS NULL OR LENGTH( C.TRADINGACCOUNT ) = 0 THEN '$$' ELSE  C.TRADINGACCOUNT END TRADINGACCOUNT
FROM ETFRESULT_TEMPHIST C WHERE C.FILEID = '22467') T
GROUP BY T.FILEID,T.FUNDCODEID,T.TRADINGID,T.AP,T.TYPE,T.SERCURITIES,T.TRADINGACCOUNT) H) 
) MST
WHERE  MST.FILEID = '22467'  AND MST.CUSTODYCD = CF.CUSTODYCD AND CF.CUSTID = AF.CUSTID  AND MST.SERCURITIES=SB.SYMBOL
) TT
GROUP BY
                                          TT.FILEID,
                                          TT.CUSTODYCD,
                                          
                                          TT.FUNDCODEID,
                                          TT.TRADINGID,
                                          TT.TYPE,
                                          TT.AP,
                                          TT.TRANSDATE,
                                          TT.CLEARDATE,
                                          
                                        /*  TT.NAV,
                                          TT.QUANTITY,
                                          TT.VALUE,
                                          TT.DIFFERENCE,
                                          TT.TRADINGFEE,
                                          TT.TAX,*/ 
                                          TT.ACCTNO,
                                          TT.FULLNAME                  
-----------------
000065|4000|0|0|23000|92000000|#
000241|25000|0|0|110000|2750000000|

000065|6000|0|0|23000|138000000|#
000241|13000|3000|0|100000|1600000000|086C000003#
000241|8000|1000|0|100000|900000000|086C000001
