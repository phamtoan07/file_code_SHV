select * from fldmaster where objname like '%SBISSUERGRP%';

select distinct * from allcode a where a.cdtype='SB' and a.cdname='ISSGRPTYPE';


select * from maintain_log order by autoid desc;

select * from objlog order by autoid desc;

select childvalue,childkey,chiltable
   --into l_childvalue,l_childkey,l_chiltable
   from objlog where autoid = '11830';

select * from SBISSUERGRP where autoid = '1782';

select * from SBISSUERGRPDTL where grpid = '1782';

select * from search where searchcode LIKE '%SBISSUERGRPDTL%';


SELECT * FROM objlog WHERE (AUTOID = l_refobjid OR PAUTOID =l_refobjid) AND (TXSTATUS = '4' or txstatus = '7') ORDER BY autoid

delete from SBISSUERGRPDTL where grpid = '1782';

---
select * from user_source where upper(text) like '%INSERT INTO OBJLOG%';
---

SELECT TO_NUMBER(fn_GetNextAutoidFromTable('AUTOID','SBISSUERGRPDTL',0)) AUTOID FROM dual
