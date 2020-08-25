select * from fapostmap where tltxcd = '9268';

select * from fapostmap where tltxcd = '9371';

---------------

select * from fapostmap where tltxcd = '9349' for update;

select * from fapostmapexp where tltxcd = '9349'; --13201010

select * from fapostmapval where tltxcd = '9349'; --33710000



--------------

select * from fapostmap where tltxcd = '9223' for update;

select * from fapostmap where tltxcd = '9214';


---------------
--fn_get_sub_9210 -- fn_get_redem_9210

select * from fldmaster where objname = '9419' for update;
select * from fldval where objname = '9419' for update;

select * from fapostmap where tltxcd = '9419' for update

select * from fapostmapexp where tltxcd = '9419';

select * from fapostmapval where tltxcd = '9419';

select * from fadefacct where alias like '%3371%';


select * from search where searchcode = 'APETF';

--------
select * from search where tltxcd in ('9274','9275');

select * from fldmaster where objname = '9274' for update;

select * from fldval where objname = '9274' for update; --fn_chk_fund_9274 --FN_CHK_AP_9274

select * from fapostmap where tltxcd = '9274' for update;

select * from search where searchcode = 'FA0034' for update;

---------
select * from fldmaster where objname = '9210' for update;
