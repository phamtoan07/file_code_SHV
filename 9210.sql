select * from fldmaster where objname = '9210';

select * from search where searchcode like '%FA8686%';

select * from searchfld where searchcode like '%FA8686%';

select * from searchtxmapfld where tltxcd = '9210';

select * from FUND order by symbol;

SELECT CODEID VALUECD, CODEID VALUE, SYMBOL DISPLAY, SYMBOL EN_DISPLAY, SYMBOL DESCRIPTION FROM FUND ORDER BY SYMBOL;

----Manage customer

select * from search where en_searchtitle like 'Management of customer';

select * from fldmaster where objname like '%FAOBJECT';

select * from FAOBJECT order by fundcodeid for update; --> 1 quy co nhieu customer

----Giao dich manual
select * from search where searchcode = 'FA9210'; --> Chon refid --> Load customer name???

----

select * from grmaster where en_grcaption like '%Organization';

select * from search where searchcode LIKE '%MEMBERS%';

------
select * from search where en_searchtitle like 'Management of Fund information';

select * from FMEMBERS;
