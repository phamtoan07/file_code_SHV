select * from search where searchcode = 'FA0041' for update;

select * from searchfld where searchcode = 'FA0041' for update;
   
-----

select * from fastatementgroup where autoid = '816' for update;

select * from fastatement where grid = '816' for update;

update fastatementgroup set status = 'P' where autoid = '816';

update fastatement set status='P'  where grid = '816';

select * from FAFUNDACCTBNK where bankacctno = '333521212';

---
select * from user_source where upper(text) like '%%'

---
select * from log_notify_facb where objname = 'FACBSTATEMENT';

SELECT * from FABANKTRANSFERTX WHERE REFKEY = 'FA.20200311.000001014623';
delete FABANKTRANSFERTX WHERE REFKEY = 'FA.20200311.000001014623';

delete from log_notify_facb where objname = 'FACBSTATEMENT';

select * from syn_cbfa_bankadvicetx where banktxnum = 'FA.20200311.000001014623';

delete from syn_cbfa_bankadvicetx;

---
select * from syn_cbfa_log_notify where objname = 'FACBSTATEMENT_RESULT';
