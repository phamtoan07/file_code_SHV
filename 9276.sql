select * from tltx where tltxcd = '9276';

select * from fldmaster where objname = '9276' for update;

select * from fldval where objname = '9276'

select * from search where searchcode like '%FUND%';

SELECT * FROM SEARCH WHERE SEARCHCODE = 'FAFUNDACCTBNK_EX'

SELECT * FROM SEARCHFLD WHERE SEARCHCODE = 'FAFUNDACCTBNK_EX' for update;

SELECT * FROM FLDMASTER where SEARCHCODE = 'FAFUNDACCTBNK_EX';

SELECT * FROM CMDMENU WHERE OBJNAME = 'FAFUNDACCTBNK_EX';


select * from search where searchcode like '%FAOBJECT%'; 

SELECT * from searchfld where searchcode like '%FAOBJECT%'; 

