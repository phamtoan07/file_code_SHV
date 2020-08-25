select * from search where searchcode = 'FA0053';

select * from searchtxmapfld where searchcode = 'FA0053';

select * from searchtxmapfld where tltxcd = '9357';-- GT dinh gia TAMT, PROFITAMT, LOSSAMT

select * from fldmaster where objname = '9353'; --BALANCE Contract value in VND

SELECT * FROM ALLCODE WHERE CDTYPE='FA' AND CDNAME='OEFTYPE';

------
select * from fldmaster where objname = '9355';

select * from fldval where objname = '9355';

select * from fldmaster where objname = '9356';

select * from searchtxmapfld where tltxcd = '9355';

select * from searchtxmapfld where tltxcd = '9356';

select * from searchtxmapfld where tltxcd = '9358';

----
select * from tltx where tltxcd in ('9357','9358');

-----

select * from searchtxmapfld where tltxcd = '9354';

select * from searchtxmapfld where tltxcd = '9358';

---
select * from fldmaster where objname = '9358';
