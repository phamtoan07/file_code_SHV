select * from tllog where txnum = '000001009438';

select * from syn_cbfa_log_notify order by autoid desc;

select * from tltx where tltxcd = '9392' for update;
select * from fldmaster where objname = '9392' for update;

select * from tltx where tltxcd = '9264';
---------

delete tbl_txpks where tltxcd='9392';
/
BEGIN
IF NOT fwpks_toolkit.fn_gentransactpkg('9392','Y','N','N')
THEN
        dbms_output.put_line('Error! SELECT tlog to know why?');
END IF;
END;
/
select * from tbl_txpks where tltxcd='9392';
rollback;

---

select * from fldmaster where objname = '9293';

select * from fldmaster where objname = '9392';

----
select * from tltxwf where tltxcd = '9392'for update;


select * from search where searchcode = 'FA9392';

select * from searchfld where searchcode = 'FA9392';

select * from search where objname is null;

------
SELECT * FROM 
(SELECT AUTOID,FUNDCODEID, CONTRACTNO, FXAMT, CURRENCY, FRDATE, INTRATE, INTPERIOD, REFSYMBOL 
        FROM GLMASTEXT WHERE ACEXTTYPE IN ('CD', 'TD') AND STATUS = 'P')
        
----------
