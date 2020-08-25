select * from TLTX where tltxcd = '6639' for update;

select * from fldmaster where objname = '6639' for update;

select * from fldval where objname = '6639' for update; 

select * from fldmaster where objname = '6621';

update fldmaster set PDEFNAME = NULL where OBJNAME = '6639';

select modcode, fldname, objname, defname, fldmask, fldformat, fldlen, fldwidth from fldmaster where objname = '6639' for update;

select * from search where searchcode like '%CFMAST%';

select * from search where upper(searchcmdsql) like '%CITAD%';


SELECT CITAD CITADCODE,BANKBICCODE CITADNAME FROM CRBBANKLIST WHERE 0=0

SELECT * FROm CRBBANKLIST;

select cf.custodycd, cf.fullname, cf.custid, acctno, afacctno, cf.swiftcode from cfmast cf, ddmast ci where cf.custid = ci.custid

select ci.cc from ddmast ci;

select cf.supebank from cfmast cf;

select * from allcode where cdname = 'ACCOUNTTYPE';

select * from search where searchcode like 'CFMAST_INSTRUCTION' for update;

select * from searchfld where searchcode like 'CFMAST_INSTRUCTION' for update;

select t.acctno VALUECD,t.acctno VALUE, t.display DISPLAY, t.display EN_DISPLAY from 
(select cf.custodycd, ci.acctno, ci.acctno ||' - '|| ci.ccycd || ' - ' || A1.CDCONTENT DISPLAY from ddmast ci, allcode A1, cfmast cf
where A1.CDNAME = 'ACCOUNTTYPE' and A1.CDVAl = ci.accounttype and A1.CDTYPE = 'DD'
      and ci.custid = cf.custid) t;
      
select t.acctno FILTERCD,t.acctno VALUECD, t.display DISPLAY, t.display EN_DISPLAY from 
(select cf.custodycd, ci.acctno, ci.acctno ||' - '|| ci.ccycd || ' - ' || A1.CDCONTENT DISPLAY from ddmast ci, allcode A1, cfmast cf
where A1.CDNAME = 'ACCOUNTTYPE' and A1.CDVAl = ci.accounttype and A1.CDTYPE = 'DD'
      and ci.custid = cf.custid) t
WHERE t.custodycd = <$TAGFIELD>

SELECT  CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY FROM ALLCODE WHERE CDNAME='YESNO' AND CDTYPE='SY' ORDER BY CDVAL

select * from fldmaster where ctltype = 'C' and LLIST is not null;

SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE




SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION

select t.BALANCE FILTERCD,  t.BALANCE VALUE,  t.BALANCE VALUECD,  t.BALANCE DISPLAY,  t.BALANCE EN_DISPLAY FROM
(select ci.acctno, (ci.balance + ci.holdbalance + ci.pendinghold + ci.pendinghold) BALANCE from ddmast ci)t
WHERE t.ACCTNO = '06072017000022'

select * from log_notify_cbfa;

select * from CBFA_SEMAST@CBFALINK;

select * from ddmast;

select * from fldmaster where objname = '6620';

select * from tllogfld;

select * from cfmast where custodycd = 'SHVFIF4466' for update;
