select * from allcode where cdname = 'CBTXTYPE' order by lstodr for update;

----
select * from search where searchcmdsql like '%TASU%';
select * from user_source where upper(text) like '%TASU%';

select * from search where searchcmdsql like '%SLPAY%';
select * from user_source where upper(text) like '%SLPAY%';

--==> gộp 9213, 9219
--====list xoa + change cdval, cdcont
--TASU -> xóa  
--TARD -> cdcont     (Redemption payment OEF )
--TAEX -> cdcont     (Payment of excess subscription (OEF) )
--TAFS,TAFR -> TAFSR (Fee payment OEF)
--TATAX -> cdcont    (Tax payment OEF)
--TADFS
--TATFS -> cdcont
--ETFRD -> cdcont     (Redemption payment ETF)
--ETFEX -> cdcont     (Payment of excess subscription (ETF) )
--ETFFS, ETFFR -> ETFFSR  (Fee payment ETF)
--ETFTAX -> cdcont        (Tax payment ETF)
--CLS, OPN giữ nguyên
--SEVFEE -> cdcont        (Service contract fee payment)
--PENFS,PENFR -> PENFSR   (Fee payment pension fund)
--PENTAX,PENVI,PENRD -> cdcont
--SLPAY
--CAREC, CAREB ,CARRI ko lên 6639 (CB)
--LICLSED,LICLSEC
--LISEFEEC,LISEFEED -> LISEFEECD (Broker fee payment)
--ODDEXC -> cho vào other
--CABUYR -> cdcont     (Payment to buy Right)
--CDPAY  -> cdcont
--OTCPAY -> cdcont
--RACTPAY,RACTFEE -> cho vào other
--TDM    -> cdcont
--FUTURE -> cdcont
--TRANSFEE,OTHERS -> cdcont

---
select * from search where searchcmdsql like  '%LISEFEED%';

select * from search where tltxcd in ('9213','9219');

select * from search where searchcode = 'FA0017' for update;
select * from searchfld where searchcode = 'FA0017' for update;

select * from fldmaster where objname = '9213' for update;
select * from search where searchcode = 'FABANKTRANSFERTX_DR';
select * from FUND;

select * from fapostmap where tltxcd in ('9213','9219');

select * from cmdmenu where mnviewcode in ('FA0017','FA0019') for update;

----
update fabankadvicetx set type = 'PENFSR' where type in ('PENFS','PENFR');
update fabanktransfertx set type = 'PENFSR' where type in ('PENFS','PENFR');

update fastatement set txtype = 'ETFFSR' where txtype in ('ETFFS','ETFFSR');
update fastatementgroup set txtype = 'ETFFSR' where txtype in ('ETFFS','ETFFSR');

---

select * from search where searchcode in ('FA0034') for update;

select * from fldmaster where objname = '9274';

select * from search where searchcode = 'FADEBITACSET';
---
select * from search where tltxcd in ('9214','9218');
---
FN_GET_SETTLEMENTDATE
--TAFS,TAFR -> TAFSR 
select * from user_source where upper(text) like '%TAFS%' OR upper(text) like '%TAFR%';
--PENFS,PENFR -> PENFSR
select * from user_source where upper(text) like '%PENFS%' OR upper(text) like '%PENFR%';
--ETFFS, ETFFR -> ETFFSR
select * from user_source where upper(text) like '%ETFFS%' OR upper(text) like '%ETFFR%';
----
select * from fldmaster where objname = '9238';
select * from search where searchcode = 'FADEBITBANKTF';

select INSTR('FA.20200508.1214565895','CB.') from dual;
select INSTR('CB.','CB.20200508.1214565895') from dual;
