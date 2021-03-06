﻿select * from search where tltxcd = '9249';
select * from search where searchcode = 'FA0024';

select * from search where searchcode = 'FA0087' for update;

select * from searchfld where searchcode = 'FA0087' for update;

select * from searchtxmapfld where tltxcd = '9249' for update;

select * from fldval where objname = '9249' for update;

/
DELETE FROM search WHERE searchcode ='FA0087';
INSERT INTO search (SEARCHCODE,SEARCHTITLE,EN_SEARCHTITLE,SEARCHCMDSQL,OBJNAME,FRMNAME,ORDERBYCMDSQL,TLTXCD,CNTRECORD,ROWPERPAGE,AUTOSEARCH,INTERVAL,AUTHCODE,ROWLIMIT,CMDTYPE,CONDDEFFLD,BANKINQ,BANKACCT,ISFLTCODEID,ISFLTMBCODE,ISTRANSVIEW) 
VALUES('FA0087','Xử lý giao dịch Repo trái phiếu','Process the repo trade','SELECT * FROM  (SELECT T.AUTOID, T.REFKEY, T.REFFUNDSFID,
T.TXDATE, T.TXNUM, A.EN_CDCONTENT DESCTXBORS, A1.EN_CDCONTENT DESCSTATUS, T.FUNDCODEID, D.SYMBOL, B.CURRENCYCD,
T.CUSTODYCD, T.REFSYMBOL, T.TXDESC, T.TXAMT, T.TXQTTY, T.FEEAMT, T.TXBORS, T.STATUS, T.TRANSDATE CLEARDATE
FROM FASFNOTICETX T, FUND D, ALLCODE A, INSTRLIST B, ALLCODE A1
WHERE T.FUNDCODEID=D.CODEID AND T.REFSYMBOL=B.SYMBOL
AND T.SUBTXBORS=''R'' AND B.CFICODE IN (''GB'', ''DB'', ''DC'') AND T.STATUS IN (''V'',''A'')
AND A.CDNAME=''TXBORS'' AND A.CDVAL=T.TXBORS AND A.CDTYPE=''FA''
AND A1.CDNAME=''FATANOTICETX'' AND A1.CDVAL=T.STATUS AND A1.CDTYPE=''FA''
AND (CASE WHEN T.TXBORS=''S'' THEN ''9249'' ELSE ''9255'' END) || ''.'' || T.AUTOID 
    NOT IN (select TLTXCD || ''.'' || REFID from FALOGCBTX WHERE TLTXCD=''9249'' OR TLTXCD=''9255'')
ORDER BY AUTOID DESC) WHERE 1=1','FA.FA0087',NULL,'TXDATE DESC','9249/9255',0,-1,'N',30,NULL,'Y','T',NULL,'N',NULL,'N','N','N');
COMMIT;
/

SELECT TRADEDATE, TRANSDATE FROM FASFNOTICETX;

SELECT * FROM FASFNOTICETX WHERE AUTOID = '819';
 
SELECT * FROM DEFERROR WHERE ERRNUM  = '-921336';
