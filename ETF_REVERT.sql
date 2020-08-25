select * from sbfundetflog;

select * from user_source where upper(text) like '%SBFUNDETFLOG%';

select * from cb_fatanoticetx;

alter table sbfundetflog drop column QTTY;
alter table sbfundetflog drop column AMT;

alter table sbfundetflog add NVALUE NUMBER(38,10);
alter table sbfundetflog add CVALUE VARCHAR2(200);
alter table sbfundetflog add CAMASTID VARCHAR2(50);
alter table sbfundetflog add NAVDATE DATE;


alter table sbfundetf add deltd varchar2(1) default 'N';

/

select * from fldmaster where objname = '9261';

select * from search where searchcode = 'FATRADNOTICETXPEN';

SELECT A.AUTOID, A.REFKEY, C.SYMBOL, A.CUSTODYCD, A.REFSYMBOL,
A.TXDATE, A.TXNUM, A.TXBORS, A.TXAMT, A.TXQTTY, A.FEEAMT, A.TXDESC, A.STATUS, A.FUNDCODEID, A.REFFUNDSFID, a.tradedate
FROM FASFNOTICETX A, FAFUNDACCTSF B, FUND C
WHERE A.STATUS='P' AND A.REFFUNDSFID=B.AUTOID AND A.FUNDCODEID=C.CODEID

/
select * from search where searchcode= 'FA9390' for update;
/

select * from deferror order by errnum for update;
/

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921384, '[-921384] : Transaction no. 9260 need to revert', '[-921384] : Transaction no. 9260 need to revert', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921383, '[-921383] : Transaction no. 9349 need to revert', '[-921383] : Transaction no. 9349 need to revert', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921382, '[-921382] : Transaction no. 9384 need to revert', '[-921382] : Transaction no. 9384 need to revert', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921381, '[-921381] : Transaction no. 9348 need to revert', '[-921381] : Transaction no. 9348 need to revert', 'FA', 0);

insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921380, '[-921380] : Transaction no. 9359 need to revert', '[-921380] : Transaction no. 9359 need to revert', 'FA', 0);

/
insert into cmdmenu (CMDID, PRID, LEV, LAST, MENUTYPE, MENUCODE, MODCODE, OBJNAME, CMDNAME, EN_CMDNAME, AUTHCODE, TLTXCD, SHORTCUT, MNVIEWCODE, MNVIEWTYPE, MKTDOMAIN, USERROLES)
values ('924015', '924013', 3, 'Y', 'A', null, 'FA', null, 'Hủy thông báo kết quả giao dịch chứng khoán', 'Reject the stock trading result notice', null, '9261', null, null, null, 'FA', null);

/

select * from search where searchcode = 'FA0047';
select * from search where searchcode = 'FA0048';
select * from search where searchcode = 'FA0049';

