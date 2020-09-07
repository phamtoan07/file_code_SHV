select * from fund where symbol = 'VFMVFE';

SELECT SUM (decode(FA.BALTYPE,'C',GL.AMT, -GL.AMT)) BGAMT --INTO L_ACCRUAL
    FROM  VW_GLTRAN_ALL GL ,FEEONNAVDTL F,GLMAST M,FADEFACCT FA
    WHERE GL.AMT = ROUND(F.FEEONNAV) AND GL.REFID = F.REFSVCONTRACT AND GL.TLTXCD = '9223'
          AND M.ACCTNO = GL.ACCTNO AND SUBSTR(M.ALIASCD,0,1) = '3' AND FA.ALIAS||'%' LIKE M.ALIASCD||'%'
          AND GL.BKDATE= F.NAVDATE AND GL.DELTD <> 'Y' 
          AND M.FUNDCODEID = '000003' AND F.NAVDATE = to_date('15/10/2025','dd/mm/rrrr') AND F.DELTD = 'N';
          
select * from fapostmap where tltxcd = '9223';

select 1300200000+ 200000000+7000000+2504811+306753 from dual; --1510011564

select 1510011564 + 103125000 from dual; --1613136564 1613136564

select 1613136564 - 1614137072 from dual; --1000508

select 1511012072 + 103125000 from dual; --1614137072

select * from fanavtemp where fundcodeid = '000003' and NAVDATE = to_date('15/10/2025','dd/mm/rrrr');

select * from vw_check_glmast_gltran;
select * from vw_check_gltran_glmasthist;

select abs(nvl(fn_nav_getcreditbalance('000003',to_date('15/10/2025','dd/mm/rrrr'),'3'),0)) from dual; --1511012072
select abs(nvl(fn_nav_getcreditbalance('000003',to_date('15/10/2025','dd/mm/rrrr'),'13'),0)) from dual;
select abs(nvl(fn_nav_getcreditbalance('000003',to_date('15/10/2025','dd/mm/rrrr'),'17'),0)) from dual; --103125000

   SELECT TO_NUMBER(SUBSTR(ALIASCD,0,1)) STT,
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
          AND SUBSTR(ALIASCD,0,1) IN ('3') AND LENGTH(ALIASCD) >=3
      
      
SELECT SUM(BGAMT) --INTO V_T3
        FROM (SELECT ALIASCD, SUM(BGAMT) BGAMT
              FROM (SELECT GL.ALIASCD,(GL.BALANCE - NVL(GT.AMT,0) - NVL(GT1.AMT,0)) BGAMT
                    FROM GLMAST GL,(SELECT ACCTNO, SUM(DECODE(DORC,'C', GT.AMT,'D',-GT.AMT )) AMT
                                    FROM VW_GLTRAN_ALL GT WHERE GT.BKDATE > to_date('15/10/2025','dd/mm/rrrr') AND GT.DELTD <> 'Y' GROUP BY ACCTNO) GT,
                                   (SELECT MAX(GL.ACCTNO) ACCTNO, SUM(GL.AMT) AMT FROM  VW_GLTRAN_ALL GL ,FEEONNAVDTL F,GLMAST M
                                    WHERE GL.AMT = ROUND(F.FEEONNAV) AND GL.REFID = F.REFSVCONTRACT AND GL.TLTXCD = '9223'
                                      AND M.ACCTNO = GL.ACCTNO AND SUBSTR(M.ALIASCD,0,1) = '3' AND GL.DELTD <> 'Y'
                                      AND GL.BKDATE= F.NAVDATE AND M.FUNDCODEID = '000003' AND F.NAVDATE = to_date('15/10/2025','dd/mm/rrrr') AND F.DELTD = 'N') GT1
                    WHERE GL.ACCTNO = GT.ACCTNO(+) AND GL.ACCTNO = GT1.ACCTNO(+) AND GL.FUNDCODEID =  '000003')
              GROUP BY ALIASCD) DM
        WHERE SUBSTR(DM.ALIASCD,0,1) IN ('3');
        
SELECT MAX(GL.ACCTNO) ACCTNO, SUM(GL.AMT) AMT FROM  VW_GLTRAN_ALL GL ,FEEONNAVDTL F,GLMAST M
                             WHERE GL.AMT = ROUND(F.FEEONNAV) AND GL.REFID = F.REFSVCONTRACT AND GL.TLTXCD = '9223'
                               AND M.ACCTNO = GL.ACCTNO AND SUBSTR(M.ALIASCD,0,1) = '3' AND GL.DELTD <> 'Y'
                               AND GL.BKDATE= F.NAVDATE AND M.FUNDCODEID = '000003' AND F.NAVDATE = to_date('15/10/2025','dd/mm/rrrr') AND F.DELTD = 'N'
                             GROUP BY GL.ACCTNO
