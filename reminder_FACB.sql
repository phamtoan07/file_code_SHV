UPAT

select * from sysvar where varname = 'CURRDATE';

update sysvar set varvalue = ... where varname = 'CURRDATE';

-------


SELECT M.ODRID, M.CMDCODE, M.CMDID, M.PRID, M.CMDNAME, M.EN_CMDNAME, M.LEV, M.MKTDOMAIN, M.USERROLES, M.LAST, 
M.IMGINDEX, M.MODCODE, M.OBJNAME, M.MENUTYPE, 'Y' CMDALLOW, M.AUTHCODE, 'YYYYY' STRAUTH, 'A' RIGHTSCOPE, M.SHORTCUT,
M.MNVIEWCODE, M.TLTXCD 
FROM VW_CMDMENU_ALL M WHERE M.LEV > 0 AND (M.MKTDOMAIN='ALL' OR M.MKTDOMAIN='FA')ORDER BY M.ODRID 

select * from cmdmenu where mnviewcode is not null order by cmdid;
select * from cmdmenu where cmdid =  '929100' order by cmdid;

select * from search where searchcode = 'SBACTIMST';

--work status
SELECT SB.AUTOID, SB.RESTRID,
A1.CDCONTENT ACTIMSTTYP, A2.CDCONTENT PRIORITY, RESOLUTION, A3.CDCONTENT COMPONENT,
SB.LABELS, SB.TITLE, SB.TITLE_EN, SB.NOTES, F.SYMBOL REFCODE, SB.TXNUM,
TO_DATE(SB.TXDATE,'DD/MM/RRRR') TXDATE,
TO_DATE(SB.CREATEDT,'DD/MM/RRRR') CREATEDT ,
TO_DATE(SB.UPDATEDT,'DD/MM/RRRR') UPDATEDT ,
TO_DATE(SB.RESOLVEDT,'DD/MM/RRRR') RESOLVEDT ,
TO_DATE(SB.DUEDT,'DD/MM/RRRR') DUEDT,
A.CDCONTENT STATUS,A5.CDCONTENT ONLINESTATUS,A4.CDCONTENT PUBLISHSTATUS, M.MBCODEVSD AMCCODE, M.MBNAME_EN AMCNAME, F.CODEID FUNDCODEID
FROM SBACTIMST SB ,ALLCODE A,ALLCODE A1,ALLCODE A2,ALLCODE A3,ALLCODE A4,ALLCODE A5,FUND F, MEMBERS M
WHERE nvl(SB.SBSTATUS,'O') = A.CDVAL AND A.CDTYPE = 'SB' AND A.CDNAME = 'SBSTATUS'
and nvl(SB.Onlinestatus,'O') = A5.CDVAL AND A5.CDTYPE = 'SB' AND A5.CDNAME = 'SBSTATUS'
AND nvl(SB.ACTIMSTTYP,'A') = A1.CDVAL AND A1.CDTYPE = 'SB' AND A1.CDNAME = 'ACTIMSTTYP'
AND nvl(SB.PRIORITY,'I') = A2.CDVAL AND A2.CDTYPE = 'SB' AND A2.CDNAME = 'PRIORITY'
AND nvl(SB.COMPONENT,'T') = A3.CDVAL AND A3.CDTYPE = 'SB' AND A3.CDNAME = 'COMPONENT'
AND nvl(SB.PUBLISHSTATUS,'N') = A4.CDVAL AND A4.CDTYPE = 'SB' AND A4.CDNAME = 'PUBLISHSTATUS'
AND NVL(SB.DELTD,'N') <> 'Y'
AND SB.REFCODE =F.CODEID  AND F.FMCODE=M.MBCODE

--fa0057

select * from search where searchcode = 'FA0057';

SELECT DISTINCT FU.CODEID FUNDCODEID, FU.SYMBOL, SB.NOTES DESCRIPTION, 'Manual' TYPEALERT, OBJ.TXDATE||' '||OBJ.OFFTIME CREATEDTIME, OBJ.TXDATE, OBJ.OFFTIME
FROM (SELECT * FROM VW_OBJLOGHIST_ALL WHERE AUTOID IN (SELECT MAX(AUTOID) FROM VW_OBJLOGHIST_ALL WHERE CHILTABLE = 'SBSCHDREGU' AND TXSTATUS = 1 GROUP BY CHILDVALUE)) OBJ, FUND FU, SBSCHDREGU SB
WHERE OBJ.PARENTVALUE = FU.CODEID AND OBJ.CHILDVALUE = TO_CHAR(SB.AUTOID)
AND FN_DATE_SBSCHDREGU(SB.AUTOID) = GETCURRDATE
UNION ALL
SELECT DISTINCT FU.CODEID FUNDCODEID, FU.SYMBOL, 'SI' DESCRIPTION, 'Auto' TYPEALERT, OBJ.TXDATE||' '||OBJ.OFFTIME CREATEDTIME, OBJ.TXDATE, OBJ.OFFTIME
FROM (SELECT * FROM VW_OBJLOGHIST_ALL WHERE AUTOID IN (SELECT FN_FA_GETKEYBYACTION(AUTOID) FROM VW_OBJLOGHIST_ALL WHERE CHILTABLE = 'PAYSCHEDULE' AND TXSTATUS = 1)) OBJ, FUND FU
WHERE OBJ.PARENTVALUE = FU.CODEID AND OBJ.TXDATE >= ADD_MONTHS(GETCURRDATE, - 1)
UNION ALL
SELECT DISTINCT FU.CODEID FUNDCODEID, FU.SYMBOL, 'Pricing Policy' DESCRIPTION, 'Auto' TYPEALERT, OBJ.TXDATE||' '||OBJ.OFFTIME CREATEDTIME, OBJ.TXDATE, OBJ.OFFTIME
FROM (SELECT * FROM VW_OBJLOGHIST_ALL WHERE AUTOID IN (SELECT FN_FA_GETKEYBYACTION(AUTOID) FROM VW_OBJLOGHIST_ALL WHERE CHILTABLE = 'FAFUNDPOLICY' AND TXSTATUS = 1)) OBJ, FUND FU
WHERE OBJ.PARENTVALUE = FU.CODEID AND OBJ.TXDATE >= ADD_MONTHS(GETCURRDATE, - 1)
UNION ALL
SELECT FU.CODEID FUNDCODEID, FU.SYMBOL, A0.CDCONTENT DESCRIPTION, 'Auto' TYPEALERT, CB.TXDATE||' '||TO_CHAR(SY.LOGTIME,'HH24:MI:SS') CREATEDTIME, CB.TXDATE, TO_CHAR(SY.LOGTIME,'HH24:MI:SS') OFFTIME
FROM CBFABANKPAYMENT CB, SYN_CBFA_LOG_NOTIFY SY, FUND FU, ALLCODE A0
WHERE CB.GLOBALID = SY.GLOBALID AND CB.FUNDCODEID = FU.CODEID AND CB.TXDATE >= ADD_MONTHS(GETCURRDATE, - 1)
AND CB.INSTRUCTTYPE = A0.CDVAL AND A0.CDNAME ='CBTXTYPE' AND A0.CDTYPE IN ('SB','CF','CB')

