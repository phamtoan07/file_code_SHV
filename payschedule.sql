select LISTAGG(t.autoid,'$') WITHIN group (order by t.fundcodeid,t.txtype,t.fundaccount,t.beneficiaryaccount,d.symbol) AS arrautoid,
           SUM(t.txamt) txamt,t.TXTYPE,d.symbol,t.fundaccount,t.beneficiaryaccount,MAX(t.beneficiaryname) beneficiaryname,
           t.fundcodeid,MAX(t.beneficiarybank) beneficiarybank,t.mbcode
           from FASTATEMENT t, fund d, payschedule p
         WHERE d.codeid = t.fundcodeid AND T.STATUS ='P'
            AND t.settlementdate <= getcurrdate
            AND  t.fundcodeid = p.codeid(+)
            AND t.txtype = p.paytype(+)
            and  p.paytype <> 'SEVFEE'
            AND NVL(p.isauto,'Y') ='Y'
         GROUP BY t.fundcodeid,t.txtype,t.mbcode,t.fundaccount,t.beneficiaryaccount,d.symbol
UNION ALL 000594
select LISTAGG(t.autoid,'$') WITHIN group (order by t.fundcodeid,t.txtype,t.fundaccount,t.beneficiaryaccount,d.symbol,s.typecontract) AS arrautoid,
           SUM(t.txamt) txamt,t.TXTYPE,d.symbol,t.fundaccount,t.beneficiaryaccount,MAX(t.beneficiaryname) beneficiaryname,
           t.fundcodeid,MAX(t.beneficiarybank) beneficiarybank,t.mbcode, s.typecontract
           from FASTATEMENT t, fund d, payschedule p, servicecontract s
         WHERE d.codeid = t.fundcodeid AND T.STATUS ='P'
            AND t.settlementdate <= getcurrdate
            AND  t.fundcodeid = p.codeid(+)
            AND t.txtype = p.paytype(+)
            and t.txtype = 'SEVFEE'
            AND NVL(p.isauto,'Y') ='Y'
            and s.fundcode = t.fundcodeid
            and t.tradingid = s.autoid
         GROUP BY t.fundcodeid,t.txtype,t.mbcode,t.fundaccount,t.beneficiaryaccount,d.symbol,s.typecontract
         
-----
select * from user_source where upper(text) like '%INSERT INTO FASTATEMENT%';

select * from FASTATEMENT where txtype = 'SEVFEE' and status = 'P';

select * from servicecontract where fundcode= '000594';




