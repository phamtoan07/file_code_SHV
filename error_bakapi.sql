select * from log_notify_cbfa  
where objname  ='CBFAODDEXCHANGE' and globalid =  'CB.20230403.0001000148' order by autoid desc ;

update log_notify_cbfa set status = 'P' where globalid =  'CB.20230403.0001000148';

----

select v.CUSTODYCD,v.ACCTNO,v.SYMBOL,SUM(NAMT) TRADE,v.TXNUM,v.TXDATE
                       from vw_setran_gen v,cfmast c
                       where tltxcd = '2245' and v.FIELD in('TRADE','BLOCKED','EMKQTTY') and txtype = 'C'
                             and c.custodycd = v.CUSTODYCD and c.supebank = 'Y'
                             and v.txnum = '0001000148' and v.txdate = To_DATE('03/04/2023','DD/MM/RRRR')
                       group by v.CUSTODYCD,v.ACCTNO,v.SYMBOL,v.TXNUM,v.TXDATE
                       
 select * from vw_setran_gen v where v.txnum = '0001000127' and v.txdate = To_DATE('03/04/2023','DD/MM/RRRR')  order by autoid desc;              
 
  select * from vw_setran_gen v  order by autoid desc;  
  ''
  select * from log_notify_cbfa where globalid like 'CB.20230405.0001000032' ;    
  delete from log_notify_cbfa where globalid = 'CB.20230405.0001000032' and objname = 'CBFABANKPAYMENT_RESULT';
  select * from crbtxreq where reqtxnum = 'CB.20230405.0001000032';       
  
  select * from cbfa_bankpayment where globalid = 'CB.20230405.0001000032';
  update cbfa_bankpayment set err_code = null, bankstatus = 'P' where globalid = 'CB.20230405.0001000032';
  
  select * from syn_facb_log_notify where globalid = 'CB.20230405.0001000032';
  
  select * from syn_facb_log_notify where objname = 'CBFABANKPAYMENT_APPRSB' and status = 'P';
  A.CABUYR
  update syn_facb_log_notify set status = 'P' where globalid = 'CB.20230405.0001000032';
  
  select * from tlog where luser = user order by id desc;
  
  select * from FACB_STATEMENTGROUP;
  
  select * from tlog where luser = user order by id desc; --39431557
  
  block.HOSTSHVTEST.PKS_NOTIFY_CBFA.PROCESS_MSG_FROM_FA.HOSTSHVTEST.PCK_BANKAPI.BANK_TRANFER_OUT_FA
