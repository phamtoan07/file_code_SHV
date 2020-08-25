select * from allcode where cdname = 'SUPRVFUNDTYPE';

select * from allcode where cdname = 'REFCODETYP';

select * from fund; --REFCODETYP -> SUPRVFUNDTYPE, CDTYPE -> SB
--
--O==> OEF
--E==> ETF
--P==>PEN
--C==>CEF
--A==>
--OEF CEF ETF PEN PEF REF ULK MBF IAF OTH
--

SELECT SEARCHCODE,SEARCHCMDSQL FROM search WHERE UPPER ( searchcmdsql) LIKE '%FTYPE%';
SELECT s.position, fieldcode, searchcode FROM searchfld s WHERE UPPER (lookupcmdsql) LIKE '%FTYPE%';

-----
select f.modcode,f.fldname, f.objname,f.llist, f.taglist 
from fldmaster f where upper(LLIST) LIKE '%FTYPE%' OR upper(TAGLIST) LIKE '%FTYPE%';

-----
select * from user_source where upper(TEXT) like '%FTYPE%';

----------SUPRVFUNDTYPE
select * from search where searchcode = 'FUND_9321' for update;

select * from searchfld where searchcode = 'FUND_9321';

----------
select * from fldmaster where objname = '9296' for update;

