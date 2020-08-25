select * from allcode where cdname = 'SYNCDESC' for update;

select * from search where searchcode = 'FALOGNOTIFY' for update;

select * from searchfld where searchcode = 'FALOGNOTIFY' order by position for update;

select * from VW_FALOGNOTIFY;

select LOGTIME from log_notify_facb;

---
CREATE OR REPLACE VIEW VW_FALOGNOTIFY AS
SELECT F.AUTOID, F.OBJNAME, A2.EN_CDCONTENT OBJDESC,F.KEYNAME, F.KEYVALUE, F.ACTION, F.STATUS, 
     CASE WHEN F.LOGTIME IS NULL THEN NULL
          ELSE TO_CHAR(F.LOGTIME,'DD/MM/RRRR HH24:MI:SS')
     END LOGTIME,
     F.APPLYTIME, F.TXNUM, F.TXDATE, F.TLTXCD, F.GLOBALID, A1.EN_CDCONTENT STATUSDES, D.EN_ERRDESC ERRMSG, 'FA' FROMTO,
     CASE WHEN F.OBJNAME IN ('CBFABANKPAYMENT_RESULT') THEN 'FA: HOME/COMPLETED TRANSACTION'
          WHEN F.OBJNAME IN ('CACASH_RESULT') THEN 'FA: HOME/COMPLETED 9231/9391 TRANSACTION'
          WHEN F.OBJNAME IN ('LISTED_RESULT','REPO_RESULT') THEN 'FA: HOME/COMPLETED 9272/9273, 9274/9275 TRANSACTION'
          WHEN F.OBJNAME IN ('CRBBANKREQUEST_RESULT') THEN 'HOME/COMPLETED 9210 TRANSACTION'
          WHEN F.OBJNAME IN ('AUTO_EXEC_TRANS') THEN 'FA: HOME/COMPLETED TRANSACTION'
          WHEN F.OBJNAME IN ('USERLOGIN') THEN NULL
          WHEN F.OBJNAME IN ('ISSUERS') THEN 'FA: SYSTEM/MANAGEMENT OF STATIC DATA/MANAGEMENT OF ISSUER'
          WHEN F.OBJNAME IN ('SBSECURITIES') THEN 'FA: SYSTEM/MANAGEMENT OF STATIC DATA/MANAGEMENT OF INSTRUMENT'
          WHEN F.OBJNAME IN ('OTCODMAST') THEN 'FA: HOME/COMPLETED 9376 TRANSACTION'
          WHEN F.OBJNAME IN ('ODMAST') THEN 'FA: RECEIVE EXTERNAL DATA/TRADING RESULT/GV FA9260'
          WHEN F.OBJNAME IN ('ODMASTETF') THEN 'FA: CAPITAL MANAGEMENT/ETF FUND/ETF RESULT/GV FA0055'
          WHEN F.OBJNAME IN ('DOCSTRANFER') THEN 'FA: INTERNAL ACCOUNTING/COTRACT SERVICE AND PAYMENT/GV FA0096'
          WHEN F.OBJNAME IN ('CDGLMAST') THEN 'FA: HOME/COMPLETED 9264/9276 TRANSACTION'
          WHEN F.OBJNAME IN ('CATRANSFERCONFIRM') THEN 'FA: COPORATE ACTION/CA - RIGHT OPTION MOVEMENT/GV FA1000'
          WHEN F.OBJNAME IN ('CAALLOCATE','CAALLOCATE_SWITH','CAALLOCATE_RIGHT') THEN 'FA: COPORATE ACTION/GV FA1001, FA1004, FA1005'
          WHEN F.OBJNAME IN ('CBFA_FACAMAST') THEN 'FA: COPORATE ACTION/CA - CREATE EVENT/CREATE COPORATE ACTION' 
          WHEN F.OBJNAME IN ('OTCCONFIRM') THEN '' 
          WHEN F.OBJNAME IN ('CAMAST') THEN 'FA: COPORATE ACTION/CA - CREATE EVENT/GV FA1002'
          WHEN F.OBJNAME IN ('CBFABANKPAYMENT') THEN 'FA: SUPERVISING/GV FA0042'
          WHEN F.OBJNAME IN ('SEMAST','DDMAST')  THEN 'FA: INTERNAL ACCOUNTING/GENERAL ACCOUNTING/REVIEW TRIAL BALANCE'
          WHEN F.OBJNAME IN ('CRBTXREQ_RESULT')  THEN 'CB: INTERFACE TO BANK/GV 111201'
          WHEN F.OBJNAME IN ('CBFABANKPAYMENT_APPRSB')  THEN 'CB: INTERFACE TO BANK/GV 111215' 
          WHEN F.OBJNAME IN ('FACBSTATEMENT')  THEN 'CB: INTERFACE TO BANK/GV 111216'
          WHEN F.OBJNAME IN ('FUND')  THEN 'ONLINE: FUND INFORMATION' 
          WHEN F.OBJNAME IN ('FACBSTATEMENT_RESULT')  THEN 'FA: INTERNAL ACCOUNTING/COTRACT SERVICE AND PAYMENT/GV FA0041'
     ELSE NULL
     END COMPONENT
FROM LOG_NOTIFY_FACB F, ALLCODE A1, DEFERROR D, ALLCODE A2
WHERE F.STATUS = A1.CDVAL AND A1.CDNAME = 'SYNSTATUS' AND A1.CDTYPE = 'FA'
      AND D.ERRNUM(+) = F.ERR_CODE
      AND A2.CDTYPE(+) = 'SA' AND A2.CDNAME(+) = 'SYNCDESC' and A2.CDVAL(+) = F.OBJNAME
