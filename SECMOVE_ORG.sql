select * from tltx where tltxcd = '9393';

-----

select * from cmdmenu where en_cmdname LIKE '%market price%';

select * from search where searchcode = 'SBREFMRKDATA' for update;

select * from search where searchcode = 'SECMOVEMENT' for update;

select * from search where searchcode = 'FACAMAST';

select * from searchfld where searchcode = 'SBREFMRKDATA' for update;

select * from searchfld where searchcode = 'SECMOVEMENT' for update;

----

select * from cmdmenu where prid = '928000' for update;

select * from fund where codeid = '000356';

select * from cmdmenu where prid = '927010';

------SEARCHCMD

select * from fasfnoticetx ;
select * from GLMASTEXT where ACEXTTYPE = 'RP';
select * from allcode where cdname = 'TXBORS';

SELECT FA.FUNDCODEID, F.SYMBOL, FA.REFSYMBOL, FA.BUSDATE, FA.TXDATE, A1.EN_CDCONTENT TYPE,
       CASE WHEN FA.TXBORS = 'S' THEN FA.TXQTTY
            ELSE 0
       END DEBIT,
       CASE WHEN FA.TXBORS = 'B' THEN FA.TXQTTY
            ELSE 0
       END CREDIT,
       TL.TLTXCD, TL.TXDESC
FROM  FASFNOTICETX FA, VW_TLLOG_ALL TL, ALLCODE A1, FUND F
WHERE TL.TXNUM = FA.TXNUM AND TL.TXDATE = FA.TXDATE
      AND FA.STATUS = 'A'
      AND A1.CDTYPE = 'SY'
      AND A1.CDNAME = 'TXBORS'
      AND A1.CDVAL = FA.TXBORS
      AND F.CODEID = FA.FUNDCODEID
UNION ALL
SELECT GL.FUNDCODEID, F.SYMBOL, GL.REFSYMBOL,GL.BUSDATE, GL.TXDATE,
       CASE WHEN GL.ACEXTTYPE = 'SA' THEN 'CA'
            ELSE 'REPO'
       END TYPE,
       CASE WHEN SE.TXTYPE = 'D' THEN SE.NAMT
            ELSE 0
       END DEBIT,
       CASE WHEN SE.TXTYPE = 'C' THEN SE.NAMT
            ELSE 0
       END CREDIT, TL.TLTXCD, TL.TXDESC
FROM GLMASTEXT GL,VW_TLLOG_ALL TL, FUND F, VW_FASETRAN_GEN SE
WHERE TL.TXNUM = GL.TXNUM AND TL.TXDATE = GL.TXDATE
      AND GL.STATUS = 'A' AND GL.ACEXTTYPE IN ('RP','SA')
      AND F.CODEID = GL.FUNDCODEID
      AND SE.TXNUM = GL.TXNUM
      AND SE.TXDATE =  GL.TXDATE
---------


