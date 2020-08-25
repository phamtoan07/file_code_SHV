select * from tltx order by tltxcd desc for update;

select * from cmdmenu where objname = 'FA9426' for update;

select * from search where searchcode = 'FA9426' for update;
select * from searchfld where searchcode = 'FA9426' for update;

select * from fldmaster where objname = '9426' for update;

select * from cbfaoddexchangetx; --FAODDEXCHANGE

----
SELECT C.AUTOID,C.GLOBALID REFKEY,C.TXDATE,C.TXNUM,A1.EN_CDCONTENT TXBORS,
       CASE WHEN C.TXDORC = 'C' THEN 'B' ELSE 'S' END TXBORSCD,
       C.FUNDCODEID,F.SYMBOL FUNDSYMBOL,C.CUSTODYCD,C.BUSDATE TRADEDATE,C.REFSYMBOL,C.DESCRIPTION TXDESC,
       C.TXQTTY*C.PARVALUE,C.TXQTTY,C.FEEAMT,C.TAXAMT,C.STATUS STATUSCD, A2.EN_CDCONTENT STATUS
FROM CBFAODDEXCHANGETX C, FUND F, ALLCODE A1, ALLCODE A2
WHERE C.FUNDCODEID = F.CODEID AND C.DELTD <>'Y'
      AND (CASE WHEN C.TXDORC = 'C' THEN 'B' ELSE 'S' END) = A1.CDVAL 
      AND A1.CDNAME='TXBORS' AND A1.CDTYPE='FA'
      AND A2.CDNAME = 'STATUS' AND A2.CDVAL = C.STATUS AND A2.CDTYPE = 'SA'

