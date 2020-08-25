SElect sum(sb.qtty*sb.price+sb.holdsell*sb.price) amt,(sum(sb.obliqtty*sb.price)/10) obliamt,
              sum(sb.amt-sb.qtty*fa.costprice) lailo,c.symbol,sb.tradingid, SB.txtype,
              sum(sb.qtty*fa.costprice+sb.holdsell*fa.costprice) famt
       from  sbfundetf sb,FUND c,fasemast fa
       where sb.fundcodeid = c.codeid  and fa.refsymbol = sb.refsymbol and sb.deltd <> 'Y'
         and fa.fundcodeid = c.codeid and sb.tradingid = 'ETFVPT|20210406' group by c.symbol,sb.tradingid,txtype
         
select * from sbfundetf where tradingid = 'ETFVPT|20210406';

select * from fasemast where fundcodeid = '001127' and refsymbol = 'VNM';

select * from fatanoticetx where reftxnum = '000001000180';

select * from gltran where txnum= '000001000180';

select * from search where searchcode IN ('FA0031','FA0032') for update;


----

select * from (SELECT A.AUTOID AUTOID,
       A.REFKEY REFKEY,
       C.SYMBOL,
     c.codeid fundcodeid,
       A.TRADINGID,
       a2.cdcontent typeetf,
       a.mbcode||c.codeid mbname,
       NVL(C.PARVALUE,0) PARVALUE,
       a.NAVAMT NAVCCQ,
       A.TXQTTY TXQTTY,
       A.TXAMTEX,
       (case when A.TXAMTEX > 0 then A.TXAMTEX else 0 end) TXAMTEXVAL,
       A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) TXAMT,
       A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0) FUNDAMT,
       TO_CHAR(A.TXDATE, 'dd/MM/rrrr') TXDATE,
       A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) - A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)  GAPAMT,
       (CASE WHEN
        A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) > A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)
        THEN  A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) - A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)
        ELSE 0 END) GAPAMTDUONG,
        (CASE WHEN
        A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) < A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)
        THEN  -(A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) - A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0))
        ELSE 0 END) GAPAMTAM,
       A.TAX TAX,
       NVL(A.FEEAMT,0) FEEAMT,
       C.CODEID,
       LEAST(st.amt,st.famt) restructuring,
       (case when nvl(st.lailo,0) > 0 then  nvl(st.lailo,0)
       else 0 end) lai,
        (case when nvl(st.lailo,0) < 0 then  -nvl(st.lailo,0)
       else 0 end) lo, a1.cdcontent status, a.tradedate
