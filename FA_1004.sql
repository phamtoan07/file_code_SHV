select cnf.*,
A1.EN_Cdcontent CATYPECONTENT, A2.EN_Cdcontent CATYPECFCONTENT,
A3.EN_Cdcontent TYPEOFACCCONTENT, f.SYMBOL, f.CODEID
from allcode A1, allcode A2, allcode A3, fund f,
(
select cf.*, ca.catype, ca.OPTSYMBOL, ca.exdividend, ca.exprice,0 GLAUTOID,
f.codeid fundcodeid,ca.caqtty balance,ca.caqtty GLQTTY,ca.optsymbol refsymbol, ca.description DESCRIPTION,0 fee,0 tax,
null cficode, null board, 0 totalamt
from cbfaconfirmca cf, facamast ca, fund f
where cf.camastid = ca.camastid
and cf.custodycd = f.custodycd 
and catype IN ('011', '021','014','024','020','017','023')--Phan bo cp,tp
and cf.status = 'P'
and cf.catypecf  = 'A'
) cnf
WHERE A1.CDTYPE = 'CA' and A1.CDNAME = 'CATYPE' and A1.CDVAL = cnf.catype
and A2.CDTYPE = 'FA' and A2.CDNAME = 'CATYPECF' and A2.CDVAL = cnf.catypecf
and A3.CDTYPE = 'FA' and A3.CDNAME = 'TYPEOFACC' and A3.CDVAL = cnf.typeofacc
and f.CUSTODYCD = cnf.custodycd
and f.codeid = cnf.FUNDCODEID

-----
select * from search where searchcode = 'FA1004' for update;

select * from searchfld where searchcode = 'FA1004' for update;

select * from searchtxmapfld where searchcode = 'FA1004' and tltxcd = '9384' for update;

----
select * from cmdmenu where prid = '927120' for update;

----1003

select * from search where searchcode = 'FA1005' for update;

select * from searchfld where searchcode = 'FA1005' for update;


---

select * from cmdmenu where prid = '927230' for update; 927251 ---

---

select * from searchtxmapfld where tltxcd = '9384';

select position, fieldcode, fldcd from searchfld where searchcode = 'FA1004' for update;

----
select * from searchtxmapfld where searchcode = 'FA1005';
