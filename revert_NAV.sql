select nvl(fld.cvalue, fld.nvalue),nvl(fld1.cvalue, fld1.nvalue)  into v_codeid,v_navdate
    from vw_tllog_all tl, vw_tllogfld_all fld, vw_tllogfld_all fld1
    where tl.txdate = fld.txdate and tl.txnum = fld.txnum
    and tl.txdate = fld1.txdate and tl.txnum = fld1.txnum
    and tl.txdate = to_date(p_txdate, 'DD/MM/RRRR') and tl.txnum = p_txnum
    and tl.tltxcd = '9318' and fld.fldcd = '02' and fld1.FLDCD = '04';
    
  SELECT tltxcd  FROM tllog WHERE txdate = TO_DATE('28/12/2020', 'dd/MM/rrrr') AND txnum = '000001000066';


-------------

select ser.autoid, fee.feeonnav,'9223' tltxcd, null txnum, null txdate
                from feeonnavdtl fee, servicecontract ser, faobject fao
                where fee.refsvcontract = ser.autoid and ser.objid = fao.id (+)
                and fee.fundcodeid = '001037' and fee.navdate = TO_DATE('30/11/2020','dd/mm/rrrr') and fee.deltd = 'N'
                union all
                select -1 autoid,0 feeonnav, '9318' tltxcd, tl.TXNUM,tl.TXDATE
                from tllog tl, tllogfld fld, tllogfld fld1
                where tl.txdate = fld.TXDATE and tl.txnum = fld.TXNUM
                and tl.txdate = fld1.TXDATE and tl.txnum = fld1.TXNUM
                and tl.tltxcd = '9318' --and tl.deltd <> 'Y'
                and fld.fldcd = '02' and nvl(fld.cvalue, fld.nvalue) = '001037'
                and fld1.fldcd = '04' and nvl(fld1.cvalue, fld1.nvalue) = '30/11/2020'
                
                
select nvl(fld.cvalue, fld.nvalue),nvl(fld1.cvalue, fld1.nvalue)--  into v_codeid,v_navdate
    from tllog tl, tllogfld fld, tllogfld fld1
    where tl.txdate = fld.txdate and tl.txnum = fld.txnum
    and tl.txdate = fld1.txdate and tl.txnum = fld1.txnum
    and tl.txdate = to_date('28/12/2020', 'DD/MM/RRRR') and tl.txnum = '000001000066'
    and tl.tltxcd = '9318' and fld.fldcd = '02' and fld1.FLDCD = '04';
    
select * from FUND_FASUMMARY where fundcodeid = '001037' and txdate = to_date('30/11/2020', 'DD/MM/RRRR');
