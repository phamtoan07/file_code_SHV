select t.*, tx.en_txdesc txdesc, f.symbol fundcode,
       ca.codeid refsymbol, ca.exdividend,
       case where ca.catype in('014') 
       a1.en_cdcontent catype
from tltx tx, fund f, facamast ca, allcode a1,
  (select t.tltxcd,
       FN_GET_TLLOGFLD_VALUE(t.txnum, t.txdate, '02', 'C') fundcodeid,
       FN_GET_TLLOGFLD_VALUE(t.txnum, t.txdate, '03', 'C') camastid,
       FN_GET_TLLOGFLD_VALUE(t.txnum, t.txdate, '18', 'N') balance,
       FN_GET_TLLOGFLD_VALUE(t.txnum, t.txdate, '10', 'N')-FN_GET_TLLOGFLD_VALUE(t.txnum, t.txdate, '23', 'N') amt,
       FN_GET_TLLOGFLD_VALUE(t.txnum, t.txdate, '11', 'N') qtty
       from vw_tllog_all t
   where t.tltxcd IN ('9378')
        --and t.BUSDATE >= L_FROMDATE
        --and t.BUSDATE <= L_TODATE
        ) t
WHERE tx.tltxcd = t.tltxcd
      and t.fundcodeid = f.codeid
      and ca.camastid = t.camastid
      and a1.cdname = 'CATYPE' and a1.cdtype = 'CA' 
      and a1.cdval = ca.catype
	  --and t.fundcodeid = L_FUNDCODEID
;

FN_GET_TLLOGFLD_VALUE

select * from tltx where tltxcd = '9383';
select * from fldmaster where objname in ('9383');
select * from fldval where objname in ('9383');
select * from fapostmap where tltxcd = '9383';
-- 
