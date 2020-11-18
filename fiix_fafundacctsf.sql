select * from fldmaster where objname = '9260' and fldname in('02','21','06') for update;

SELECT AUTOID VALUECD, AUTOID VALUE, CREATEDBY DISPLAY, CREATEDBY EN_DISPLAY, CREATEDBY DESCRIPTION 
FROM FAFUNDACCTSF where CREATEDBY <> ' ' 

select * from search where searchcode = 'FAACCTSF';
select * from searchfld where searchcode = 'FAACCTSF' for update;


SELECT A.DESCRIPTION, A.FUNDCODEID, C.SYMBOL, A.CUSTODYCD,A.AUTOID,C.NAME FUNDNAME, A0.EN_CDCONTENT TYPEBNK,
       M.MBNAME, R.MEMBERCODE, A2.EN_CDCONTENT ROLE,
       BNK.AUTOID REFFUNDACCT, M.AUTOID MBID
FROM FAFUNDACCTSF A, FUND C, FAFUND B, FAFUNDACCTBNK BNK, ALLCODE A0, MEMBERS M, ROLES R, ALLCODE A2
WHERE B.FUNDCODEID=C.CODEID
AND A.FUNDCODEID=C.CODEID
AND A.REBANK = BNK.AUTOID
AND BNK.MBID = M.AUTOID
AND M.AUTOID = R.MBID AND R.ROLECODE = 'SC'
AND A0.CDNAME = 'TYPE' AND A0.CDTYPE = 'FA' AND A0.CDVAL = BNK.TYPE
AND A2.CDTYPE = 'SA' AND A2.CDNAME = 'ROLECODE' AND A2.CDVAL = R.ROLECODE

select * from FAFUNDACCTSF where autoid in ('222','223','224');

select distinct * from tltx where tltxcd in (select objname from fldmaster where searchcode = 'FAACCTSF');

select * from fldmaster where searchcode = 'FAACCTSF' and objname = '9249';

select * from search where tltxcd like '%9308%' or tltxcd like '%929ư%' or tltxcd like '%9293%';
select * from search where searchcode = 'FA0089';
select * from searchfld where searchcode = 'FA0087';
select * from searchtxmapfld where searchcode = 'FA8686' and tltxcd = '9254';



select * from fldmaster where objname = '9249' order by odrnum --  and (fldname = '06' or lookupname like '%06%');
update fldmaster set defval = null where objname = '9249' and fldname = '21' -- FAACCTSF --FA0087
select * from fldmaster where objname = '9255' order by odrnum;--and (fldname = '66' or lookupname like '%66%');  --FAACCTSFDISTINCT
select * from search where searchcode = 'FA0087';
select * from searchfld where searchcode = 'FA0087' order by position for update;
select * from searchtxmapfld where searchcode = 'FA0087' order by tltxcd for update;
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9255' and fldname = '66';
---done

select * from fldmaster where objname = '9254' order by odrnum -- and (fldname = '66' or lookupname like '%66%');  --FAACCTSFDISTINCT
select * from fldmaster where objname = '9256' order by odrnum --and (fldname = '66' or lookupname like '%66%');  --FAACCTSFDISTINCT --FA0089
select * from fldmaster where objname = '9258' order by odrnum --and (fldname = '66' or lookupname like '%66%');  --FAACCTSFDISTINCT --FA0089
select * from fldmaster where objname = '9250' order by odrnum --and (fldname = '66' or lookupname like '%66%');  --FAACCTSFDISTINCT --FA0089
select * from search where tltxcd like '%9250%' or tltxcd like '%9254%' or tltxcd like '%9256%' or tltxcd like '%9258%';

update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9250' and fldname = '66';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9254' and fldname = '66';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9256' and fldname = '66';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9258' and fldname = '66';



select * from fldmaster where objname = '9290' order by odrnum --and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --FA0086
select * from fldmaster where objname = '9294' order by odrnum --and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT  --FA0086
select * from search where tltxcd like '%9290%' or tltxcd like '%9294%';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9290' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9294' and fldname = '06';

select * from fldmaster where objname = '9291' and (fldname = '04' or lookupname like '%04%'); -- FAACCTSF
select * from fldmaster where objname = '9292' order by odrnum-- and (fldname = '06' or lookupname like '%06%'); -- FAACCTSF
select * from fldmaster where objname = '9293' order by odrnum --and (fldname = '06' or lookupname like '%06%'); -- FAACCTSF
select * from search where tltxcd like '%9291%' or tltxcd like '%9292%' or tltxcd like '%9293%';
update fldmaster set defval = null where objname = '9292' and fldname = '21' ;
update fldmaster set defval = null where objname = '9293' and fldname = '21' ;

select * from fldmaster where objname = '9308' order by odrnum --and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --FA1002
select * from fldmaster where objname = '9319' order by odrnum --and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9308' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9319' and fldname = '06';

select * from fldmaster where objname = '9312' order by odrnum -- and (fldname = '06' or lookupname like '%06%') for update; -- FAACCTSF --
select * from search where tltxcd like '%9312%' ;


select * from fldmaster where objname = '9336' order by odrnum -- and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --
select * from fldmaster where objname = '9338' order by odrnum--and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --
select * from fldmaster where objname = '9337' order by odrnum--and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --
select * from fldmaster where objname = '9340' order by odrnum--and (fldname = '04' or lookupname like '%04%'); -- FAACCTSFDISTINCT --
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9336' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9338' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9337' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9340' and fldname = '04';
select * from search where tltxcd like '%9336%' or tltxcd like '%9338%' or tltxcd like '%9337%' or tltxcd like '%9340%';


select * from fldmaster where objname = '9331' order by odrnum for update;-- and (fldname = '06' or lookupname like '%06%') for update; -- FAACCTSF --
select * from search where tltxcd like '%9331%';

select * from fldmaster where objname = '9376' order by odrnum-- and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --
select * from fldmaster where objname = '9387' order by odrnum--and (fldname = '06' or lookupname like '%06%'); -- FAACCTSFDISTINCT --
select * from fldmaster where objname = '9396' order by odrnum for update--and (fldname = '66' or lookupname like '%66%'); -- FAACCTSFDISTINCT --
select * from fldmaster where objname = '9397'  and (fldname = '66' or lookupname like '%66%'); -- FAACCTSFDISTINCT --
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9376' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9387' and fldname = '06';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9396' and fldname = '66';
update fldmaster set searchcode = 'FAACCTSFDISTINCT' where objname = '9397' and fldname = '66';


select * from fldmaster where objname = '9460' order by odrnum-- and (fldname = '06' or lookupname like '%06%') for update; -- FAACCTSF --

-----------
select * from FAFUNDACCTSF;
select * from search where upper(searchcmdsql) like'%FAFUNDACCTSF%';

----
select * from user_source where upper(text) like'%FAFUNDACCTSF%';

