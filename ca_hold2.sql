select * from etfwsap where autoid = '12337';
select * from CASCHD_LIST_FA;
select * from etfwsap where orderid = '25092400000004';
select max(autoid) from etfwsap where holdfs > 0;
select * from vw_tllog_all where reftxnum = '0001000010' and txdate = '23-SEP-2025';
select * from fldmaster where objname = '3322'; --03
select v.* from vw_tllogfld_all v,  (select txnum,txdate from vw_tllog_all where reftxnum = '0001000010' and txdate = '23-SEP-2025' and tltxcd = '3322') t  
where v.txnum = t.txnum and v.txdate = v.txdate and fldcd = '03';
select * from odmast where orderid = '25092400000004';

select * from user_source where upper(text) like '%UPDATE ETFWSAP%'; ODMAST.CLEARDATE

select * from etfwsap;
-- 8894 status = 'P'

select * from CASCHD_LIST_FA where afacctno = '0001000336' and codeid = '000241';

select e.custodycd,e.afacctno,e.codeid, sum(holdfs) nohold,ca.camastid 
from etfwsap e, camast ca,
     (select orderid,cleardate,codeid from odmast union select orderid,cleardate,codeid from odmasthist) od
where e.holdfs >0 and od.orderid = e.orderid and ca.reportdate >= od.cleardate
      and ca.codeid = e.codeid and e.deltd <>'Y' and ca.status = 'N'
      and camastid ='0001000241000221'
      --and od.codeid = e.codeid
      --and od.orderid = '25092400000004'
group by e.custodycd,e.afacctno, e.codeid,ca.camastid
 ; --16/06/2017 0001000241000221
 
 
 select e.custodycd,e.afacctno,e.codeid, sum(holdfs) nohold,ca.camastid 
                                      from etfwsap e, camast ca,
                                           (select orderid,cleardate,codeid from odmast union select orderid,cleardate,codeid from odmasthist) od
                                  where e.holdfs >0 and od.orderid = e.orderid and ca.reportdate >= od.cleardate
                                                  and ca.codeid = e.codeid and e.deltd <>'Y' and ca.status in ('A','V','M')
                                                  --and camastid ='0001000241000221'
                                                  --and od.codeid = e.codeid
                                                  --and od.orderid = '25092400000004'
                                  group by e.custodycd,e.afacctno, e.codeid,ca.camastid

select * from camast where camastid = '0001000241000221' for update;
                          
