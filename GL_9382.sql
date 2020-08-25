select * from fldmaster where objname = '9382';

select * from fapostmap where tltxcd = '9382' for update;

select * from fapostmapexp where tltxcd = '9382' for update;

select * from fapostmapval where tltxcd = '9382' order by alias for update;

select * from fapostmapval where tltxcd = '9382' and alias like '1210%' order by alias for update;

select * from fapostmapval where tltxcd = '9382' and alias like '6321%' order by alias for update;


---
select * from search where searchcode = 'FA9382';

select * from search where tltxcd like '%9382%';

------

delete from fapostmapexp where tltxcd ='9382';
insert into fapostmapexp (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
select tltxcd,dorc,aliascd,null ,'DEF','TYEX','DEF','DEF','DEF','DEF',seq_fapostmapexp.NEXTVAL, autoid
from (
    select tltxcd,dorc,aliascd, max(autoid) autoid
    from fapostmap where tltxcd ='9382' group by tltxcd,aliascd,dorc);
    
-----
delete from fapostmapval where tltxcd ='9382' and alias like '1210%';
    INSERT INTO fapostmapval (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
    select tltxcd,dorc,alias,alias glref,'DEF',a.board,'DEF','DEF','DEF','DEF',seq_fapostmapval.NEXTVAL,refid
        from fapostmapexp f, (
             select 'GB.EXC' board from dual union all 
         select 'GB.OTC' board from dual union all
         select 'DB.EXC' board from dual union all
         select 'DB.OTC' board from dual union all
         select 'DC.EXC' board from dual union all
         select 'DC.OTC' board from dual union all
         select 'ES.EXC' board from dual union all 
         select 'ES.OTC' board from dual union all
         select 'CC.EXC' board from dual union all
         select 'CC.OTC' board from dual union all
         select 'MM.EXC' board from dual union all
         select 'MM.OTC' board from dual union all
         select 'OF.EXC' board from dual union all
         select 'OF.OTC' board from dual) a
        where tltxcd ='9382' and alias like '1210%'; 
