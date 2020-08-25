select * from members;

------

SELECT s.REFKEY,s.fundsymbol, s.TXDATE, s.TXNUM, s.BUSDATE, s.TXTYPE, s.mbcode, s.CUSTODYCD,s.TRADEDATE,
                     s.TXDESC, s.TXAMT, s.TXQTTY, s.DELTD, s.STATUS, s.REFTXDATE, s.REFTXNUM, s.NAVAMT,s.tradingid, s.TAX, s.ISCHANGE, s.TXAMTEX, s.TXQTTYEX,
                     s.FEEAMTEX, s.TAXEX, s.FEEDXX, s.FEEFUND, s.FEEAMC, s.DIFFERENCE, s.FEEAMT, s.CLEARDATE,f.codeid,s.strdata
FROM syn_cbfa_fatanoticetx s, fund f
WHERE s.refnotifyid = '76397' and s.fundsymbol = f.symbol;
                
                
-------
select * from fapostmap where tltxcd = '9287';

select * from members m, roles s where s.mbid = m.autoid and s.rolecode = 'AP';

select * from sbfundetf; --000214 

select * from cb_fatanoticetx;
delete from cb_fatanoticetx;

select * from syn_cbfa_fatanoticetx order by autoid desc for update;

select * from syn_cbfa_log_notify where globalid = 'CB.20201208.0001000025';

----
select * from searchfld where searchcode = 'FAETFSUBSOBLI';

---
select * from search where searchcode = 'FA0055' for update;

select * from searchfld where searchcode = 'FA0055' for update;

select * from cmdmenu where prid = '925050' for update;

select * from cmdmenu where cmdid like '925%' for update;

SELECT AUTOID, TXDATE, TXNUM, REFKEY, FUNDSYMBOL,
                BUSDATE, TXTYPE, MBCODE, CUSTODYCD, TXDESC,
                TXAMT, TXQTTY, FEEAMT, NAVAMT, DELTD, STATUS, TRADINGID, TAX, TXAMTEX, CLEARDATE, TRADEDATE from fatanoticetx
                
select * from fldmaster where objname = '9287';

SELECT T.AUTOID,T.REFKEY, T.CUSTODYCD,T.Fundcodeid,T.TXTYPE,T.TRadingid,T.FEEAMT,T.TAX,
       T.NAVAMT,T.TXQTTY, T.TXAMT, T.TXAMTEX,T.MBCODE,T.CLEARDATE, T.TRADEDATE, 
       T.TXDATE, T.TXNUM,T.STRDATA
FROM CB_FATANOTICETX T WHERE T.STATUS = 'P' AND T.DELTD <> 'Y'
       
select * from CB_FATANOTICETX;
