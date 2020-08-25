select * from search where searchcode = 'FA0048' for update;
select * from searchfld where searchcode = 'FA0048' for update;
select * from fldmaster where objname = '9349' for update;
select * from cmdmenu where objname = 'FA0048';

-------
select * from tltx where tltxcd = '9349' for update;
select * from fldmaster where objname = '9349' for update;

--------
select * from fapostmap where tltxcd = '9349';
