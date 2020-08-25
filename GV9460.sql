select * from cmdmenu where objname = 'FA9460' for update;

select * from 

select * from fldmaster where objname = '9460';

select * from search where searchcode = 'FA9460' for update;

select * from searchfld where searchcode = 'FA9460' for update;

-----

select * from fund where custodycd = 'SHVB000309';

select * from cbfaoddexchangetx;

alter table cbfaoddexchangetx add deltd varchar2(1) default 'N';

alter table cbfaoddexchangetx drop column reftxnum;
alter table cbfaoddexchangetx add reftxnum varchar2(20);

alter table cbfaoddexchangetx add reftxdate date;

SELECT C.AUTOID,REFKEY,REFFUNDSFID,TXDATE,TXNUM,A1.EN_CDCONTENT TXBOR,TXBORS,F.SYMBOL FUNDCODEID,C.CUSTODYCD,TRADEDATE,
REFSYMBOL,TXDESC,TXAMT,TXQTTY,FEEAMT,DELTD,C.STATUS,REFTXDATE,REFTXNUM,BUSDATE,CREATEDBY,INTLASTDT,TRANSDATE,
ISMATURITY,IDOBJECT,COST,PROFITORLOSS,COSTPRICE,CLOSEDPRICE,TRANSTYPE,A2.EN_CDCONTENT TYPETRANS
FROM cb_fasfnoticetx C, FUND F, allcode a1, allcode a2
WHERE C.FUNDCODEID = F.CODEID AND C.STATUS ='P'
AND C.TXBORS = A1.CDVAL AND A1.CDNAME='TXBORS' AND A1.CDTYPE='FA'
AND C.TRANSTYPE = A2.CDVAL AND A2.CDNAME='SUBTXBORS' AND A2.CDTYPE='FA' 

----
SELECT C.AUTOID,C.GLOBALID REFKEY,C.TXDATE,C.TXNUM,A1.EN_CDCONTENT TXBORS,C.TXDORC TXDORCCD,
       F.SYMBOL FUNDCODEID,C.CUSTODYCD,C.BUSDATE TRADEDATE,C.REFSYMBOL,C.DESCRIPTION,
       C.TXQTTY*C.PARVALUE,C.TXQTTY,C.FEEAMT,C.TAXAMT,C.STATUS
FROM cbfaoddexchangetx C, FUND F, allcode a1
WHERE C.FUNDCODEID = F.CODEID AND C.STATUS ='P' AND C.DELTD <>'Y'
      AND (CASE WHEN C.TXDORC = 'C' THEN 'B' ELSE 'S' END) = A1.CDVAL 
      AND A1.CDNAME='TXBORS' AND A1.CDTYPE='FA'
--AND C.TRANSTYPE = A2.CDVAL AND A2.CDNAME='SUBTXBORS' AND A2.CDTYPE='FA' 
