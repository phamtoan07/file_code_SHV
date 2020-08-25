SELECT * FROM fadefacct where alias like '6321%' and lev = '4' order by fullname_vn ;

SELECT * FROM fadefacct where alias like '1210%' and lev = '4' order by alias;

select * from fapostmapval where glref like '1210%' 
       and (instcd like 'GB%' or instcd like 'DB%' or instcd like 'DC%') and tltxcd = '9308';

select * from fapostmapval where glref like '1210%' 
       and (instcd like 'MM%' or instcd like 'OF%' or instcd like 'CC%' or instcd like 'ES%') and tltxcd = '9387'

select * from fapostmap where  tltxcd ='9367' and aliascd not in (select alias from fadefacct)
select * from fapostmap where tltxcd ='9367' order by subtxno, dorc desc;

----
SELECT * FROM fadefacct where alias like '5152%' and LEV = '4' order by alias; --51520101

select * from fapostmapval where tltxcd = '9378' and alias like '5152%' for update;

select * from allcode where cdname = 'CFICODE' and CDTYPE = 'SB' and cdval in ('ES','CC','MM','OF') order by LSTODR;

-----

SELECT * FROM fadefacct where alias like '1320%' and LEV = '4' order by alias; --13201010
select * from fapostmapval where tltxcd = '9378' and alias like '1320%' for update;
select * from allcode where cdname = 'CFICODE' and CDTYPE = 'SB' and cdval in ('ES','CC','MM','OF') order by LSTODR;

----
select * from fapostmap where  tltxcd ='9378' and aliascd not in (select alias from fadefacct)

select * from fapostmapexp where tltxcd = '9378' for update;
select * from fapostmapval where tltxcd = '9378';
--------
--insert exp
--EXCH san
--TYPE loai ck
--TYEX san va loaick
--NORM Mac dinh
    delete from fapostmapexp where tltxcd ='9378';
    insert into fapostmapexp (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
    select tltxcd,dorc,aliascd,null ,'DEF','TYPE','DEF','DEF','DEF','DEF',seq_fapostmapexp.NEXTVAL, autoid
    from (
    select tltxcd,dorc,aliascd, max(autoid) autoid
    from fapostmap where tltxcd ='9378' group by tltxcd,aliascd,dorc);
    
--insert val 
--2.1 chi lay san
    delete from fapostmapval where tltxcd ='9322';
    INSERT INTO fapostmapval (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
    select tltxcd,dorc,alias,alias glref,'DEF',a.board,'DEF','DEF','DEF','DEF',seq_fapostmapval.NEXTVAL,refid
        from fapostmapexp f, (select 'EXC' board from dual union all select 'OTC' board from dual ) a
        where tltxcd ='9322';
--2.1.2 chi lay theo co phieu
    delete from fapostmapval where tltxcd ='9378' and alias like '1320%';
    INSERT INTO fapostmapval (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
    select tltxcd,dorc,alias,alias glref,'DEF',a.board,'DEF','DEF','DEF','DEF',seq_fapostmapval.NEXTVAL,refid
        from fapostmapexp f, (
             select 'GB' board from dual union all
             select 'DB' board from dual union all
             select 'DC' board from dual) a
        where tltxcd ='9378' and alias like '1320%';  
--2.2 lay san va loai trai phieu
    12100301    DEF GB
    12100306    DEF DB
    12100307    DEF DC
   -- Trai phieu
  delete from fapostmapval where tltxcd ='9321';
    INSERT INTO fapostmapval (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
    select tltxcd,dorc,alias,alias glref,'DEF',a.board,'DEF','DEF','DEF','DEF',seq_fapostmapval.NEXTVAL,refid
        from fapostmapexp f, 
        (select 'GB.EXC' board from dual union all 
         select 'GB.OTC' board from dual union all
         select 'DB.EXC' board from dual union all
         select 'DB.OTC' board from dual union all
         select 'DC.EXC' board from dual union all
         select 'DC.OTC' board from dual  ) a
        where tltxcd ='9378' and f.alias = '51520101';  
    
   -----Co phieu ES CC MM OF
   delete from fapostmapval where tltxcd ='9378';
    INSERT INTO fapostmapval (TLTXCD,DORC,ALIAS,GLREF,EXPECD,INSTCD,ARAPCD,DEALCD,BANKCD,RESRCD,AUTOID,REFID) 
    select tltxcd,dorc,alias,alias glref,'DEF',a.board,'DEF','DEF','DEF','DEF',seq_fapostmapval.NEXTVAL,refid
        from fapostmapexp f, 
        (select 'ES.EXC' board from dual union all 
         select 'ES.OTC' board from dual union all
         select 'CC.EXC' board from dual union all
         select 'CC.OTC' board from dual union all
         select 'MM.EXC' board from dual union all
         select 'MM.OTC' board from dual union all
         select 'OF.EXC' board from dual union all
         select 'OF.OTC' board from dual  ) a
        where tltxcd ='9378';  
    
-----
select * from fapostmap where tltxcd = '9322';

select * from fapostmapexp where tltxcd = '9322';

select * from  fapostmapval where tltxcd = '9322'; 

------
select * from search where searchcode = 'FA9378';

select * from allcode where cdname = 'CFICODE' and CDTYPE = 'SB' order by LSTODR;
