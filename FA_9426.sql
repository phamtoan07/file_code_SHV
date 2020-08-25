select * from fldmaster where objname = '9265';

select * from fapostmap where tltxcd = '9265';

select * from fldmaster where objname like '9265'

select * from cbfaoddexchangetx ;

alter table cbfaoddexchangetx add refcontract number;

select * from FAODDEXCNOTICETX;

select * from fldmaster where objname = '9462';

select * from allcode where cdname = 'STATUS';

select * from searchfld where searchcode = 'FA0016';

select * from search where searchcode = 'INSTRLISTSTOCK';

select * from search where searchcode = 'FAODDEXCHANGE' for update; --FAODDEXCHANGE

select * from searchfld where searchcode = 'FAODDEXCHANGE' for update;

/

SELECT A.AUTOID, A.REFKEY, C.SYMBOL, A.CUSTODYCD, A.REFSYMBOL,
A.TXDATE, A.TXNUM, A.TXBORS, A.TXAMT, A.TXQTTY, A.FEEAMT, A.TXDESC, A.STATUS, 
A.FUNDCODEID, A.REFFUNDSFID, A1.EN_CDCONTENT STATUSDES
FROM FAODDEXCNOTICETX A, FUND C, INSTRLIST D, ALLCODE A1
WHERE A.STATUS IN ('P','A') AND A.FUNDCODEID=C.CODEID
AND A.REFSYMBOL=D.SYMBOL AND D.CFICODE IN ('ES','EF','CC','CP')
AND D.FUNDCODEID IS NULL
AND A1.CDTYPE = 'SA' and A1.CDNAME = 'STATUS' AND A1.CDVAL = A.STATUS

/
select * from deferror where errnum = '-921336';
select * from deferror order by errnum for update;
/

prompt Importing table deferror...
set feedback off
set define off
insert into deferror (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL)
values (-921379, '[-921378] : Received quantity and contract quantity is not matched', '[-921378] : Received quantity and contract quantity is not matched', 'FA', 0);

prompt Done.

/

select * from tlog where luser = user order by id desc;

-- 
--
/
DELETE FROM tltxwf WHERE tltxcd  ='9426';

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9426', 1, 'V1', 2, 1, 'N', 'A', null, null);

insert into tltxwf (AUTOID, TLTXCD, LVEL, DSTATUS, APRLVEL, REFUSELVEL, LAST, STATUS, PSTATUS, LASTCHANGE)
values (seq_tltxwf.nextval, '9426', 2, 'V2', 2, 1, 'Y', 'C', null, null);

commit;  
/