-----------------------------------------
                          SELECT '' autoid,CAS.AUTOID  AUTOID,CA.CODEID,CA.CATYPE,CA.REPORTDATE,CA.DUEDATE,CA.ACTIONDATE,CA.EXPRICE,CA.PRICE,CA.EXRATE,CA.RIGHTOFFRATE,
                                CA.DEVIDENTRATE,CA.DEVIDENTSHARES,CA.SPLITRATE,CA.INTERESTRATE,CA.INTERESTPERIOD
                                , case when SB.Tradeplace = '003' then 'T' else 'P' END STATUS,CA.CAMASTID,CA.DESCRIPTION,CA.EXCODEID,
                                CA.PSTATUS,CA.RATE,CA.DELTD,CA.TRFLIMIT,CA.PARVALUE,
                                CA.ROUNDTYPE,CA.OPTSYMBOL,CA.OPTCODEID,CA.TRADEDATE,CA.LASTDATE,CA.RETAILSHARE,CA.RETAILDATE,CA.FRDATERETAIL,CA.TODATERETAIL,
                                CA.FRTRADEPLACE,CA.TOTRADEPLACE,CA.TRANSFERTIMES,CA.FRDATETRANSFER,CA.TODATETRANSFER,CA.TASKCD,CA.TOCODEID,CA.LAST_CHANGE,CA.PITRATE,
                                CA.PITRATEMETHOD,CA.ISWFT,CA.PRICEACCOUNTING,CA.CAQTTY,CA.BEGINDATE,CA.PURPOSEDESC,CA.DEVIDENTVALUE,CA.ADVDESC,CA.TYPERATE,CA.CIROUNDTYPE,CA.PITRATESE,CA.INACTIONDATE,
                                CA.MAKERID,CA.APPRVID,CA.EXERATE,CA.CANCELDATE,CA.RECEIVEDATE,CA.CANCELSTATUS,CA.ISINCODE,CA.TRFFEEAMT,CA.CANCELSHARE,CA.EXFROMDATE,
                                CA.EXTODATE,CA.EXCANCELDATE,CA.EXRECVDATE,CA.DOMESTICCD,CA.VSDSTATUS,CA.EXADDRESS,CA.VSDID,CA.PARNAME,CA.CHANGECONTENT,CA.CONVERTDATE,
                                CA.MEETINGPLACE,CA.STOPTRANDATE,CA.INSDEADLINE,CA.DEBITDATE,CA.RIGHTTRANSDL,CA.SUBMISSIONDL,CA.LASTTRADINGD,CA.EFFECDELDATE--,CA.LISTINGORDER
                                ,CASE WHEN CA.CATYPE = '014' THEN CAS.TRADE
                                      ELSE CAS.BALANCE
                                 END,
                                CAS.QTTY,
                                CAS.AMT -  CASE WHEN CF.VAT='Y'  THEN (
                                               CASE WHEN CA.CATYPE IN ('016')  THEN ROUND(CA.PITRATE*CAS.INTAMT/100)
                                                    WHEN CA.CATYPE = '024' THEN LEAST(CAS.AMT,CAS.BALANCE*CA.EXPRICE*CA.PITRATE/100/1)
                                                    WHEN CA.CATYPE = '023' THEN ROUND(CA.PITRATE*CAS.INTAMT/100) - CAS.BALANCE*CA.EXPRICE - CAS.INTAMT
                                                    ELSE ROUND(CA.PITRATE*CAS.AMT/100) END)
                                            ELSE 0 END,
                                CF.CUSTODYCD,SB.SYMBOL,tocodeid.symbol,
                                CAS.INTAMT  -  CASE WHEN CF.VAT='Y'  THEN (
                                                    CASE WHEN CA.CATYPE IN ('016')  THEN ROUND(CA.PITRATE*CAS.INTAMT/100)
                                                         WHEN CA.CATYPE IN ('015') THEN ROUND(CA.PITRATE*CAS.AMT/100)
                                                    ELSE 0 END)
                                               ELSE 0 END,
                                'P',null l_exdividend,CAS.PBALANCE,CAS.PQTTY, NVL(hold.nohold,0) nohold
                                FROM CAMAST CA,CASCHD_LIST_FA CAS,AFMAST AF,CFMAST CF, sbsecurities SB,sbsecurities tocodeid,
                                     (select e.custodycd,e.afacctno,e.codeid, sum(holdfs) nohold,ca.camastid 
                                      from etfwsap e, camast ca,
                                           (select orderid,cleardate,codeid from odmast union select orderid,cleardate,codeid from odmasthist) od
                                            where e.holdfs >0 and od.orderid = e.orderid and ca.reportdate >= od.cleardate
                                                  and ca.codeid = e.codeid and e.deltd <>'Y'
                                                  --and camastid ='0001000241000221'
                                                  --and od.codeid = e.codeid
                                                  --and od.orderid = '25092400000004'
                                            group by e.custodycd,e.afacctno, e.codeid,ca.camastid) hold
                                WHERE CA.CAMASTID = CAS.CAMASTID
                                AND CAS.AFACCTNO = AF.ACCTNO
                                AND AF.CUSTID = CF.CUSTID
                                AND CAS.CODEID = SB.CODEID
                                and ca.tocodeid = tocodeid.codeid(+)
                                AND ca.camastid = '0001000241000221'
                                
                                AND hold.codeid(+) = CAS.Codeid
                                and hold.afacctno(+) = cas.afacctno
                                and hold.camastid(+) = CAS.CAMASTID
                                and hold.custodycd (+)  = cf.custodycd
                                and hold.camastid (+)= CA.CAMASTID

                                AND CAS.DELTD ='N'
                                AND ((CF.FUNDCODE IS NOT NULL AND LENGTH(CF.FUNDCODE) >0 ) OR CF.SUPEBANK = 'Y')
                                AND SB.TRADEPLACE <> '003';
