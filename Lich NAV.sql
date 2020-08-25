
------

SELECT AUTOID,TLTXCD, txnum,txdate, MSGAMT AMOUNT,TXDESC,F.SYMBOL
FROM vw_tllog_all A ,FUND F
WHERE A.CCYUSAGE=F.CODEID AND deltd ='N'
AND TXSTATUS ='1';

---SEARCH CMD_NEW_FA_9390
SELECT tl.AUTOID,tl.TLTXCD, tl.txnum,tl.txdate, tl.MSGAMT AMOUNT,tl.TXDESC,F.SYMBOL, dt.NAVDATE,
       A1.EN_CDCONTENT TXSTATUS, A2.EN_CDCONTENT GLSTATUS
FROM (select DISTINCT TLTXCD, substr(ACCTNO,1,6) CODEID, TXNUM, TXDATE, DELTD from VW_GLTRAN_ALL) t, vw_tllog_all tl, fund f,
     (SELECT MAX(SBDATE) NAVDATE, CLDRTYPE  FROM sbcldr, (SELECT TO_DATE(VARVALUE,'DD/MM/YYYY') CURRDATE  FROM SYSVAR
             WHERE GRNAME = 'SYSTEM' AND VARNAME ='CURRDATE') t 
      WHERE SBDATE <t.CURRDATE AND (HOLIDAY = 'Y' OR SBEOM = 'Y') GROUP BY CLDRTYPE) dt, ALLCODE A1, ALLCODE A2
      where tl.TXNUM = t.TXNUM
      and tl.TXDATE = t.TXDATE
      and f.codeid = t.CODEID
      AND tl.deltd ='N'
      AND t.TXDATE >= dt.NAVDATE
      AND t.CODEID = dt.CLDRTYPE
      AND A1.CDTYPE = 'SY'
      AND A1.CDNAME = 'TXSTATUS'
      AND A1.CDVAL = tl.TXSTATUS
      AND A2.CDTYPE = 'FA'
      AND A2.CDNAME = 'GLTRANDELTD'
      AND A2.CDVAL = t.DELTD
ORDER BY SYMBOL, TXDATE DESC
;

select * from vw_tllog_all where txnum = '000001009600'; FSSVF2

select * from tllog where txnum = '000001009600';

SELECT SBDATE NAVDATE, tl.CODEID, tl.TXNUM, tl.TXDATE from sbcldr cl,
       (select DISTINCT TLTXCD, substr(ACCTNO,1,6) CODEID, TXNUM, TXDATE from VW_GLTRAN_ALL) tl
where cl.HOLIDAY = 'Y' AND cl.SBDATE < getcurrdate
      and cl.cldrtype = tl.CODEID


SELECT MAX(SBDATE), CLDRTYPE  from sbcldr WHERE (HOLIDAY = 'Y' OR SBEOM = 'Y') AND SBDATE <getcurrdate
GROUP BY CLDRTYPE


SELECT * from VW_GLTRAN_ALL where txnum = '000001009600'; 
000001009600  

SELECT * from GLTRANA where ;

select getcurrdate from dual;

SELECT MAX(SBDATE), CLDRTYPE  FROM sbcldr,
(SELECT TO_DATE(VARVALUE,'DD/MM/YYYY') CURRDATE  FROM SYSVAR
    WHERE GRNAME = 'SYSTEM' AND VARNAME ='CURRDATE') t 
WHERE SBDATE <t.CURRDATE AND (HOLIDAY = 'Y' OR SBEOM = 'Y') and CLDRTYPE = '000002'
GROUP BY CLDRTYPE

select codeid from fund where symbol = 'VFMVF1';

select * from allcode where cdVAL IN ('Y','N') for update;
select DISTINCT TLTXCD, substr(ACCTNO,1,6) CODEID, TXNUM, TXDATE, DELTD from VW_GLTRAN_ALL WHERE

---

select * from USER_SOURCE WHERE UPPER(TEXT) LIKE '%INSERT INTO GLTRAN%' OR UPPER(TEXT) LIKE '%INSERT INTO GLTRANA%';

---

----
SELECT * FROM GLTRAN;

----
select * from tltx where tltxcd = '9390' for update;
select * from fldmaster where objname = '9390'; 06, 07, 10,30

-------
select * from search where searchcode = 'FA9390' for update

select * from searchfld where searchcode = 'FA9390' for update

-----

 plog.setbeginsection (pkgctx, 'fn_txAftAppUpdate');
    plog.debug (pkgctx, '<<BEGIN OF fn_txAftAppUpdate');
   /***************************************************************************************************
    ** PUT YOUR SPECIFIC AFTER PROCESS HERE. DO NOT COMMIT/ROLLBACK HERE, THE SYSTEM WILL DO IT
    ***************************************************************************************************/
       IF  p_txmsg.updatemode ='A' THEN --Approve

       plog.error (pkgctx, 'txnum'||p_txmsg.txnum);
       plog.error (pkgctx, 'txdate'||TO_CHAR(p_txmsg.txdate,'DD/MM/RRRR'));

       CSPKS_FAPROC.PR_DELETE_GLTRAN(p_txmsg.txfields('06').value, p_txmsg.txfields('07').value);
       CSPKS_FAPROC.PR_DELETE_FASETRAN(p_txmsg.txfields('06').value, p_txmsg.txfields('07').value);
       END IF;


    plog.debug (pkgctx, '<<END OF fn_txAftAppUpdate');
    plog.setendsection (pkgctx, 'fn_txAftAppUpdate');
    RETURN systemnums.C_SUCCESS;