--
select * from cmdauth;
--
select * from payschedule;
SELECT CODEID VALUE, SYMBOL DISPLAY, SYMBOL EN_DISPLAY, 0 LSTODR FROM FUND WHERE 0=0 ORDER BY SYMBOL;

SELECT CODEID VALUE, SYMBOL DISPLAY, SYMBOL EN_DISPLAY, 0 LSTODR FROM FUND WHERE CODEID = '000009' ORDER BY SYMBOL;

SELECT CDVAL VALUE, EN_CDCONTENT DISPLAY, EN_CDCONTENT EN_DISPLAY, LSTODR FROM ALLCODE 
WHERE CDNAME = 'CBTXTYPE' AND CDTYPE = 'SB' AND CDVAL = 'ETFFSR' ORDER BY LSTODR

---
create table REMINDEREMAIL
(
  autoid number,
  fundcodeid varchar2(50),
  txtype varchar2(50),
  subtxtype  varchar2(50),
  authtype   varchar2(1),
  userid     varchar2(10),
  grid       varchar2(10),
  savetlid   VARCHAR2(8),
  lastdate   date
);
create sequence seq_reminderemail;

create table reminderemail_log
(
  autoid   NUMBER,
  logtable VARCHAR2(50),
  authtype VARCHAR2(1),
  fundcodeid VARCHAR2(10),
  txtype   VARCHAR2(20),
  subtxtxtype   VARCHAR2(20),
  chgtlid  VARCHAR2(8),
  chgtime  TIMESTAMP(6),
  oldvalue VARCHAR2(2000),
  newvalue VARCHAR2(2000),
  busdate  DATE
);
create sequence seq_reminderemail_log;


SELECT T.GRID VALUE, T.GRNAME DISPLAY
FROM  TLGROUPS T
WHERE T.GRID NOT IN (SELECT R.GRID FROM REMINDEREMAIL R WHERE R.AUTHTYPE = 'G' AND R.FUNDCODEID =  AND R.TXTYPE = AND R.SUBTXTYPE = );

SELECT T.TLID VALUE, T.TLNAME DISPLAY FROM  TLPROFILES T WHERE 
T.TLID NOT IN (SELECT R.USERID FROM REMINDEREMAIL R WHERE R.AUTHTYPE = 'U' AND R.FUNDCODEID = '000009' AND R.TXTYPE = 'ETFEX')
ORDER BY T.TLNAME

SELECT T.TLID VALUE, T.TLNAME DISPLAY FROM REMINDEREMAIL R, TLPROFILES T 
WHERE T.TLID = R.USERID AND R.AUTHTYPE  = 'U' AND R.FUNDCODEID = '000009' AND R.TXTYPE = 'ETFEX'

--FUNDCODEID, TXTYPE, SUBTXTYPE, AUTHTYPE, USERID, GRID, SAVETLID, LASTDATE

--
SELECT USERID FROM REMINDEREMAIL WHERE AUTHTYPE = 'U' AND FUNDCODEID = '000009' AND TXTYPE = 'ETFEX'

INSERT INTO REMINDEREMAIL(AUTOID, FUNDCODEID, TXTYPE, SUBTXTYPE, AUTHTYPE, USERID, GRID, SAVETLID, LASTDATE) 
VALUES(SEQ_REMINDEREMAIL.NEXTVAL, '000009',  'ETFEX', NULL, 'U', 'TOANPH', NULL, '0001',  GETCURRDATE)

--
select * from REMINDEREMAIL;
delete from REMINDEREMAIL;

select * from reminderemail_log;
delete from reminderemail_log;

alter table payschedule add subtype varchar2(10);

select * from fldmaster where objname like '%PAYSCHEDULE%' for update;

--
select * from tlog where luser = user order by id desc;
select * from search where searchcode = 'FA0057';

select * from PAYSCHEDULE;