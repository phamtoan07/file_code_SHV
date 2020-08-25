select * from version for update;

--mt.1.1.3.3
--uat.1.0.3.8
--prod.1.0.0.4
-- clinet prod.1.0.0.6


/
begin
dbms_utility.compile_schema(schema => 'FUNDSHVTEST', compile_all => false);
end;
/
select * from all_objects where owner = 'FUNDSHVTEST' and status = 'INVALID';
/

----------

select * from cmdmenu where cmdid like '930%' and prid like '930%' for update;

930010  930000  2 Y R   FA  RPTMASTER Báo cáo
930020  930000  2 Y R   FA  SUBMIT_REPORT Submit report
930036  930000  2 Y R   FA  CONFIG_SUBMIT_REPORT  Config submit report

SELECT M.ODRID, M.CMDCODE, M.CMDID, M.PRID, M.CMDNAME, M.EN_CMDNAME, M.LEV, M.LAST, M.IMGINDEX, M.MODCODE, M.OBJNAME, 
M.MENUTYPE, 'Y' CMDALLOW, M.AUTHCODE, 'YYYYY' STRAUTH, 'M' txtype, TLTXCD, 'A' RIGHTSCOPE
FROM VW_CMDMENU_ALL_RPT M
WHERE M.ODRID LIKE '%930010' OR M.ODRID LIKE '%930020' OR M.ODRID LIKE '%930036' OR M.CMDCODE = 'FA0001'
ORDER BY M.ODRID 


SELECT M.ODRID, M.CMDCODE, M.CMDID, M.PRID, M.CMDNAME, M.EN_CMDNAME, M.LEV, M.LAST, M.IMGINDEX, M.MODCODE, M.OBJNAME, 
M.MENUTYPE, 'Y' CMDALLOW, M.AUTHCODE, 'YYYYY' STRAUTH, 'M' txtype, TLTXCD, 'A' RIGHTSCOPE
FROM VW_CMDMENU_ALL_RPT M
WHERE M.odrid like '%930010%' 
ORDER BY M.ODRID 

SELECT M.ODRID, M.CMDCODE, M.CMDID, M.PRID, M.CMDNAME, M.EN_CMDNAME, M.LEV, M.LAST, M.IMGINDEX, M.MODCODE, M.OBJNAME, 
M.MENUTYPE, 'Y' CMDALLOW, M.AUTHCODE, 'YYYYY' STRAUTH, 'M' txtype, TLTXCD, 'A' RIGHTSCOPE
FROM VW_CMDMENU_ALL_RPT M
WHERE M.odrid like '%930020%'
ORDER BY M.ODRID 

SELECT M.ODRID, M.CMDCODE, M.CMDID, M.PRID, M.CMDNAME, M.EN_CMDNAME, M.LEV, M.LAST, M.IMGINDEX, M.MODCODE, M.OBJNAME, 
M.MENUTYPE, 'Y' CMDALLOW, M.AUTHCODE, 'YYYYY' STRAUTH, 'M' txtype, TLTXCD, 'A' RIGHTSCOPE
FROM VW_CMDMENU_ALL_RPT M
WHERE M.odrid like '%930036%'
ORDER BY M.ODRID 


SELECT DISTINCT M.CMDID || '.' || R.RPTID ODRID,
       R.RPTID CMDID,
       M.CMDID PRID,
       CASE WHEN r.MNVIEWTYPE IN ('B') THEN '(BACK) ' WHEN  r.MNVIEWTYPE IN ('O') THEN '(ONLINE) ' ELSE '(ALL) ' END
         || r.RPTID ||': '|| r.DESCRIPTION CMDNAME,
       r.RPTID ||': '|| r.en_description EN_CMDNAME,
       3 LEV, 'Y' LAST, 3 IMGINDEX, M.MODCODE, M.OBJNAME, M.MENUTYPE, M.AUTHCODE, 'YYYY' STRAUTH, 'R' txtype, m.tltxcd,
       R.RPTID CMDCODE
FROM RPTMASTER R, APPMODULES A, CMDMENU M
WHERE R.MODCODE=M.MODCODE AND R.CMDTYPE='R'
  AND M.MENUTYPE='R' AND M.MODCODE=A.MODCODE
  
select * from rptmaster where rptid = 'FA0001';

select * from CMDMENU where menutype = 'R';

select * from CMDMENU where cmdid IN ('930020','930036') for update;


insert into CMDMENU (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('930036', '930000', 2, 'Y', 'R', null, 'FA', 'CONFIG_SUBMIT_REPORT', 'Config submit report', 'Config submit report', 'YYYYYYYYYY', null, null, '9206', 'B', 'FA', null);

select * from CMDAUTH where authid = '0001' for update;
select * from CMDAUTH where cmdcode = '930020' for update;
select * from CMDAUTH where cmdcode = '930036' for update;

select * from tlprofiles where TLNAME = 'PQ004';
select * from tlgroups;

cspks_saproc.pr_CheckSessionID


SELECT TLPROFILES.TLID VALUE, TLPROFILES.TLNAME DISPLAY 
FROM TLPROFILES, TLGRPUSERS, TLGROUPS 
WHERE TLPROFILES.TLID = TLGRPUSERS.TLID AND TLGRPUSERS.GRPID = TLGROUPS.GRPID AND TLGROUPS.GRPID = '0001' 
ORDER BY TLPROFILES.TLNAME

--9238
select * from fldmaster where objname = '9238';

SELECT SYMBOL        VALUECD,
       SYMBOL        VALUE,
       SYMBOL DISPLAY,
       SYMBOL EN_DISPLAY,
       CODEID FUNDCODEID
  FROM FUND
 WHERE 1=1 order by codeid
 
 ---
 select * from cmdmenu where mnviewcode = '9287';
  
 select * from tlgrpusers;
 select * from CMDAUTH where authid = '0004' for update;
  select * from CMDAUTH where authid = '0003';
 select * from CMDAUTH where authid = '0056' for update;
 
 select * from tlprofiles where tlid = '0056';
 
 select * from cmdmenu where cmdid = '924002';
 
 ---
 
 select * from vw_cmdmenu_all_rpt where cmdid in ('924002','924050', '928341', '924009','928232'); --0056

 
SELECT count(STRAUTH) l_count FROM cmdauth  WHERE cmdtype='T'
        AND authtype = 'U' AND AUTHID = '0062' AND cmdcode = '9200';
        
SELECT M.GRPID FROM TLGRPUSERS M, TLGROUPS A
        WHERE M.GRPID = A.GRPID AND M.TLID = '0062' AND A.ACTIVE = 'Y'
        
SELECT * FROM cmdauth  WHERE cmdtype='T'
        AND authtype = 'G' AND AUTHID = '0004' AND cmdcode = '9200';
