select * from allcode where cdname = 'CBTXTYPE' and cdtype = 'SB' ORDER BY LSTODR for update;

select * from allcode where cdname = 'CBTXTYPE' and cdtype = 'CB' ORDER BY LSTODR for update;

select * from allcode where cdname = 'CBTXTYPE' and cdtype = 'CF' ORDER BY LSTODR for update;

select * from allcode where cdname = 'CBTXTYPE' and cdtype = 'SA' for update;

select * from allcode where cdname = 'CBTXTYPE' for update;

select * from search where tltxcd in ('9213','9217','9219','9218');

select * from allcode where cdname = 'CBTXTYPE' for update and cdval in ('TARD','ETFRD');

update fastatementgroup set status = 'R' where autoid in ('1049','1048','1047','1046','1045','1044');

update fastatement set txtype = 'PENFS' where txtype = 'PENS';
update fastatementgroup set txtype = 'PENFS' where txtype = 'PENS';

update fastatement set txtype = 'PENFR' where txtype = 'PENR';
update fastatementgroup set txtype = 'PENFR' where txtype = 'PENR';
----
select * from search where tltxcd in ('9213','9217','9219');

select * from search where searchcode = 'FA0017' for update;--
select * from searchfld where searchcode = 'FA0017' order by position for update;
select * from fldmaster where objname = '9213' order by odrnum;

select * from fapostmap where tltxcd = '9213';

----
select * from search where searchcode = 'FA0019' for update;--
select * from searchfld where searchcode = 'FA0019' order by position for update;
select * from fldmaster where objname = '9219' order by odrnum for update;--
select * from fapostmap where tltxcd = '9219';

--- FA0021
select * from search where searchcode = 'FA0021' for update;--
select * from searchfld where searchcode = 'FA0021' order by position for update;--
select * from fldmaster where objname = '9217' order by odrnum for update;--

select * from fapostmap where tltxcd = '9217';
--- FA0018
select * from search where searchcode = 'FA0018' for update;--
select * from searchfld where searchcode = 'FA0018' order by position for update;--
select * from fldmaster where objname = '9218' order by odrnum for update;--

select * from fapostmap where tltxcd = '9218' for update;