UNION ALL
SELECT F.AUTOID, F.OBJNAME, A2.EN_CDCONTENT OBJDESC, F.KEYNAME, F.KEYVALUE, F.ACTION, F.STATUS,
     CASE WHEN F.LOGTIME IS NULL THEN NULL
          ELSE TO_CHAR(F.LOGTIME,'DD/MM/RRRR HH24:MI:SS')
     END LOGTIME,
     F.APPLYTIME, F.TXNUM, F.TXDATE, F.TLTXCD, F.GLOBALID, A1.EN_CDCONTENT STATUSDES,D.EN_ERRDESC ERRMSG, 'FA' FROMTO,
     CASE WHEN F.OBJNAME IN ('CBFABANKPAYMENT_RESULT') THEN 'FA: HOME/COMPLETED TRANSACTION'
          WHEN F.OBJNAME IN ('CACASH_RESULT') THEN 'FA: HOME/COMPLETED 9231/9391 TRANSACTION'
          WHEN F.OBJNAME IN ('LISTED_RESULT','REPO_RESULT') THEN 'FA: HOME/COMPLETED 9272/9273, 9274/9275 TRANSACTION'
          WHEN F.OBJNAME IN ('CRBBANKREQUEST_RESULT') THEN 'HOME/COMPLETED 9210 TRANSACTION'
          WHEN F.OBJNAME IN ('AUTO_EXEC_TRANS') THEN 'FA: HOME/COMPLETED TRANSACTION'
          WHEN F.OBJNAME IN ('USERLOGIN') THEN NULL
          WHEN F.OBJNAME IN ('ISSUERS') THEN 'FA: SYSTEM/MANAGEMENT OF STATIC DATA/MANAGEMENT OF ISSUER'
          WHEN F.OBJNAME IN ('SBSECURITIES') THEN 'FA: SYSTEM/MANAGEMENT OF STATIC DATA/MANAGEMENT OF INSTRUMENT'
          WHEN F.OBJNAME IN ('OTCODMAST') THEN 'FA: HOME/COMPLETED 9376 TRANSACTION'
          WHEN F.OBJNAME IN ('ODMAST') THEN 'FA: RECEIVE EXTERNAL DATA/TRADING RESULT/GV FA9260'
          WHEN F.OBJNAME IN ('ODMASTETF') THEN 'FA: CAPITAL MANAGEMENT/ETF FUND/ETF RESULT/GV FA0055'
          WHEN F.OBJNAME IN ('DOCSTRANFER') THEN 'FA: INTERNAL ACCOUNTING/COTRACT SERVICE AND PAYMENT/GV FA0096'
          WHEN F.OBJNAME IN ('CDGLMAST') THEN 'FA: HOME/COMPLETED 9264/9276 TRANSACTION'
          WHEN F.OBJNAME IN ('CATRANSFERCONFIRM') THEN 'FA: COPORATE ACTION/CA - RIGHT OPTION MOVEMENT/GV FA1000'
          WHEN F.OBJNAME IN ('CAALLOCATE','CAALLOCATE_SWITH','CAALLOCATE_RIGHT') THEN 'FA: COPORATE ACTION/GV FA1001, FA1004, FA1005'
          WHEN F.OBJNAME IN ('CBFA_FACAMAST') THEN 'FA: COPORATE ACTION/CA - CREATE EVENT/CREATE COPORATE ACTION' 
          WHEN F.OBJNAME IN ('OTCCONFIRM') THEN '' 
          WHEN F.OBJNAME IN ('CAMAST') THEN 'FA: COPORATE ACTION/CA - CREATE EVENT/GV FA1002'
          WHEN F.OBJNAME IN ('CBFABANKPAYMENT') THEN 'FA: SUPERVISING/GV FA0042'
          WHEN F.OBJNAME IN ('SEMAST','DDMAST')  THEN 'FA: INTERNAL ACCOUNTING/GENERAL ACCOUNTING/REVIEW TRIAL BALANCE'
          WHEN F.OBJNAME IN ('CRBTXREQ_RESULT')  THEN 'CB: INTERFACE TO BANK/GV 111201'
          WHEN F.OBJNAME IN ('CBFABANKPAYMENT_APPRSB')  THEN 'CB: INTERFACE TO BANK/GV 111215' 
          WHEN F.OBJNAME IN ('FACBSTATEMENT')  THEN 'CB: INTERFACE TO BANK/GV 111216'
          WHEN F.OBJNAME IN ('FUND')  THEN 'ONLINE: FUND INFORMATION' 
          WHEN F.OBJNAME IN ('FACBSTATEMENT_RESULT')  THEN 'FA: INTERNAL ACCOUNTING/COTRACT SERVICE AND PAYMENT/GV FA0041'
     ELSE NULL
     END COMPONENT
FROM SYN_CBFA_LOG_NOTIFY F, ALLCODE A1,DEFERROR D, ALLCODE A2
WHERE F.STATUS = A1.CDVAL AND A1.CDNAME = 'SYNSTATUS' AND A1.CDTYPE = 'FA'
      AND D.ERRNUM(+) = F.ERR_CODE
      AND A2.CDTYPE(+) = 'SA' AND A2.CDNAME(+) = 'SYNCDESC' and A2.CDVAL(+) = F.OBJNAME;
      
----
select * from tlog where luser = user order by id desc;

select * from search where lower(searchcmdsql) like '%cbfauserlogin%';

select * from user