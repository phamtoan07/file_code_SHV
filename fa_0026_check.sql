select * from fund where symbol = 'VFMVFE';

SELECT SUM (decode(FA.BALTYPE,'C',GL.AMT, -GL.AMT)) BGAMT --INTO L_ACCRUAL
    FROM  VW_GLTRAN_ALL GL ,FEEONNAVDTL F,GLMAST M,FADEFACCT FA
    WHERE GL.AMT = ROUND(F.FEEONNAV) AND GL.REFID = F.REFSVCONTRACT AND GL.TLTXCD = '9223'
          AND M.ACCTNO = GL.ACCTNO AND SUBSTR(M.ALIASCD,0,1) = '3' AND FA.ALIAS||'%' LIKE M.ALIASCD||'%'
          AND GL.BKDATE= F.NAVDATE AND GL.DELTD <> 'Y' 
          AND M.FUNDCODEID = '000003' AND F.NAVDATE = to_date('15/10/2025','dd/mm/rrrr') AND F.DELTD = 'N';
          
select * from fapostmap where tltxcd = '9223';

select * from fanavtemp where fundcodeid = '000003' and NAVDATE = to_date('15/10/2025','dd/mm/rrrr');

select * from glnavdtl where fundcodeid = '000003' and NAVDATE = to_date('15/10/2025','dd/mm/rrrr'); --1613136564

select 1300200000 + 200000000 + 103125000 + 9811564 from dual; --1613136564
select 1300200000 + 200000000 + 103125000 + 10812072 from dual;--1614137072

select 1614137072 - 1613136564 from dual; -- 1000508

select * from vw_check_glmast_gltran;
select * from vw_check_gltran_glmasthist;

select abs(nvl(fn_nav_getcreditbalance('000003',to_date('15/10/2025','dd/mm/rrrr'),'3'),0)) from dual; --1511012072
select abs(nvl(fn_nav_getcreditbalance('000003',to_date('15/10/2025','dd/mm/rrrr'),'13'),0)) from dual;
select abs(nvl(fn_nav_getcreditbalance('000003',to_date('15/10/2025','dd/mm/rrrr'),'17'),0)) from dual; --103125000

select aliascd,case when balance > 0 then balance else 0 end balance --into v_return
from (
select sum (nvl(balance,0)) balance,SUBSTR(aliascd,1,3) aliascd,fundcodeid 
from glmasthist WHERE  txdate = to_date('15/10/2025','dd/mm/rrrr') group by SUBSTR(aliascd,1,3),fundcodeid)
where fundcodeid = '000003' and aliascd like '17%';

--==HIST
--1	311	200000000
--2	331	1300200000
3	335	10812072
--4 171	103125000

--=== temp
--1 311	200000000
--2 331	1300200000
4	335 9811564
--4 171	103125000

select * from glmasthist where aliascd like '335%' and txdate = to_date('15/10/2025','dd/mm/rrrr') and fundcodeid = '000003';

1510011564
select 200000000 + 1300200000 + 10812072 - 1000508 from dual;
select 1613136564 + 1000508 from dual;

select sum (bgamt) from
       (SELECT TO_NUMBER(SUBSTR(ALIASCD,0,1)) STT,
               CASE WHEN SUBSTR(ALIASCD,0,1) IN ('1','2') THEN 'ASSET' ELSE 'LIABILITIES' END ACTYPE,
               SUBSTR(ALIASCD,0,3) TKTONG, ALIASCD,decode(FA.BALTYPE,'C',BGAMT, -BGAMT) BGAMT, FA.FULLNAME_EN
        FROM (SELECT ALIASCD, ROUND(SUM(BGAMT),0) BGAMT FROM
             (SELECT GL.ALIASCD, (CASE WHEN SUBSTR(GL.ALIASCD,0,1) IN ('1','2') THEN (GL.BALANCE  - NVL(GT.AMT,0))
                                       ELSE (GL.BALANCE - NVL(GT.AMT,0) - NVL(GT1.AMT,0)) END )BGAMT
             FROM GLMAST GL,(SELECT ACCTNO, SUM(DECODE(DORC,'C', GT.AMT,'D',-GT.AMT )) AMT
                             FROM VW_GLTRAN_ALL GT
                             WHERE GT.BKDATE > to_date('15/10/2025','dd/mm/rrrr') AND GT.DELTD <> 'Y' GROUP BY ACCTNO ) GT,
                            (SELECT MAX(GL.ACCTNO) ACCTNO, SUM(GL.AMT) AMT FROM  VW_GLTRAN_ALL GL ,FEEONNAVDTL F,GLMAST M
                             WHERE GL.AMT = ROUND(F.FEEONNAV) AND GL.REFID = F.REFSVCONTRACT AND GL.TLTXCD = '9223'
                               AND M.ACCTNO = GL.ACCTNO AND SUBSTR(M.ALIASCD,0,1) = '3' AND GL.DELTD <> 'Y'
                               AND GL.BKDATE= F.NAVDATE AND M.FUNDCODEID = '000003' AND F.NAVDATE = to_date('15/10/2025','dd/mm/rrrr') AND F.DELTD = 'N'
                             GROUP BY GL.ACCTNO) GT1
              WHERE GL.ACCTNO = GT.ACCTNO(+) AND GL.FUNDCODEID =  '000003' AND SUBSTR(GL.ALIASCD,0,1) IN ('1','2','3') AND GL.ACCTNO = GT1.ACCTNO(+))
              GROUP BY ALIASCD) DM, FADEFACCT FA
        WHERE FA.ALIAS(+) = DM.ALIASCD AND FA.ALIAS <> '081'
          AND SUBSTR(ALIASCD,0,1) IN ('3') AND LENGTH(ALIASCD) >=3)