FROM FATANOTICETX A, FUND C ,allcode a1,members m,allcode a2,
       (SElect sum(sb.qtty*sb.price+sb.holdsell*sb.price) amt,(sum(sb.obliqtty*sb.price)/10) obliamt,
              sum(sb.amt-sb.qtty*fa.costprice) lailo,c.symbol,sb.tradingid, SB.txtype,
              sum(sb.qtty*fa.costprice+sb.holdsell*fa.costprice) famt
       from  sbfundetf sb,FUND c,fasemast fa
       where sb.fundcodeid = c.codeid  and fa.refsymbol = sb.refsymbol and sb.deltd <> 'Y'
         and fa.fundcodeid = c.codeid group by c.symbol,sb.tradingid,txtype)  ST
 WHERE A.TXTYPE = 'R'
   AND A.FUNDSYMBOL = C.SYMBOL
   and a1.cdname = 'FATANOTICETX'
   and a1.cdtype = 'FA'
   AND a.status IN ('P','A')
   and a.mbcode = m.mbcode
   and a1.cdval = a.status
   and a2.cdname = 'TYPEETF'
   and a2.cdval = a.txtype
   and a2.cdtype = 'FA'
   AND c.ftype = 'ETF'
   AND A.FUNDSYMBOL = st.symbol(+)
   and a.tradingid = st.tradingid(+)
   and a.txtype = st.txtype(+)
   AND a.deltd <>'Y'
   ORDER BY A.STATUS DESC,A.TXDATE DESC)  WHERE 0=0
   
   
   ------
   select sum(sb.qtty*sb.price+sb.holdsell*sb.price) amt, sum(sb.amt-sb.qtty*sb.price) lailo,c.symbol,sb.tradingid
        from  sbfundetf sb, FUND c
        where  sb.fundcodeid = c.codeid and sb.tradingid = 'ETFVPT|20210406' and sb.deltd<>'Y' group by c.symbol,sb.tradingid,txtype
        
   select * from sbfundetf where tradingid = 'ETFVPT|20210406';
   
   select * from gltran union gltrana wh
   
   select * from fapostmap where tltxcd = '9286';
   
   ---------
   
   select * from (SELECT A.AUTOID AUTOID,  --9285
       A.REFKEY REFKEY,
       C.SYMBOL,
     c.codeid fundcodeid,
       A.TRADINGID,
       a2.cdcontent typeetf,
       m.mbcode||c.codeid  mbname,
       nvl(c.PARVALUE,0) PARVALUE,
       a.NAVAMT NAVCCQ,
       A.TXQTTY TXQTTY,
       A.TXAMTEX,
       (case when A.TXAMTEX <0 then ABS(A.TXAMTEX) else 0 end) TXAMTEXVAL,
       A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) TXAMT,
       A.TXQTTY * nvl(c.PARVALUE,0)*NVL(C.TRADEUNIT,0) FUNDAMT,
       TO_CHAR(A.TXDATE, 'dd/MM/rrrr') TXDATE,
       A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) - A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)  GAPAMT,
       (CASE WHEN
        A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) > A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)
        THEN  A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) - A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)
        ELSE 0 END) GAPAMTDUONG,
       (CASE WHEN
        A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) < A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0)
        THEN  -(A.TXQTTY*a.NAVAMT*NVL(C.TRADEUNIT,0) - A.TXQTTY * NVL(C.PARVALUE,0)*NVL(C.TRADEUNIT,0))
        ELSE 0 END) GAPAMTAM,
       A.TAX TAX,
       NVL(A.FEEAMT,0) FEEAMT,
       C.CODEID,
       nvl(st.amt,0) restructuring,
       nvl(st.obliamt,0) obliamt,
       (case when nvl(st.lailo,0) > 0 then  nvl(st.lailo,0)
       else 0 end) lai,
       (case when nvl(st.lailo,0) < 0 then  -nvl(st.lailo,0)
       else 0 end) lo,a1.cdcontent status, a.tradedate
FROM FATANOTICETX A, FUND C ,allcode a1,members m,allcode a2,
        (SElect sum(sb.qtty*sb.price+sb.holdsell*sb.price) amt,(sum(sb.obliqtty*sb.price)/10) obliamt,
              sum(sb.amt-sb.qtty*fa.costprice) lailo,c.symbol,sb.tradingid, SB.txtype,
              sum(sb.qtty*fa.costprice+sb.holdsell*fa.costprice) famt
       from  sbfundetf sb,FUND c,fasemast fa
       where sb.fundcodeid = c.codeid  and fa.refsymbol = sb.refsymbol and sb.deltd <> 'Y'
         and fa.fundcodeid = c.codeid group by c.symbol,sb.tradingid,txtype)  ST
WHERE
   A.FUNDSYMBOL = C.SYMBOL
   and a1.cdname = 'FATANOTICETX'
   and a1.cdtype = 'FA'
   AND a.status IN ('P','A')
   and a.mbcode = m.mbcode
   and a1.cdval = a.status
   and a2.cdname = 'TYPEETF'
   and a2.cdval = a.txtype
   and a2.cdtype = 'FA'
   AND c.ftype = 'ETF'
   AND A.TXTYPE = 'S'
   AND A.FUNDSYMBOL = st.symbol(+)
   and a.tradingid = st.tradingid(+)
   and a.txtype = st.txtype(+)
   and a.deltd <> 'Y'
   ORDER BY A.STATUS DESC,A.TXDATE DESC)  WHERE 0=0 
