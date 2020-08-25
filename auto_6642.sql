select * from v_appmap_by_tltxcd where tltxcd = '6642';

select * from v_appchk_by_tltxcd where tltxcd = '6642';


select * from tltx where tltxcd = '6642';

select * from fldmaster where objname = '6642';

select * from appmap where tltxcd = '6642';

select * from appchk where tltxcd = '6642';


select * from apptx where txcd = '0019';

select * from apprules where rulecd = '02';

-------------

SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION 
FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD='SHVB000095' ORDER BY VALUE --0001000264

select * from ddmast where custodycd = 'SHVB000095';

------------
select * from search where searchcode = 'DDMAST_ALL'; CUSTODYCD_CF
select * from search where searchcode = 'CUSTODYCD_CF';
select CF.CUSTODYCD, CF.FULLNAME, DD.AFACCTNO, DD.ACCTNO, DD.CCYCD, DD.REFCASAACCT,DD.BALANCE, DD.HOLDBALANCE,
        (DD.BALANCE + DD.HOLDBALANCE+Dd.PENDINGHOLD+Dd.pendingunhold)TOTAL,
        DD.bankbalance BANKAVABALANCE,NVL(DD.bankbalance + DD.bankholdbalance,0) BANKBALANCE,
        case when dd.ccycd = 'VND' then 1 else nvl(ex.rate,0) end TTM_RATE
from DDMAST DD,AFMAST AF, CFMAST CF, (select currency, max(vnd) rate from exchangerate where rtype = 'TTM' and itype = 'SHV' group by currency) ex
where CF.custid = AF.CUSTID AND AF.ACCTNO = DD.AFACCTNO
    and dd.ccycd = ex.currency(+)


SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_AFMAST_DDACCOUNT_ACTIVE 
WHERE FILTERCD=substr('0001000001',1,10) ORDER BY FILTERCD

select * from VW_AFMAST_DDACCOUNT_ACTIVE where FILTERCD=substr('0001000001',1,10) ;

select * from ddmast where acctno = '0001000001';

------------

select * from user_soủce

select * from allcode where cdval = 'TRFCICAMT';

select * from user_source where upper(text) like '%TRFCICAMT%';

select * from facb_statementgroup;

--------
SELECT *
FROM ALLCODE A WHERE A.CDTYPE='RM' AND A.CDNAME='RMTYPE'  ORDER BY A.CDVAL
