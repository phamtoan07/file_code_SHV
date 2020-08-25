select * from crphysagree;

select * from fldmaster where objname = '1407';

select * from search where searchcode = 'CRPHYSAGREE_ROLL' for update;
select * from searchfld where searchcode = 'CRPHYSAGREE_ROLL' for update;

select * from fldmaster where objname = '1407' for update;

select * from deferror where errnum = '-900019';

-----
alter table crphysagree add rollid VARCHAR2(10);

-----

delete tbl_txpks where tltxcd='1407';
/
BEGIN
IF NOT fwpks_toolkit.fn_gentransactpkg('1407','Y','N','N')
THEN
        dbms_output.put_line('Error! SELECT tlog to know why?');
END IF;
END;
/
select * from tbl_txpks where tltxcd='1407';
rollback;
